/// Flags a class as needing to be processed by flutter_design_codegen
/// to generate into an importable design system viewer page.
/// It also allows passing options to customize the builder's behavior.
class TDesign<TWidget, TBuildContext> {
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

  /// Initial values that would be fed to the widget viewer generator.
  /// This is especially useful for [required] fields as there is no default
  /// value specified on the constructor.
  ///
  /// Example:
  /// ```dart
  /// @Design(viewerInitValueMap: {
  ///   'name': 'John'
  /// })
  /// class UserLabel extends StatelessWidget {
  ///
  ///   final String name;
  ///   const UserLabel({
  ///     required this.name,
  ///   });
  /// }
  /// ```
  ///
  /// When initializing the widget in the viewer, the default value 'John' will
  /// be passed initially.
  ///
  /// Note that if a default value for a field is specified in both `viewerInitValueMap`
  /// and as a default value on the constructor, the latter will be ignored.
  ///
  ///
  final Map<String, dynamic> viewerInitValueMap;

  /// Default constructor
  const TDesign({
    this.title,
    this.subtitle,
    this.description,
    this.designLink,
    this.showApiDocs = true,
    this.viewerInitValueMap = const {},
  });
}
