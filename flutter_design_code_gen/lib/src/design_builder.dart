import 'package:build/build.dart';
import 'package:yaml/yaml.dart';

import 'extension.dart';

class DesignBuilder implements Builder {
  @override
  Future build(BuildStep buildStep) async {
    var inputId = buildStep.inputId;

    // read yaml design declaration file
    dynamic yaml = loadYaml(await buildStep.readAsString(inputId));

    // generate code
    final code = _generateDesignCode(yaml);

    // Write out the dart file
    var id = inputId.changeExtension(".dart");
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
      _renderThemeCode(yaml["theme"] as YamlMap?),
      _renderPaletteCode(yaml["palette"] as YamlMap?),
      _renderSizeCode(yaml["size"] as YamlMap?),
    ], "\n");
    return sb.toString();
  }

  String _renderHeader() {
    return """
/// GENERATED CODE, DO NOT MODIFY THIS FILE!
/// 
""";
  }

  String _renderImports() {
    return """
import 'package:flutter/material.dart';
""";
  }

  String _renderThemeCode(YamlMap? themeYaml) {
    final sb = StringBuffer();
    if (themeYaml == null) return sb.toString();
    return sb.toString();
  }

  String _renderPaletteCode(YamlMap? paletteYaml) {
    final sb = StringBuffer();
    if (paletteYaml == null) return sb.toString();

    return sb.toString();
  }

  String _renderSizeCode(YamlMap? sizeYaml) {
    final sb = StringBuffer();
    if (sizeYaml == null) return sb.toString();
    const orientationLabelMap = {
      "all": [""],
      "symmetric": ["horizontal", "vertical"],
      "only": ["top", "left", "right", "bottom"],
    };
    final paddingYaml = sizeYaml["padding"] as YamlMap?;
    String paddingSizeLabel(String label) => "paddingSize${label.pascalCase}";
    if (paddingYaml != null) {
      // precompute orientation labels
      final sizeLabels = paddingYaml.keys.cast<String>().toList();
      // create sizes
      for (var label in sizeLabels) {
        sb.writeln(
            """const double ${paddingSizeLabel(label)} = ${paddingYaml[label]};""");
      }
      sb.writeln();
      final suffixes = <String>[];
      const edgeInsetPrefix = "edgeInset";
      // create edgeInsets
      for (var label in sizeLabels) {
        final labelPascalCase = label.pascalCase;
        final value = paddingSizeLabel(label);
        for (var method in orientationLabelMap.keys) {
          for (var attribute in orientationLabelMap[method]!) {
            final suffix = "$attribute$labelPascalCase";
            sb.writeln(
                """const $edgeInsetPrefix$suffix = EdgeInsets.$method(${attribute.isEmpty ? value : "$attribute: $value"});""");
            suffixes.add(suffix);
          }
        }
      }
      sb.writeln();
      // create pad methods
      for (var suffix in suffixes) {
        sb.writeln(
            """Widget pad$suffix(Widget child) => Padding(padding: $edgeInsetPrefix$suffix, child: child);""");
      }
      sb.writeln();
      // create widget extension padding methods
      sb.writeln("""extension WidgetPaddingExtension on Widget {""");
      for (var suffix in suffixes) {
        sb.writeln(
            """Widget pad$suffix() => Padding(padding: $edgeInsetPrefix$suffix, child: this);""");
      }
      sb.writeln("""}""");
    }
    return sb.toString();
  }
}
