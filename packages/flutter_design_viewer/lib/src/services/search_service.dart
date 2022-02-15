import 'dart:math';

import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:string_similarity/string_similarity.dart';

final searchProvider =
    Provider.autoDispose.family<List<SearchResultItem>, String>(
  (ref, query) {
    final pageGroups = ref.watch(pageGroupsProvider);
    return _searchGroupPages(pageGroups, query.toLowerCase());
    // if (query.isNotEmpty) {
    //   // TODO
    //   return _searchGroupPages(pageGroups, query);
    // } else {
    //   // TODO load recent/favorites
    //   return [
    //     const SearchResultItem(
    //       context: SearchResultContext.recent,
    //       type: SearchResultItemType.section,
    //       pageType: SearchResultItemPageType.document,
    //       score: 99,
    //       title: 'Example',
    //       subtitle: 'Button',
    //       labelHighlightStart: 0,
    //       labelHighlightEnd: 5,
    //       uri: '/components/button',
    //     ),
    //     const SearchResultItem(
    //       context: SearchResultContext.recent,
    //       type: SearchResultItemType.recent,
    //       pageType: SearchResultItemPageType.document,
    //       score: 99,
    //       title: 'Intro',
    //       labelHighlightStart: 0,
    //       labelHighlightEnd: 5,
    //       uri: '/get_started/intro',
    //     ),
    //     const SearchResultItem(
    //       context: SearchResultContext.favorite,
    //       type: SearchResultItemType.favorite,
    //       pageType: SearchResultItemPageType.document,
    //       score: 99,
    //       title: 'Intro',
    //       labelHighlightStart: 0,
    //       labelHighlightEnd: 5,
    //       uri: '/get_started/intro',
    //     ),
    //   ];
    // }
  },
);

/// Naive implementation by checking similarity between the query and
/// each searchable element (e.g. title, section title, etc.) using the
/// Dice coefficient using https://pub.dev/packages/string_similarity
List<SearchResultItem> _searchGroupPages(
  List<ViewerGroupPage> pageGroups,
  String query,
) {
  // Aggregate all searchable elements
  final elements = pageGroups.fold<List<SearchableElement>>(
    [],
    (previousValue, element) => [
      ...previousValue,
      ...element.children.fold(
        [],
        (previousValue, element) => [
          ...previousValue,
          ...element.searchableElements,
        ],
      ),
    ],
  ).where((e) => e.text.isNotEmpty);
  // Perform search
  return elements
      .map(
        (e) {
          var score = query.isEmpty || e.text.toLowerCase().startsWith(query)
              ? 100.0
              : 0;
          score = e.text.toLowerCase().split(' ').map((t) {
            if (e.hitType == SearchableHitType.title) {
              return t.similarityTo(query) * 100;
            }
            if (e.hitType == SearchableHitType.description) {
              return t.similarityTo(query) * 100;
            }
            return t.similarityTo(query) * 0;
          }).fold(score, ((value, element) => max(value, element)));
          String? uri;
          if (e.searchable is ViewerDocumentPage) {
            uri = (e.searchable as ViewerDocumentPage).uri;
          }
          return SearchResultItem(
            context: SearchResultContext.documentation,
            type: SearchResultItemType.page,
            pageType: SearchResultItemPageType.document,
            score: score.floor(),
            title: e.text,
            labelHighlightStart: 0,
            labelHighlightEnd: 1,
            uri: uri ?? '',
          );
        },
      )
      // TODO: remove hack
      .where((e) => e.score > 48)
      .toList();
}
