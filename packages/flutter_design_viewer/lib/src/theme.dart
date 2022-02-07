import 'package:flutter/material.dart';

/// Standard material [ThemeData] for [Brightness.light]
final defaultLightTheme = ThemeData(
  fontFamily: 'Poppins',
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFFAFAFA),
  dividerColor: Colors.black26,
  highlightColor: Colors.red,
);

/// Standard material [ThemeData] for [Brightness.dark]
final defaultDarkTheme = ThemeData(
  fontFamily: 'Poppins',
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF1C1C1C),
  dividerColor: Colors.white24,
  highlightColor: Colors.redAccent,
);
