// ignore_for_file: invalid_annotation_target

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionicons/ionicons.dart';

part 'searches.freezed.dart';
part 'searches.g.dart';

enum SearchResultContext {
  documentation,
  recent,
  favorite,
}

enum SearchResultItemType {
  page,
  section,
  content,
  recent,
  favorite,
}

enum SearchResultItemPageType {
  document,
  component,
  prototype,
}

enum SearchResultItemPrefix {
  sub,
  subEnd,
}

@freezed
class SearchResultItem with _$SearchResultItem {
  const SearchResultItem._();
  const factory SearchResultItem({
    required SearchResultContext context,
    required SearchResultItemType type,
    required SearchResultItemPageType pageType,
    SearchResultItemPrefix? prefix,
    required int score,
    required String title,
    String? subtitle,
    required int labelHighlightStart,
    required int labelHighlightEnd,
    required String uri,
  }) = _SearchResultItem;

  factory SearchResultItem.fromJson(Map<String, dynamic> json) =>
      _$SearchResultItemFromJson(json);

  IconData get typeIcon => {
        SearchResultItemType.page: Ionicons.document_outline,
        SearchResultItemType.section: FeatherIcons.hash,
        SearchResultItemType.content: Ionicons.menu_outline,
        SearchResultItemType.recent: Ionicons.time_outline,
        SearchResultItemType.favorite: Ionicons.star_outline,
      }[type]!;
}
