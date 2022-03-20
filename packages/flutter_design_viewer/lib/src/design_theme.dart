import 'package:flutter/material.dart';

class DesignTheme {
  final ThemeData materialTheme;

  const DesignTheme({
    required this.materialTheme,
  });

  Color get displayColor => materialTheme.backgroundColor;
}
