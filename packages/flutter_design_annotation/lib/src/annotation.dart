import 'package:flutter_design_annotation/flutter_design_annotation.dart';

/// TODO: this is a workaround to use generics to hide the dependencies to
/// 'package:flutter/widget.dart'.
class TDesign<TWidget, TBuildContext> {
  final List<String>? namespace;

  final List<String> tags;

  final String? title;
  final String? subtitle;

  final String? description;

  final String? embeddedDesignLink;

  final ComponentBuilder<TWidget, TBuildContext>? defaultBuilder;

  const TDesign({
    this.namespace,
    this.title,
    this.subtitle,
    this.description,
    this.tags = const [],
    this.embeddedDesignLink,
    this.defaultBuilder,
  });
}
