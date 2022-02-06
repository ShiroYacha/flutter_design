import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:faker/faker.dart';
import 'package:recase/recase.dart';

part 'pages.freezed.dart';

@freezed
class ViewerPageGroup with _$ViewerPageGroup {
  const factory ViewerPageGroup({
    required String id,
    required List<String> namespace,
    required String title,
    ViewerGlyphUnion? glyph,
    @Default([]) List<ViewerPageUnion> children,
  }) = _ViewerPageGroup;
}

@freezed
class ViewerPageUnion with _$ViewerPageUnion {
  const ViewerPageUnion._();
  const factory ViewerPageUnion.documentation({
    required String id,
    required List<String> namespace,
    required String title,
    String? description,
    @Default([]) List<String> tags,
    required String content,
    @Default([]) List<ViewerPageUnion> children,
  }) = ViewerDocumentationPage;
  const factory ViewerPageUnion.catalog({
    required String id,
    required List<String> namespace,
    required String title,
    @Default([]) List<String> tags,
    String? description,
    String? embeddedDesignLink,
    required String catalogBuilderId,
    @Default([]) List<ViewerPageUnion> children,
  }) = ViewerCatalogPage;
}

@Freezed(unionKey: 'type')
class ViewerGlyphUnion with _$ViewerGlyphUnion {
  const ViewerGlyphUnion._();
  const factory ViewerGlyphUnion.icon({
    required IconData icon,
    @Default(16) double size,
  }) = ViewerIconGlyph;
  const factory ViewerGlyphUnion.image({
    required String uri,
    @Default(16) double size,
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
class ViewerCatalogUnion with _$ViewerCatalogUnion {
  const factory ViewerCatalogUnion.primaryComponent({
    required String id,
    @Default([]) List<ViewerCatalogFeature> features,
    @Default([]) List<ViewerCatalogLink> links,
    required WidgetBuilder builder,
    required ViewerSourceCode sourceCode,
    required List<ViewerExampleUnion> examples,
    @Default([]) List<ViewerSecondaryComponentCatalog> secondaryComponents,
  }) = ViewerPrimaryComponentCatalog;
  const factory ViewerCatalogUnion.secondaryComponent({
    required String name,
    String? description,
    required WidgetBuilder builder,
    required ViewerSourceCode sourceCode,
    required List<ViewerExampleUnion> examples,
  }) = ViewerSecondaryComponentCatalog;
  const factory ViewerCatalogUnion.prototype({
    required String id,
  }) = ViewerPrototypeCatalog;
}

@freezed
class ViewerCatalogFeature with _$ViewerCatalogFeature {
  const factory ViewerCatalogFeature({
    required bool capable,
    required String title,
  }) = _ViewerCatalogFeature;
}

@freezed
class ViewerCatalogLink with _$ViewerCatalogLink {
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
class ViewerExampleUnion<T> with _$ViewerExampleUnion<T> {
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

// const src = ViewerSourceCode(location: 'location', code: 'code');
// final test = ViewerStaticExample(
//   name: '',
//   builder: (ctx) => Container(),
//   sourceCode: src,
// );
// final test2 = ViewerDynamicExample<String>(
//   name: '',
//   builder: (ctx, dataTemplate) => Container(),
//   sourceCode: src,
// );
// final test3 = ViewerDynamicExample<String>(
//   name: '',
//   builder: (ctx, dataGeneratorFactory) => Text(
//     dataGeneratorFactory.generateFirst(ctx, dataKey: ''),
//   ),
//   sourceCode: src,
// );

// class Test extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return test3.builder(
//         context,
//         const ViewerDataGeneratorFactory(dataGenerators: [
//           ViewerTextDataGenerator<String>(dataKey: 'asdf'),
//         ]));
//   }
// }
