import 'interface.dart';

/// Flags a class as needing to be processed by flutter_design_codegen
/// to generate into an importable design system viewer page.
/// It also allows passing options to customize the builder's behavior.
class Design {
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
  const Design({
    this.title,
    this.subtitle,
    this.description,
    this.designLink,
    this.showApiDocs = true,
  });
}

/// Provide a viewer data builder parameter for the field (be it a class field,
/// or a method/ctor parameter field).
///
/// The designer will use the first data builder in the provided list which contains
/// the same parameter type.
///
/// Some of the data builder takes an "initial value" of the field.
/// This is especially useful for `required` fields that has no default value on the constructor. If both
/// the initial value and the default value is specified, the [parameter]
/// will be used.
///
/// Example: used on a ctor field, will take priority if @DesignField is also provided
/// on the class field.
///
/// class Avatar extends StatelessWidget {
///   final String uri;
///
///   const Avatar({
///     @DesignField(parameter: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2')
///     required this.uri,
///     this.radius = 30.0,
///     Key? key,
///   }) : super(key: key);
/// }
///
/// Example: used on a class field
///
/// class Avatar extends StatelessWidget {
///   @DesignField(parameter: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2')
///   final String uri;
///
///   const Avatar({
///     required this.uri,
///     this.radius = 30.0,
///     Key? key,
///   }) : super(key: key);
/// }
///
class DesignField {
  /// The initial parameter of the initial data builder to be used by the viewer.
  /// The designer will use the first data builder in the provided list which contains
  /// the same parameter type.
  ///
  /// Some of the data builder takes an "initial value" of the field.
  /// This is especially useful for `required` fields that has no default value on the constructor. If both
  /// the initial value and the default value is specified, the [parameter]
  /// will be used.
  final dynamic parameter;

  const DesignField({
    this.parameter,
  });
}

class DesignExamples {
  final List<DesignExample> examples;

  const DesignExamples({
    required this.examples,
  });
}

class DesignExample {
  final String title;
  final String? description;
  final ComponentParamBuilder builder;

  const DesignExample({
    required this.title,
    this.description,
    required this.builder,
  });
}
