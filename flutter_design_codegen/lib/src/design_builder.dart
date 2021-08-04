import 'package:build/build.dart';
import 'package:collection/collection.dart';
import 'package:yaml/yaml.dart';

import 'design.dart';
import 'extension.dart';

const kDefaultSupportedThemeModeBrightnessMap = {
  'darkmode': 'dark',
  'lightmode': 'light'
};

class DesignBuilder implements Builder {
  Map<String, ThemeElement> _themeElementMap = {};
  Map<String, PaletteCategory> _paletteCategoryMap = {};

  @override
  Future build(BuildStep buildStep) async {
    var inputId = buildStep.inputId;

    // read yaml design declaration file
    dynamic yaml = loadYaml(await buildStep.readAsString(inputId));

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
      _renderThemeCode(yaml['theme'] as YamlMap?),
      _renderPaletteCode(yaml['palette'] as YamlMap?),
      _renderPaddingCode(yaml['padding'] as YamlMap?),
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

  String _renderThemeCode(YamlMap? themeYaml) {
    final sb = StringBuffer();
    if (themeYaml == null) return sb.toString();
    sb.writeln('''/// Theme ''');
    // Compute theme modes
    //  - cache the theme modes for later usage
    _themeElementMap = <String, ThemeElement>{};
    final themeModes = themeYaml['modes'] as YamlMap;
    final supportedKeys = themeModes.keys
        .cast<String>()
        .where((k) => kDefaultSupportedThemeModeBrightnessMap.containsKey(k))
        .toList();
    for (final key in supportedKeys) {
      _themeElementMap[key] = ThemeElement(name: key, basedOn: null);
    }
    //  - process the basedOn relationship
    for (final key in supportedKeys) {
      final basedOn = themeModes[key]?['basedOn'] as String?;
      if (basedOn != null) {
        _themeElementMap[key]!.basedOn = _themeElementMap.values
            .firstWhereOrNull((element) => element.name == basedOn);
      }
    }
    // Compute theme data for dark, light brightness mode
    _themeElementMap.forEach((key, value) {
      final themeMappings = themeYaml['mappings'] as YamlMap;
      // Color mappings
      final themeColorMappings = themeMappings['color'] as YamlMap;
      final themeDataColorStatements =
          themeColorMappings.keys.cast<String>().map((k) {
        final labelParts = (themeColorMappings[k] as String).split('.');
        var label = labelParts[0];
        for (var labelPart in labelParts.skip(1)) {
          label += labelPart.pascalCase;
        }
        return '''$k: $label${key.pascalCase},''';
      }).toList();
      // Font mappings
      final themeFontMappings = themeMappings['font'] as YamlMap;
      final themeDataFontStatements = themeFontMappings.keys
          .cast<String>()
          .map((k) => '''$k: \'${themeFontMappings[k]}\'''')
          .toList();
      // Text mappings
      sb.writeln('''final ${key}ThemeData = ThemeData(
  brightness: Brightness.${kDefaultSupportedThemeModeBrightnessMap[key]},
  // Color
  ${themeDataColorStatements.join('\n  ')}
  // Font
  ${themeDataFontStatements.join('\n  ')}
);''');
    });
    return sb.toString();
  }

  String _renderPaletteCode(YamlMap? paletteYaml) {
    final sb = StringBuffer();
    if (paletteYaml == null) return sb.toString();
    sb.writeln('''/// Palette ''');
    _paletteCategoryMap = {};
    // Parse palette category and elements
    for (final category in paletteYaml.keys.cast<String>()) {
      final paletteYamlMap = paletteYaml[category] as YamlMap;
      final elementMap = {
        for (final key in paletteYamlMap.keys.cast<String>())
          key: PaletteElement(name: key, colorHex: {
            for (final theme in _themeElementMap.values)
              theme:
                  '0x${_parsePaletteElementColor(paletteYamlMap[key], theme).toRadixString(16)}'
          })
      };
      _paletteCategoryMap[category] =
          PaletteCategory(name: category, items: elementMap);
    }
    // Create colors
    for (final category in _paletteCategoryMap.values) {
      for (final element in category.items.values) {
        for (final theme in element.colorHex.keys) {
          sb.writeln(
              '''const Color ${category.name.toLowerCase()}${element.name.pascalCase}${theme.name.pascalCase} = Color(${element.colorHex[theme]});''');
        }
      }
    }
    return sb.toString();
  }

  String _renderPaddingCode(YamlMap? paddingYaml) {
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

  int _parsePaletteElementColor(dynamic paletteYamlMap, ThemeElement theme) {
    if (paletteYamlMap is int) {
      return paletteYamlMap;
    }
    if (paletteYamlMap is YamlMap) {
      // If directly specified or via basedOn, use the theme color;
      // otherwise, use the first color
      assert(paletteYamlMap.keys.isNotEmpty);
      final selectedTheme = paletteYamlMap.keys.cast<String>().firstWhere(
          (themeName) =>
              theme.name == themeName || theme.basedOn?.name == themeName,
          orElse: () => paletteYamlMap.keys.first as String);
      return paletteYamlMap[selectedTheme] as int;
    }
    throw Error(); // Bad palette element format
  }
}
