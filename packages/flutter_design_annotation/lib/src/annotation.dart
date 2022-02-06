import 'package:flutter_design_annotation/flutter_design_annotation.dart';

/// TODO: this is a workaround to use generics to hide the dependencies to
/// 'package:flutter/widget.dart'.
class TDesign<TWidget, TBuildContext> {
  final List<String>? namespace;

  final List<String> tags;

  final String? name;

  final String? description;

  final String? embeddedDesignLink;

  final ComponentBuilder<TWidget, TBuildContext>? defaultBuilder;

  final TWidget? widget;

  const TDesign({
    this.namespace,
    this.name,
    this.description,
    this.tags = const [],
    this.embeddedDesignLink,
    this.defaultBuilder,
    this.widget,
  });
}
