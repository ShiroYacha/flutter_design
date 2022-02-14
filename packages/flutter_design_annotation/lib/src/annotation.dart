/// TODO: this is a workaround to use generics to hide the dependencies to
/// 'package:flutter/widget.dart'.
class TDesign<TWidget, TBuildContext> {
  final List<String> tags;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? embeddedDesignLink;

  const TDesign({
    this.title,
    this.subtitle,
    this.description,
    this.tags = const [],
    this.embeddedDesignLink,
  });
}
