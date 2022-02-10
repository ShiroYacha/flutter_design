import 'package:analyzer/dart/element/element.dart';
import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recase/recase.dart';

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
    String? description,
    @Default([]) List<String> tags,
    @Default([]) List<ViewerSectionUnion> sections,
  }) = ViewerDocumentPage;

  List<String> get segments => [...namespace, id];

  @override
  String get uri => '/${segments.join('/')}';

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
    required WidgetBuilder builder,
    required ViewerSourceCode sourceCode,
  }) = ViewerComponentSection;

  const factory ViewerSectionUnion.examples({
    required String id,
    required String title,
    String? description,
    @Default([]) List<ViewerExampleUnion> examples,
  }) = ViewerExamplesSection;

  const factory ViewerSectionUnion.apiDocs({
    required String id,
    required String title,
    String? description,
    required List<ClassMemberElement> items,
  }) = ViewerApiDocsSection;

  @override
  List<SearchableElement> get searchableElements => [];

  @override
  String get uri => throw UnimplementedError();
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

typedef DynamicWidgetBuilder<T> = Widget Function(
  BuildContext context,
  ViewerDataGeneratorFactory dataGeneratorFactory,
);

@freezed
class ViewerDataGeneratorFactory with _$ViewerDataGeneratorFactory {
  const ViewerDataGeneratorFactory._();
  const factory ViewerDataGeneratorFactory(
          {required List<ViewerDataGenerator> dataGenerators}) =
      _ViewerDataGeneratorFactory;

  ViewerDataGenerator findFirst(String dataKey) =>
      dataGenerators.firstWhere((e) => e.dataKey == dataKey);

  dynamic generateFirst(
    BuildContext context, {
    required String dataKey,
  }) =>
      findFirst(dataKey).build(context);
}

@freezed
class ViewerExampleUnion<T> with _$ViewerExampleUnion<T> implements Searchable {
  const ViewerExampleUnion._();

  const factory ViewerExampleUnion.static({
    required String name,
    String? description,
    required WidgetBuilder builder,
    required ViewerSourceCode sourceCode,
  }) = ViewerStaticExample<T>;

  const factory ViewerExampleUnion.dynamic({
    required String name,
    String? description,
    required DynamicWidgetBuilder<T> builder,
    required ViewerSourceCode sourceCode,
  }) = ViewerDynamicExample<T>;

  @override
  List<SearchableElement> get searchableElements => [];
}

abstract class ViewerDataGenerator<T> {
  String get dataKey;
  T build(BuildContext context);
}

typedef ViewerDataTemplateGeneratorBuilder<T> = Widget Function(
  BuildContext context,
  ViewerDataTemplateGeneratorUnion<T> generator,
);

@freezed
class ViewerDataTemplateGeneratorUnion<T>
    with _$ViewerDataTemplateGeneratorUnion<T> {
  const ViewerDataTemplateGeneratorUnion._();
  @Implements<ViewerDataGenerator>()
  const factory ViewerDataTemplateGeneratorUnion.lorem({
    required String dataKey,
    @Default('Number of words') String label,
    @Default(10) int length,
    @Default(0) double min,
    @Default(100) double max,
  }) = ViewerLoremGenerator;

  T build(BuildContext context) {
    return map(
      lorem: (lorem) => ReCase(
        Faker(seed: dataKey.hashCode).lorem.words(length).join(' '),
      ).sentenceCase,
    ) as T;
  }
}
