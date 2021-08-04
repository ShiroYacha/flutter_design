class ThemeElement {
  final String name;
  ThemeElement? basedOn;
  ThemeElement({required this.name, this.basedOn});
}

class PaletteCategory {
  final String name;
  final Map<String, PaletteElement> items;
  PaletteCategory({required this.name, required this.items});
}

class PaletteElement {
  final String name;
  final Map<ThemeElement, String> colorHex;
  PaletteElement({required this.name, required this.colorHex});
}
