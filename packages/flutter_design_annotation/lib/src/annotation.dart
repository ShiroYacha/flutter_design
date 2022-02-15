/// TODO: this is a workaround to use generics to hide the dependencies to
/// 'package:flutter/widget.dart'.
class TDesign<TWidget, TBuildContext> {
  final List<String> tags;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? designLink;
  final bool showApiDocs;
  final Map<String, dynamic> viewerInitValueMap;

  const TDesign({
    this.title,
    this.subtitle,
    this.description,
    this.tags = const [],
    this.designLink,
    this.showApiDocs = true,
    this.viewerInitValueMap = const {},
  });
}
