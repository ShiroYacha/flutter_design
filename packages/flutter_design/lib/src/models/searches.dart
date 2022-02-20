// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'searches.freezed.dart';
part 'searches.g.dart';

/// Searchable object
abstract class Searchable {
  /// Get all searchable elements
  List<SearchableElement> get searchableElements;
}

/// Type of the searchable object
enum SearchableType {
  page,
  section,
  content,
}

/// Type of the item found by the search
enum SearchableHitType {
  title,
  subtitle,
  description,
}

/// Searchable element
@freezed
class SearchableElement with _$SearchableElement {
  const SearchableElement._();
  const factory SearchableElement({
    /// Type of the searchable object
    required SearchableType type,

    /// Type of the item found by the search
    required SearchableHitType hitType,

    /// Parent searchable object
    required Searchable searchable,

    /// Matching text from the search
    required String text,
  }) = _SearchableElement;
}

/// Context of the search result
enum SearchResultContext {
  documentation,
  recent,
  favorite,
}

/// Type of the search result item
enum SearchResultItemType {
  page,
  section,
  content,
  recent,
  favorite,
}

/// Type of the search result page
enum SearchResultItemPageType {
  document,
  component,
}

/// Represents a single found search result item.
@freezed
class SearchResultItem with _$SearchResultItem {
  const SearchResultItem._();
  const factory SearchResultItem({
    /// Context of the result
    required SearchResultContext context,

    /// Type of the result item
    required SearchResultItemType type,

    /// Type of the page
    required SearchResultItemPageType pageType,

    /// Search score based on text similarity
    required int score,

    /// Title of the result item
    required String title,

    /// Subtitle of the result item
    String? subtitle,

    /// Navigable URI of the result
    required String uri,
  }) = _SearchResultItem;

  factory SearchResultItem.fromJson(Map<String, dynamic> json) =>
      _$SearchResultItemFromJson(json);
}
