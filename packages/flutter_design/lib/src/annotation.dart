import 'package:flutter/widgets.dart';
import 'package:flutter_design_annotation/flutter_design_annotation.dart';

/// Flags a class as needing to be processed by flutter_design_codegen
/// to generate into an importable design system viewer page.
/// It also allows passing options to customize the builder's behavior.
typedef Design = TDesign<Widget, BuildContext>;

/// Parameterless annotation
const design = Design();
