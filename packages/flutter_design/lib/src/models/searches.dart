// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'searches.freezed.dart';
part 'searches.g.dart';

abstract class Searchable {
  List<SearchableElement> get searchableElements;
}

enum SearchableType {
  page,
  section,
  content,
}

enum SearchableHitType {
  title,
  description,
  tags,
}

@freezed
class SearchableElement with _$SearchableElement {
  const SearchableElement._();
  const factory SearchableElement({
    required SearchableType type,
    required SearchableHitType hitType,
    required Searchable searchable,
    required String text,
  }) = _SearchableElement;
}

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
}
