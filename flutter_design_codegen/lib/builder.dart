library flutter_design_codegen.builder;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/design_builder.dart';
import 'src/widget_builder.dart';

Builder designBuilder(BuilderOptions options) => DesignBuilder();

Builder widgetBuilder(BuilderOptions options) =>
    SharedPartBuilder([WidgetGenerator()], 'widget');
