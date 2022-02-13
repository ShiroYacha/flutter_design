import 'package:analyzer/dart/element/element.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_annotation/flutter_design_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'searches.dart';

part 'pages.freezed.dart';

@freezed
class ViewerPageGroup with _$ViewerPageGroup {
  const factory ViewerPageGroup({
    required String id,
    required String title,
    ViewerGlyphUnion? glyph,
    @Default([]) List<ViewerPageUnion> children,
  }) = _ViewerPageGroup;
}

@freezed
class ViewerPageUnion with _$ViewerPageUnion implements Searchable {
  const ViewerPageUnion._();
  const factory ViewerPageUnion.group({
    required String id,
    required List<String> namespace,
    required String title,
    String? description,
    @Default([]) List<ViewerPageUnion> children,
  }) = ViewerGroupPage;
  const factory ViewerPageUnion.document({
    required String id,
    required List<String> namespace,
    required String title,
    String? subtitle,
    String? description,
    @Default([]) List<String> tags,
    @Default([]) List<ViewerSectionUnion> sections,
  }) = ViewerDocumentPage;

  List<String> get segments => [...namespace, id];

  String get uri => '/${segments.join('/')}';

  String get firstDocumentUri => map(
        group: (group) => group.children.map((e) => e.firstDocumentUri).first,
        document: (document) => document.uri,
      );

  @override
  List<SearchableElement> get searchableElements => [
        SearchableElement(
          type: SearchableType.page,
          hitType: SearchableHitType.title,
          searchable: this,
          text: title,
        ),
        // TODO: impl. search
        if (this is ViewerDocumentPage) ...[
          SearchableElement(
            type: SearchableType.page,
            hitType: SearchableHitType.tags,
            searchable: this,
            text: (this as ViewerDocumentPage).tags.join(','),
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
              )
            ],
          ),
        ],
      ];
}

@Freezed(unionKey: 'type')
class ViewerGlyphUnion with _$ViewerGlyphUnion {
  const ViewerGlyphUnion._();
  const factory ViewerGlyphUnion.icon({
    required IconData icon,
    Color? color,
    @Default(18) double size,
  }) = ViewerIconGlyph;
  const factory ViewerGlyphUnion.image({
    required String uri,
    Color? color,
    @Default(18) double size,
  }) = ViewerImageGlyph;
}

@freezed
class ViewerSourceCode with _$ViewerSourceCode {
  const factory ViewerSourceCode({
    required String location,
    required String code,
  }) = _ViewerSourceCode;
}

@freezed
class ViewerSectionUnion with _$ViewerSectionUnion implements Searchable {
  const ViewerSectionUnion._();

  const factory ViewerSectionUnion.paragraph({
    required String id,
    required String title,
    String? description,
    @Default([]) List<List<ViewerCollectionItemUnion>> contents,
  }) = ViewerParagraphSection;

  const factory ViewerSectionUnion.component({
    required String id,
    required String title,
    String? description,
    required ViewerWidgetBuilder builder,
    required ViewerSourceCode sourceCode,
  }) = ViewerComponentSection;

  const factory ViewerSectionUnion.apiDocs({
    required String id,
    required String title,
    String? description,
    required List<ClassMemberElement> items,
  }) = ViewerApiDocsSection;

  @override
  List<SearchableElement> get searchableElements => [];
}

typedef WidgetDynamicBuilder = Widget Function(
    BuildContext context, DataBuilderFactory data);

@freezed
class ViewerWidgetBuilder with _$ViewerWidgetBuilder {
  const ViewerWidgetBuilder._();

  const factory ViewerWidgetBuilder({
    required WidgetDynamicBuilder build,
    @Default([]) List<FieldMetaData> fieldMetaDataset,
  }) = _ViewerWidgetBuilder;
}

@freezed
class FieldMetaData with _$FieldMetaData {
  const FieldMetaData._();
  const factory FieldMetaData({
    required String name,
    required Type type,
    required bool isOptional,
  }) = _FieldMetaData;
}

enum ViewerImageCollectionItemStyle {
  imageOnLeft,
}

@freezed
class ViewerCollectionItemUnion
    with _$ViewerCollectionItemUnion
    implements Searchable {
  const ViewerCollectionItemUnion._();
  const factory ViewerCollectionItemUnion.text({
    String? title,
    String? description,
  }) = ViewerTextCollectionItem;

  const factory ViewerCollectionItemUnion.glyph({
    required ViewerGlyphUnion glyph,
    required String title,
  }) = ViewerGlyphCollectionItem;

  const factory ViewerCollectionItemUnion.link({
    required String title,
    required String url,
  }) = ViewerLinkCollectionItem;

  const factory ViewerCollectionItemUnion.image({
    required ViewerImageCollectionItemStyle style,
    required String url,
    String? title,
    String? description,
    double? width,
    double? height,
  }) = ViewerImageCollectionItem;
  const factory ViewerCollectionItemUnion.widget({
    required Widget widget,
  }) = ViewerWidgetCollectionItem;

  @override
  List<SearchableElement> get searchableElements => [];
}

@freezed
class ViewerCatalogLink with _$ViewerCatalogLink {
  const ViewerCatalogLink._();

  const factory ViewerCatalogLink({
    required String title,
    required String url,
  }) = _ViewerCatalogLink;
}

typedef DataBuilderFactory = TDataBuilderFactory<BuildContext>;

typedef UpdateDataBuilder<T> = TUpdateDataBuilder<Widget, BuildContext, T>;

typedef DataBuilder<T> = TDataBuilder<Widget, BuildContext, T>;
