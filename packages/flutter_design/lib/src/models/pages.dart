import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recase/recase.dart';

import '../../flutter_design.dart';

part 'pages.freezed.dart';

/// Union class that represents a "Page" in the design system viewer catalog.
@freezed
class ViewerPageUnion with _$ViewerPageUnion implements Searchable {
  const ViewerPageUnion._();

  /// A group page which contains a list of children union pages.
  const factory ViewerPageUnion.group({
    /// Id of the page.
    required String id,

    /// Namespace describing the hierarchical structure of the page.
    /// It which consists of a list of `id`s from the root to the parent.
    required List<String> namespace,

    /// Title of the page.
    required String title,

    /// Description of the page.
    String? description,

    /// List of children pages.
    @Default([]) List<ViewerPageUnion> children,
  }) = ViewerGroupPage;

  /// A leaf document page which contains multiple union sections.
  const factory ViewerPageUnion.document({
    /// Id of the page.
    required String id,

    /// Namespace describing the hierarchical structure of the page.
    /// It which consists of a list of `id`s from the root to the parent.
    required List<String> namespace,

    /// Title of the page.
    required String title,

    /// Subtitle of the page.
    String? subtitle,

    /// Description of the page.
    String? description,

    /// List of children sections.
    @Default([]) List<ViewerSectionUnion> sections,
  }) = ViewerDocumentPage;

  /// Get the list of `id` segments which includes both the `id`s in the [namespace]
  /// as well as the current [id]
  List<String> get segments => [...namespace, id];

  /// Get the URI that represents the current page
  String get uri => '/${segments.join('/')}';

  /// Get the namespace hierarchy user friendly label
  String get namespaceHierarchyLabel =>
      namespace.map((e) => ReCase(e).sentenceCase).join(' > ');

  /// Get the URI of the first document in the current page:
  /// - If the page is a [ViewerDocumentPage], return its [id]
  /// - else look look for the first [firstDocumentUri] in its children
  String get firstDocumentUri => map(
        group: (group) => group.children.map((e) => e.firstDocumentUri).first,
        document: (document) => document.uri,
      );

  @override
  List<SearchableElement> get searchableElements => [
        if (this is ViewerGroupPage)
          ...(this as ViewerGroupPage).children.fold(<SearchableElement>[],
              (pv, e) => [...pv, ...e.searchableElements]),
        if (this is ViewerDocumentPage) ...[
          SearchableElement(
            type: SearchableType.page,
            hitType: SearchableHitType.title,
            searchable: this,
            text: title,
          ),
          ...(this as ViewerDocumentPage)
              .sections
              .fold<List<SearchableElement>>(
            [],
            (pe, e) => [
              ...pe,
              ...e.searchableElements.map(
                (e) => e.copyWith(
                  searchable: this,
                ),
              ),
            ],
          ),
        ],
      ];
}

/// Source code information
@freezed
class ViewerSourceCode with _$ViewerSourceCode {
  const factory ViewerSourceCode({
    /// Location of the source code.
    required String location,

    /// Formatted source code.
    required String code,
  }) = _ViewerSourceCode;
}

/// Union class for sections on [ViewerDocumentPage].
@freezed
class ViewerSectionUnion with _$ViewerSectionUnion implements Searchable {
  const ViewerSectionUnion._();

  /// Paragraph section with possible list of content items.
  const factory ViewerSectionUnion.paragraph({
    /// Id of the section.
    required String id,

    /// Title of the section.
    required String title,

    /// Description of the section.
    String? description,

    /// List of content items
    @Default([]) List<ViewerCollectionItemUnion> contents,
  }) = ViewerParagraphSection;

  const factory ViewerSectionUnion.component({
    /// Id of the section.
    required String id,

    /// Title of the section.
    required String title,

    /// Description of the section.
    String? description,

    /// Name of the widget constructor.
    required String ctorName,

    /// Link to a design file of the widget.
    String? designLink,

    /// Widget builder to construct the widget with available data builders.
    required ViewerWidgetBuilder builder,

    /// Widget source code information.
    required ViewerSourceCode sourceCode,
  }) = ViewerComponentSection;

  /// API reference section. The actual API information will be retrieved from the
  /// constructor, via [ViewerWidgetBuilder].
  const factory ViewerSectionUnion.apiDocs({
    /// Id of the section.
    required String id,

    /// Title of the section.
    required String title,

    /// Description of the section.
    String? description,
  }) = ViewerApiDocsSection;

  @override
  List<SearchableElement> get searchableElements => [];
}

/// Function to build a widget with the context and a data builder factory
typedef WidgetDynamicBuilder = Widget Function(
  BuildContext context,
  DataBuilderFactory data,
);

/// Widget builder with meta data to construct a widget.
@freezed
class ViewerWidgetBuilder with _$ViewerWidgetBuilder {
  const ViewerWidgetBuilder._();

  const factory ViewerWidgetBuilder({
    /// Widget builder function
    required WidgetDynamicBuilder build,

    /// List of meta data of the widget's constructor used in the build process
    @Default([]) List<FieldMetaData> fieldMetaDataset,
  }) = _ViewerWidgetBuilder;
}

/// Meta data on a widget constructor field
@freezed
class FieldMetaData with _$FieldMetaData {
  const FieldMetaData._();
  const factory FieldMetaData({
    /// Name of the field
    required String name,

    /// Type of the field
    required Type type,

    /// Display type name of the field
    required String typeName,

    /// Flag if the field is option
    required bool isNullable,

    /// Default value in string format
    String? defaultValueCode,

    /// Default value
    dynamic defaultValue,

    /// The initial parameter of the initial data builder to be used by the viewer.
    /// The designer will use the first data builder in the provided list which contains
    /// the same parameter type.
    ///
    /// Some of the data builder takes an "initial value" of the field.
    /// This is especially useful for `required` fields that has no default value on the constructor. If both
    /// the initial value and the default value is specified, the [viewerInitSelectorParam]
    /// will be used.
    dynamic viewerInitSelectorParam,

    /// Documentation on the field
    String? documentation,
  }) = _FieldMetaData;
}

/// Image style of the item
enum ViewerImageCollectionItemStyle {
  /// Show the image on the left and the labels on the right
  imageOnLeft,
}

/// Union class for paragraph item to be used in a [ViewerParagraphSection].
@freezed
class ViewerCollectionItemUnion
    with _$ViewerCollectionItemUnion
    implements Searchable {
  const ViewerCollectionItemUnion._();

  /// Text paragraph item
  const factory ViewerCollectionItemUnion.text({
    /// Title of the item
    String? title,

    /// Description of the item
    String? description,
  }) = ViewerTextCollectionItem;

  /// Image paragraph item
  const factory ViewerCollectionItemUnion.image({
    required ViewerImageCollectionItemStyle style,

    /// URL of the image
    required String url,

    /// Title of the link
    String? title,

    /// Description of the link
    String? description,

    /// Width of the image
    double? width,

    /// Height of the image
    double? height,
  }) = ViewerImageCollectionItem;

  /// Widget paragraph item
  const factory ViewerCollectionItemUnion.widget({
    /// Widget to be rendered
    required Widget widget,
  }) = ViewerWidgetCollectionItem;

  @override
  List<SearchableElement> get searchableElements => [];
}

/// Data builder factory
typedef DataBuilderFactory = TDataBuilderFactory<BuildContext>;

/// Function to update a data builder of type [T] with new values
typedef UpdateDataBuilder<TData, TParameter>
    = TUpdateDataBuilder<Widget, BuildContext, TData, TParameter>;

/// Data builder for a specific type [T]
typedef DataBuilder<TData, TParameter>
    = TDataBuilder<Widget, BuildContext, TData, TParameter>;
