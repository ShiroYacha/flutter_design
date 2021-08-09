import 'dart:io';

import 'package:build/build.dart';
import 'package:collection/collection.dart';
import 'package:recase/recase.dart';
import 'package:yaml/yaml.dart';

import 'design.dart';

final _debugMode = true;
void _logIfDebug(String log, {String step = ''}) {
  if (_debugMode) {
    print('====> ${step.isNotEmpty ? step : '(uknown step)'}:   $log');
  }
}

extension YamlMapExtension on YamlMap {
  T get<T>(String key) {
    _logIfDebug('inspecting key = $key', step: '(yaml)');
    if (T == double && this[key] is int) {
      return (this[key] as int).toDouble() as T;
    }
    return this[key] as T;
  }

  T? getMaybe<T>(String key) {
    _logIfDebug('inspecting key = $key', step: '(yaml)');
    return this[key] as T?;
  }

  YamlMap on<T>(String key, void Function(T) callback) {
    if (this[key] is T) {
      callback(this[key] as T);
    }
    return this;
  }
}

const kDefaultSupportedThemeModeBrightnessMap = {
  'darkmode': 'dark',
  'lightmode': 'light'
};

class DesignBuilder implements Builder {
  String? _defaultTheme;
  final Map<String, ThemeElement> _themeMap = {};
  final Map<String, PaletteCategory> _paletteCategoryMap = {};
  final Map<String, TextStyleElement> _textStyleMap = {};

  @override
  Future build(BuildStep buildStep) async {
    var inputId = buildStep.inputId;

    // read yaml design declaration file
    dynamic yaml = loadYaml(await buildStep.readAsString(inputId));
    _logIfDebug('YAML = $yaml', step: 'build');

    // generate code
    final code = _generateDesignCode(yaml);

    // Write out the dart file
    var id = inputId.changeExtension('.dart');
    await buildStep.writeAsString(id, code);
  }

  @override
  final buildExtensions = const {
    '.design.yaml': ['.design.dart']
  };

  String _generateDesignCode(dynamic yaml) {
    final sb = StringBuffer();
    sb.writeAll(<String>[
      _renderHeader(),
      _renderImports(),
      _renderThemeModeCode(yaml['theme_modes'] as YamlMap?),
      _renderPaletteCode(yaml['palette'] as YamlMap?),
      _renderTextStyleCode(yaml['text_styles'] as YamlMap?),
      _renderThemeDataCode(yaml['theme_data'] as YamlMap?),
      _renderPaddingCode(yaml['padding'] as YamlMap?),
      _renderWidgetCode(yaml['widgets'] as YamlMap?),
    ], '\n');
    return sb.toString();
  }

  String _renderHeader() {
    return '''
/// GENERATED CODE, DO NOT MODIFY THIS FILE!
/// 
''';
  }

  String _renderImports() {
    return '''
import 'package:flutter/material.dart';
''';
  }

  String _renderThemeModeCode(YamlMap? themeModeYaml) {
    _logIfDebug('Begin', step: '_renderThemeModeCode');
    final sb = StringBuffer();
    if (themeModeYaml == null) return sb.toString();
    // Compute theme modes
    //  - cache the theme modes for later usage
    _themeMap.clear();
    final supportedKeys = themeModeYaml.keys
        .cast<String>()
        .where((k) => kDefaultSupportedThemeModeBrightnessMap.containsKey(k))
        .toList();
    for (final key in supportedKeys) {
      _themeMap[key] = ThemeElement(name: key, basedOn: null);
      if (_defaultTheme == null || themeModeYaml[key] == 'default') {
        _defaultTheme = key;
      }
    }
    _logIfDebug('_defaultTheme = $_defaultTheme', step: '_renderThemeCode');

    //  - process the basedOn relationship
    for (final key in supportedKeys) {
      final basedOn = themeModeYaml[key] is YamlMap
          ? themeModeYaml.get<YamlMap>(key).get<String?>('basedOn')
          : null;
      if (basedOn != null) {
        _themeMap[key]!.basedOn = _themeMap.values
            .firstWhereOrNull((element) => element.name == basedOn);
      }
    }
    _logIfDebug('_themeElementMap = $_themeMap', step: '_renderThemeCode');
    return sb.toString();
  }

  String _renderPaletteCode(YamlMap? paletteYaml) {
    _logIfDebug('Begin', step: '_renderPaletteCode');
    final sb = StringBuffer();
    if (paletteYaml == null) return sb.toString();
    sb.writeln('''/// Palette ''');

    _paletteCategoryMap.clear();
    // Parse palette category and elements
    for (final categoryName in paletteYaml.keys.cast<String>()) {
      final category = PaletteCategory(name: categoryName, items: {});
      final paletteYamlMap = paletteYaml.get<YamlMap>(categoryName);
      final elementMap = {
        for (final key in paletteYamlMap.keys.cast<String>())
          key: paletteYamlMap[key] is int
              ? PaletteElement(
                  name: key,
                  category: category,
                  colorHex:
                      '0x${_parsePaletteElementColor(paletteYamlMap[key], null).toRadixString(16)}')
              : PaletteElement(name: key, category: category, colorHexMap: {
                  for (final theme in _themeMap.values)
                    theme:
                        '0x${_parsePaletteElementColor(paletteYamlMap[key], theme).toRadixString(16)}'
                })
      };
      _paletteCategoryMap[categoryName] = category..items.addAll(elementMap);
    }
    // Create colors
    for (final category in _paletteCategoryMap.values) {
      for (final element in category.items.values) {
        if (element.colorHex != null) {
          sb.writeln(
              '''const Color ${category.name.toLowerCase()}${element.name.pascalCase} = Color(${element.colorHex});''');
        } else if (element.colorHexMap != null) {
          for (final theme in element.colorHexMap!.keys) {
            sb.writeln(
                '''const Color ${category.name.toLowerCase()}${element.name.pascalCase}${theme.name.pascalCase} = Color(${element.colorHexMap![theme]});''');
          }
        }
      }
    }
    return sb.toString();
  }

  String _renderTextStyleCode(YamlMap? textYaml) {
    _logIfDebug('Begin', step: '_renderTextCode');
    final sb = StringBuffer();
    if (textYaml == null) return sb.toString();
    sb.writeln('''/// Text ''');

    // Parse text style elements
    _textStyleMap.clear();
    for (var name in textYaml.keys.cast<String>()) {
      final textYamlElement = textYaml.get<YamlMap>(name);
      _textStyleMap[name] = TextStyleElement(
        name: name,
        color:
            _locatePaletteElementByCode(textYamlElement.get<String>('color'))!,
        fontWeight: textYamlElement.get<String>('weight'),
        size: textYamlElement.get<double>('size'),
      );
    }

    // Rendering
    for (var textStyle in _textStyleMap.values) {
      if (textStyle.color.isSingleColor) {
        sb.writeln(textStyle.renderCode(null));
      } else {
        for (var themeName in _themeMap.keys) {
          sb.writeln(textStyle.renderCode(themeName));
        }
      }
    }

    return sb.toString();
  }

  String _renderThemeDataCode(YamlMap? themeDataYaml) {
    _logIfDebug('Begin', step: '_renderThemeDataCode');
    final sb = StringBuffer();
    if (themeDataYaml == null) return sb.toString();
    sb.writeln('''/// Theme ''');

    _themeMap.forEach((themeName, value) {
      // Parse color mappings
      final themeColorMappings = themeDataYaml.get<YamlMap>('color');
      final themeDataColorStatements = _renderColorStatementUsingCode(
          themeColorMappings, themeName, _renderColorVariableNameUsingCode);

      // Parse font mappings
      final themeFontMappings = themeDataYaml.get<YamlMap>('font');
      final themeDataFontStatements = themeFontMappings.keys
          .cast<String>()
          .map((k) => '''$k: \'${themeFontMappings[k]}\',''')
          .toList();

      // Parse text mappings
      final themeTextThemeMappings = themeDataYaml.get<YamlMap>('text');
      final themeDataTextThemeStatements = themeTextThemeMappings.keys
          .cast<String>()
          .map((k) =>
              '''$k: ${_textStyleMap[themeTextThemeMappings.get<String>(k)]!.renderVariableName(themeName)},''')
          .toList();

      // Rendering
      sb.writeln('''final ${themeName}ThemeData = ThemeData(
  brightness: Brightness.${kDefaultSupportedThemeModeBrightnessMap[themeName]},
  // Color
  ${themeDataColorStatements.join('\n  ')}
  // Font
  ${themeDataFontStatements.join('\n  ')}
  // Text theme
  textTheme: TextTheme(
    ${themeDataTextThemeStatements.join('\n    ')}
  ),
);\n''');
    });
    return sb.toString();
  }

  List<String> _renderColorStatementUsingCode(
      YamlMap themeColorMappings,
      String themeName,
      String Function(String code, String themeName) statementBuilder) {
    return themeColorMappings.keys.cast<String>().map((k) {
      final sb = StringBuffer();
      themeColorMappings.on<String>(k, (stringKey) {
        // If a direct color string is provided
        //   e.g. primaryColor: primary.default
        sb.write('''$k: ${statementBuilder(stringKey, themeName)},''');
      }).on<YamlMap>(k, (modeMap) {
        // If a theme mode color string map is provided
        //   e.g. canvasColor:
        //          lightmode: grayscale.background
        //          darkmode: grayscale.line
        for (var mode in modeMap.keys.cast<String>()) {
          if (mode == themeName) {
            sb.write(
                '''$k: ${statementBuilder(modeMap.get<String>(mode), themeName)},''');
          }
        }
      });
      return sb.toString();
    }).toList();
  }

  PaletteElement? _locatePaletteElementByCode(String code) {
    final labelParts = code.split('.');
    return _paletteCategoryMap[labelParts[0]]?.items[labelParts[1]];
  }

  String _renderColorVariableNameUsingCode(String code, String themeName) {
    final palette = _locatePaletteElementByCode(code);
    if (palette == null) {
      return '?, //ERROR: stringKey = $code, reason: palette == null';
    }
    try {
      return palette.formatVariableName(themeName);
    } on Exception catch (e) {
      return '?, //ERROR: stringKey = $code, reason: $e';
    }
  }

  String _renderPaddingCode(YamlMap? paddingYaml) {
    _logIfDebug('Begin', step: '_renderPaddingCode');
    final sb = StringBuffer();
    if (paddingYaml == null) return sb.toString();
    sb.writeln('''/// Padding ''');

    const orientationLabelMap = {
      'all': [''],
      'symmetric': ['horizontal', 'vertical'],
      'only': ['top', 'left', 'right', 'bottom'],
    };
    String paddingSizeLabel(String label) => 'paddingSize${label.pascalCase}';
    // Precompute orientation labels
    final sizeLabels = paddingYaml.keys.cast<String>().toList();
    // Create sizes
    for (final label in sizeLabels) {
      sb.writeln(
          '''const double ${paddingSizeLabel(label)} = ${paddingYaml[label]};''');
    }
    sb.writeln();
    final suffixes = <String>[];
    const edgeInsetPrefix = 'edgeInset';
    // Create edgeInsets
    for (final label in sizeLabels) {
      final labelPascalCase = label.pascalCase;
      final value = paddingSizeLabel(label);
      for (final method in orientationLabelMap.keys) {
        for (final attribute in orientationLabelMap[method]!) {
          final suffix = '$attribute$labelPascalCase';
          sb.writeln(
              '''const $edgeInsetPrefix$suffix = EdgeInsets.$method(${attribute.isEmpty ? value : '$attribute: $value'});''');
          suffixes.add(suffix);
        }
      }
    }
    sb.writeln();
    // Create pad methods
    for (final suffix in suffixes) {
      sb.writeln(
          '''Widget pad$suffix(Widget child) => Padding(padding: $edgeInsetPrefix$suffix, child: child);''');
    }
    sb.writeln();
    // Create widget extension padding methods
    sb.writeln('''extension WidgetPaddingExtension on Widget {''');
    for (final suffix in suffixes) {
      sb.writeln(
          '''Widget pad$suffix() => Padding(padding: $edgeInsetPrefix$suffix, child: this);''');
    }
    sb.writeln('''}''');
    return sb.toString();
  }

  int _parsePaletteElementColor(dynamic paletteYamlMap, ThemeElement? theme) {
    if (paletteYamlMap is int) {
      return paletteYamlMap;
    }
    if (paletteYamlMap is YamlMap) {
      // If directly specified or via basedOn, use the theme color;
      // otherwise, use the first color
      assert(paletteYamlMap.keys.isNotEmpty);
      final selectedTheme = paletteYamlMap.keys.cast<String>().firstWhere(
          (themeName) =>
              theme?.name == themeName || theme?.basedOn?.name == themeName,
          orElse: () => paletteYamlMap.keys.first as String);
      return paletteYamlMap[selectedTheme] as int;
    }
    throw Error(); // Bad palette element format
  }

  String _renderWidgetCode(YamlMap? widgetYaml) {
    _logIfDebug('Begin', step: '_renderWidgetCode');
    final sb = StringBuffer();
    if (widgetYaml == null) return sb.toString();
    sb.writeln('''/// Widgets ''');

    final widgetDirectory = Directory('lib/widgets');
    if (!widgetDirectory.existsSync()) {
      widgetDirectory.createSync();
    }
    for (var key in widgetYaml.keys.cast<String>()) {
      final file = File('lib/widgets/$key.dart');
      if (!file.existsSync()) {
        file.writeAsString('''
part \'$key.g.dart\';

class ${key.pascalCase} extends String {

}
''');
      }
    }

    return sb.toString();
  }
}
