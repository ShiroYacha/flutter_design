import 'package:flutter/material.dart';

import 'measures.dart';

final _primaryColor = Colors.amber.shade600;
final _primaryDarkColor = Colors.amber.shade400;
final _secondaryColor = Colors.teal.shade600;
final _secondaryDarkColor = Colors.teal.shade400;
const _backgroundLightest = Color(0xFFFAFAFA);
const _backgroundLight = Color(0xFFF1F1F1);
const _backgroundDark = Color(0xFF1C1C1C);
const _backgroundDarkest = Color(0xFF0F0F0F);
const _dividerLight = Color(0xFF9A9A9A);
const _dividerDark = Color(0xFF4E4E4E);

/// Standard material [ThemeData] for [Brightness.light]
final defaultLightTheme = ThemeData(
  fontFamily: 'Poppins',
  brightness: Brightness.light,
  scaffoldBackgroundColor: _backgroundLight,
  backgroundColor: _backgroundLightest,
  dividerColor: _dividerLight,
  dividerTheme: const DividerThemeData(
    color: _dividerLight,
  ),
  primaryColor: _primaryColor,
  colorScheme: ColorScheme.light(
    primary: _primaryColor,
    secondary: _secondaryColor,
  ),
  highlightColor: _primaryColor,
  textButtonTheme: _textButtonThemeData,
);

/// Standard material [ThemeData] for [Brightness.dark]
final defaultDarkTheme = ThemeData(
  fontFamily: 'Poppins',
  brightness: Brightness.dark,
  backgroundColor: _backgroundDarkest,
  scaffoldBackgroundColor: _backgroundDark,
  dividerColor: _dividerDark,
  dividerTheme: const DividerThemeData(
    color: _dividerDark,
  ),
  primaryColor: _primaryDarkColor,
  colorScheme: ColorScheme.dark(
    primary: _primaryDarkColor,
    secondary: _secondaryDarkColor,
  ),
  highlightColor: _primaryDarkColor,
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

/// Create default text field decoration
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

/// An inherit theme without ripple and highlight effects
class ThemeWithoutRippleAndHighlight extends StatelessWidget {
  final Widget child;
  const ThemeWithoutRippleAndHighlight({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: child,
    );
  }
}
