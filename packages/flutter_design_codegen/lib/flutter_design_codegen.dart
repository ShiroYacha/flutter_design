import 'package:build/build.dart';
import 'package:flutter_design_codegen/src/generators/design_generator.dart';
import 'package:flutter_design_codegen/src/generators/page_factory_generator.dart';
import 'package:source_gen/source_gen.dart';

/// Builds design generator for `builder_runner` to run. 
/// Generates parts for widgets that should be imported in the design system
/// viewer.
Builder designBuilder(BuilderOptions options) =>
    PartBuilder([DesignGenerator()], '.design.dart');

/// Builds design generator for `builder_runner` to run.
/// Generates a centralized page repository to be imported in the design system
/// viewer.
Builder pageFactoryBuilder(BuilderOptions options) => PageFactoryBuilder();
