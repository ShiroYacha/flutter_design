import 'package:flutter/material.dart';

/// A wrapper that provides the underlying Material [ThemeData]. This could be
/// extended to handle your own extra theme fields.
///
/// This would be deprecated after the Material [ThemeData] extension is landed.
class DesignTheme {
  /// The underlying material theme
  final ThemeData materialTheme;

  /// Default constructor
  const DesignTheme({
    required this.materialTheme,
  });

  /// The color to be displayed in the design viewer
  Color get displayColor => materialTheme.backgroundColor;
}
