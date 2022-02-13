import 'package:build/build.dart';
import 'package:flutter_design_codegen/src/generators/design_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder designBuilder(BuilderOptions options) =>
    PartBuilder([DesignGenerator()], '.design.dart');
