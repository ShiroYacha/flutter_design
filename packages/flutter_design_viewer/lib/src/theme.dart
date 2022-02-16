import 'package:flutter/material.dart';

import 'measures.dart';

final primaryColor = Colors.amber.shade600;
final primaryDarkColor = Colors.amber.shade400;
final secondaryColor = Colors.teal.shade600;
final secondaryDarkColor = Colors.teal.shade400;
const backgroundLightest = Color(0xFFFAFAFA);
const backgroundLight = Color(0xFFF1F1F1);
const backgroundDark = Color(0xFF1C1C1C);
const backgroundDarkest = Color(0xFF0F0F0F);
const dividerLight = Color(0xFF9A9A9A);
const dividerDark = Color(0xFF4E4E4E);

/// Standard material [ThemeData] for [Brightness.light]
final defaultLightTheme = ThemeData(
  fontFamily: 'Poppins',
  brightness: Brightness.light,
  scaffoldBackgroundColor: backgroundLight,
  backgroundColor: backgroundLightest,
  dividerColor: dividerLight,
  dividerTheme: const DividerThemeData(
    color: dividerLight,
  ),
  primaryColor: primaryColor,
  colorScheme: ColorScheme.light(
    primary: primaryColor,
    secondary: secondaryColor,
  ),
  highlightColor: primaryColor,
  textButtonTheme: _textButtonThemeData,
);

/// Standard material [ThemeData] for [Brightness.dark]
final defaultDarkTheme = ThemeData(
  fontFamily: 'Poppins',
  brightness: Brightness.dark,
  backgroundColor: backgroundDarkest,
  scaffoldBackgroundColor: backgroundDark,
  dividerColor: dividerDark,
  dividerTheme: const DividerThemeData(
    color: dividerDark,
  ),
  primaryColor: primaryDarkColor,
  colorScheme: ColorScheme.dark(
    primary: primaryDarkColor,
    secondary: secondaryDarkColor,
  ),
  highlightColor: primaryDarkColor,
  textButtonTheme: _textButtonThemeData,
);

final TextButtonThemeData _textButtonThemeData = TextButtonThemeData(
  style: ButtonStyle(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(
        vertical: SpacingDesign.s20,
        horizontal: SpacingDesign.s10,
      ),
    ),
    splashFactory: NoSplash.splashFactory,
    overlayColor: MaterialStateProperty.resolveWith<Color>(
        (states) => Colors.transparent),
  ),
);

InputDecoration buildTextFieldDecoration(BuildContext context) {
  final theme = Theme.of(context);
  return InputDecoration(
    border: OutlineInputBorder(
      borderSide: const BorderSide(width: 1),
      borderRadius: BorderRadius.circular(8),
    ),
    contentPadding: SpacingDesign.paddingAll6,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: theme.primaryColor),
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
