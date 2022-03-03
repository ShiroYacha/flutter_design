/// Flags a class as needing to be processed by flutter_design_codegen
/// to generate into an importable design system viewer page.
/// It also allows passing options to customize the builder's behavior.
class TDesign {
  /// Title to be displayed in the explorer & the top of the page
  final String? title;

  /// Subtitle to be displayed under the top of the page
  final String? subtitle;

  /// Additional description under the table of content
  final String? description;

  /// Link to a design file that can be opened in the widget viewer
  final String? designLink;

  /// Flag if the API reference section should be included
  final bool showApiDocs;

  /// Default constructor
  const TDesign({
    this.title,
    this.subtitle,
    this.description,
    this.designLink,
    this.showApiDocs = true,
  });
}

class TDesignField<TParameter> {
  final dynamic initialValue;

  final dynamic parameter;

  const TDesignField({
    this.initialValue,
    this.parameter,
  });
}
