import 'dart:convert';

import 'extension.dart';

mixin MappableToString {
  Map<String, dynamic> toMap();

  @override
  String toString() => json.encode(toMap().map<String, dynamic>(
      (key, dynamic value) => MapEntry<String, String>(key, value.toString())));
}

class ThemeElement with MappableToString {
  final String name;
  ThemeElement? basedOn;

  ThemeElement({
    required this.name,
    this.basedOn,
  });

  @override
  Map<String, dynamic> toMap() =>
      <String, dynamic>{'name': name, 'basedOn': basedOn?.toString()};
}

class PaletteCategory with MappableToString {
  final String name;
  final Map<String, PaletteElement> items;

  PaletteCategory({
    required this.name,
    required this.items,
  });

  @override
  Map<String, dynamic> toMap() =>
      <String, dynamic>{'name': name, 'items': items};
}

class PaletteElement with MappableToString {
  final String name;
  final String? colorHex;
  final Map<ThemeElement, String>? colorHexMap;
  final PaletteCategory category;

  PaletteElement({
    required this.name,
    required this.category,
    this.colorHex,
    this.colorHexMap,
  }) : assert(colorHex != null || colorHexMap != null);

  bool get isSingleColor => colorHex != null;
  bool get isMultipleColor => colorHexMap != null;

  String formatVariableName(String? themeName) {
    if (colorHex != null) {
      return '${category.name}${name.pascalCase}';
    } else if (colorHexMap?.keys.any((t) => t.name == themeName) == true) {
      return '${category.name}${name.pascalCase}${themeName!.pascalCase}';
    }
    throw Exception(
        'Unable to generate variable name: themeElement = $themeName, this = ${toMap()}');
  }

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'colorHex': colorHex,
        'colorHexMap': colorHexMap
      };
}

class TextStyleElement with MappableToString {
  final String name;
  final double size;
  final PaletteElement color;
  final String fontWeight;
  final String? fontFamily;

  TextStyleElement({
    required this.name,
    required this.size,
    required this.color,
    required this.fontWeight,
    this.fontFamily,
  });

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'color': color,
        'fontWeight': fontWeight,
      };

  String renderCode(String? themeName) =>
      '''final ${renderVariableName(themeName)} = TextStyle(
  color: ${color.formatVariableName(themeName)},
  fontSize: $size,
  fontWeight: FontWeight.$fontWeight,${_formatIfExist('fontFamily', fontFamily)}
);''';

  String renderVariableName(String? themeName) =>
      '''textStyle${name.pascalCase}${color.isMultipleColor ? themeName?.pascalCase : ''}''';
}

String _formatIfExist(String key, String? value) =>
    '${value != null ? '\n$key: $value,' : ''}';
