// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'searches.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchableElementTearOff {
  const _$SearchableElementTearOff();

  _SearchableElement call(
      {required SearchableType type,
      required SearchableHitType hitType,
      required Searchable searchable,
      required String text}) {
    return _SearchableElement(
      type: type,
      hitType: hitType,
      searchable: searchable,
      text: text,
    );
  }
}

/// @nodoc
const $SearchableElement = _$SearchableElementTearOff();

/// @nodoc
mixin _$SearchableElement {
  SearchableType get type => throw _privateConstructorUsedError;
  SearchableHitType get hitType => throw _privateConstructorUsedError;
  Searchable get searchable => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchableElementCopyWith<SearchableElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchableElementCopyWith<$Res> {
  factory $SearchableElementCopyWith(
          SearchableElement value, $Res Function(SearchableElement) then) =
      _$SearchableElementCopyWithImpl<$Res>;
  $Res call(
      {SearchableType type,
      SearchableHitType hitType,
      Searchable searchable,
      String text});
}

/// @nodoc
class _$SearchableElementCopyWithImpl<$Res>
    implements $SearchableElementCopyWith<$Res> {
  _$SearchableElementCopyWithImpl(this._value, this._then);

  final SearchableElement _value;
  // ignore: unused_field
  final $Res Function(SearchableElement) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? hitType = freezed,
    Object? searchable = freezed,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SearchableType,
      hitType: hitType == freezed
          ? _value.hitType
          : hitType // ignore: cast_nullable_to_non_nullable
              as SearchableHitType,
      searchable: searchable == freezed
          ? _value.searchable
          : searchable // ignore: cast_nullable_to_non_nullable
              as Searchable,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SearchableElementCopyWith<$Res>
    implements $SearchableElementCopyWith<$Res> {
  factory _$SearchableElementCopyWith(
          _SearchableElement value, $Res Function(_SearchableElement) then) =
      __$SearchableElementCopyWithImpl<$Res>;
  @override
  $Res call(
      {SearchableType type,
      SearchableHitType hitType,
      Searchable searchable,
      String text});
}

/// @nodoc
class __$SearchableElementCopyWithImpl<$Res>
    extends _$SearchableElementCopyWithImpl<$Res>
    implements _$SearchableElementCopyWith<$Res> {
  __$SearchableElementCopyWithImpl(
      _SearchableElement _value, $Res Function(_SearchableElement) _then)
      : super(_value, (v) => _then(v as _SearchableElement));

  @override
  _SearchableElement get _value => super._value as _SearchableElement;

  @override
  $Res call({
    Object? type = freezed,
    Object? hitType = freezed,
    Object? searchable = freezed,
    Object? text = freezed,
  }) {
    return _then(_SearchableElement(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SearchableType,
      hitType: hitType == freezed
          ? _value.hitType
          : hitType // ignore: cast_nullable_to_non_nullable
              as SearchableHitType,
      searchable: searchable == freezed
          ? _value.searchable
          : searchable // ignore: cast_nullable_to_non_nullable
              as Searchable,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchableElement extends _SearchableElement {
  const _$_SearchableElement(
      {required this.type,
      required this.hitType,
      required this.searchable,
      required this.text})
      : super._();

  @override
  final SearchableType type;
  @override
  final SearchableHitType hitType;
  @override
  final Searchable searchable;
  @override
  final String text;

  @override
  String toString() {
    return 'SearchableElement(type: $type, hitType: $hitType, searchable: $searchable, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchableElement &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.hitType, hitType) &&
            const DeepCollectionEquality()
                .equals(other.searchable, searchable) &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(hitType),
      const DeepCollectionEquality().hash(searchable),
      const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
  _$SearchableElementCopyWith<_SearchableElement> get copyWith =>
      __$SearchableElementCopyWithImpl<_SearchableElement>(this, _$identity);
}

abstract class _SearchableElement extends SearchableElement {
  const factory _SearchableElement(
      {required SearchableType type,
      required SearchableHitType hitType,
      required Searchable searchable,
      required String text}) = _$_SearchableElement;
  const _SearchableElement._() : super._();

  @override
  SearchableType get type;
  @override
  SearchableHitType get hitType;
  @override
  Searchable get searchable;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$SearchableElementCopyWith<_SearchableElement> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchResultItem _$SearchResultItemFromJson(Map<String, dynamic> json) {
  return _SearchResultItem.fromJson(json);
}

/// @nodoc
class _$SearchResultItemTearOff {
  const _$SearchResultItemTearOff();

  _SearchResultItem call(
      {required SearchResultContext context,
      required SearchResultItemType type,
      required SearchResultItemPageType pageType,
      required int score,
      required String title,
      String? subtitle,
      required int labelHighlightStart,
      required int labelHighlightEnd,
      required String uri}) {
    return _SearchResultItem(
      context: context,
      type: type,
      pageType: pageType,
      score: score,
      title: title,
      subtitle: subtitle,
      labelHighlightStart: labelHighlightStart,
      labelHighlightEnd: labelHighlightEnd,
      uri: uri,
    );
  }

  SearchResultItem fromJson(Map<String, Object?> json) {
    return SearchResultItem.fromJson(json);
  }
}

/// @nodoc
const $SearchResultItem = _$SearchResultItemTearOff();

/// @nodoc
mixin _$SearchResultItem {
  SearchResultContext get context => throw _privateConstructorUsedError;
  SearchResultItemType get type => throw _privateConstructorUsedError;
  SearchResultItemPageType get pageType => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  int get labelHighlightStart => throw _privateConstructorUsedError;
  int get labelHighlightEnd => throw _privateConstructorUsedError;
  String get uri => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchResultItemCopyWith<SearchResultItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultItemCopyWith<$Res> {
  factory $SearchResultItemCopyWith(
          SearchResultItem value, $Res Function(SearchResultItem) then) =
      _$SearchResultItemCopyWithImpl<$Res>;
  $Res call(
      {SearchResultContext context,
      SearchResultItemType type,
      SearchResultItemPageType pageType,
      int score,
      String title,
      String? subtitle,
      int labelHighlightStart,
      int labelHighlightEnd,
      String uri});
}

/// @nodoc
class _$SearchResultItemCopyWithImpl<$Res>
    implements $SearchResultItemCopyWith<$Res> {
  _$SearchResultItemCopyWithImpl(this._value, this._then);

  final SearchResultItem _value;
  // ignore: unused_field
  final $Res Function(SearchResultItem) _then;

  @override
  $Res call({
    Object? context = freezed,
    Object? type = freezed,
    Object? pageType = freezed,
    Object? score = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? labelHighlightStart = freezed,
    Object? labelHighlightEnd = freezed,
    Object? uri = freezed,
  }) {
    return _then(_value.copyWith(
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as SearchResultContext,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SearchResultItemType,
      pageType: pageType == freezed
          ? _value.pageType
          : pageType // ignore: cast_nullable_to_non_nullable
              as SearchResultItemPageType,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: subtitle == freezed
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      labelHighlightStart: labelHighlightStart == freezed
          ? _value.labelHighlightStart
          : labelHighlightStart // ignore: cast_nullable_to_non_nullable
              as int,
      labelHighlightEnd: labelHighlightEnd == freezed
          ? _value.labelHighlightEnd
          : labelHighlightEnd // ignore: cast_nullable_to_non_nullable
              as int,
      uri: uri == freezed
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SearchResultItemCopyWith<$Res>
    implements $SearchResultItemCopyWith<$Res> {
  factory _$SearchResultItemCopyWith(
          _SearchResultItem value, $Res Function(_SearchResultItem) then) =
      __$SearchResultItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {SearchResultContext context,
      SearchResultItemType type,
      SearchResultItemPageType pageType,
      int score,
      String title,
      String? subtitle,
      int labelHighlightStart,
      int labelHighlightEnd,
      String uri});
}

/// @nodoc
class __$SearchResultItemCopyWithImpl<$Res>
    extends _$SearchResultItemCopyWithImpl<$Res>
    implements _$SearchResultItemCopyWith<$Res> {
  __$SearchResultItemCopyWithImpl(
      _SearchResultItem _value, $Res Function(_SearchResultItem) _then)
      : super(_value, (v) => _then(v as _SearchResultItem));

  @override
  _SearchResultItem get _value => super._value as _SearchResultItem;

  @override
  $Res call({
    Object? context = freezed,
    Object? type = freezed,
    Object? pageType = freezed,
    Object? score = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? labelHighlightStart = freezed,
    Object? labelHighlightEnd = freezed,
    Object? uri = freezed,
  }) {
    return _then(_SearchResultItem(
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as SearchResultContext,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SearchResultItemType,
      pageType: pageType == freezed
          ? _value.pageType
          : pageType // ignore: cast_nullable_to_non_nullable
              as SearchResultItemPageType,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: subtitle == freezed
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      labelHighlightStart: labelHighlightStart == freezed
          ? _value.labelHighlightStart
          : labelHighlightStart // ignore: cast_nullable_to_non_nullable
              as int,
      labelHighlightEnd: labelHighlightEnd == freezed
          ? _value.labelHighlightEnd
          : labelHighlightEnd // ignore: cast_nullable_to_non_nullable
              as int,
      uri: uri == freezed
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchResultItem extends _SearchResultItem {
  const _$_SearchResultItem(
      {required this.context,
      required this.type,
      required this.pageType,
      required this.score,
      required this.title,
      this.subtitle,
      required this.labelHighlightStart,
      required this.labelHighlightEnd,
      required this.uri})
      : super._();

  factory _$_SearchResultItem.fromJson(Map<String, dynamic> json) =>
      _$$_SearchResultItemFromJson(json);

  @override
  final SearchResultContext context;
  @override
  final SearchResultItemType type;
  @override
  final SearchResultItemPageType pageType;
  @override
  final int score;
  @override
  final String title;
  @override
  final String? subtitle;
  @override
  final int labelHighlightStart;
  @override
  final int labelHighlightEnd;
  @override
  final String uri;

  @override
  String toString() {
    return 'SearchResultItem(context: $context, type: $type, pageType: $pageType, score: $score, title: $title, subtitle: $subtitle, labelHighlightStart: $labelHighlightStart, labelHighlightEnd: $labelHighlightEnd, uri: $uri)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchResultItem &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.pageType, pageType) &&
            const DeepCollectionEquality().equals(other.score, score) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.subtitle, subtitle) &&
            const DeepCollectionEquality()
                .equals(other.labelHighlightStart, labelHighlightStart) &&
            const DeepCollectionEquality()
                .equals(other.labelHighlightEnd, labelHighlightEnd) &&
            const DeepCollectionEquality().equals(other.uri, uri));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(pageType),
      const DeepCollectionEquality().hash(score),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(subtitle),
      const DeepCollectionEquality().hash(labelHighlightStart),
      const DeepCollectionEquality().hash(labelHighlightEnd),
      const DeepCollectionEquality().hash(uri));

  @JsonKey(ignore: true)
  @override
  _$SearchResultItemCopyWith<_SearchResultItem> get copyWith =>
      __$SearchResultItemCopyWithImpl<_SearchResultItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchResultItemToJson(this);
  }
}

abstract class _SearchResultItem extends SearchResultItem {
  const factory _SearchResultItem(
      {required SearchResultContext context,
      required SearchResultItemType type,
      required SearchResultItemPageType pageType,
      required int score,
      required String title,
      String? subtitle,
      required int labelHighlightStart,
      required int labelHighlightEnd,
      required String uri}) = _$_SearchResultItem;
  const _SearchResultItem._() : super._();

  factory _SearchResultItem.fromJson(Map<String, dynamic> json) =
      _$_SearchResultItem.fromJson;

  @override
  SearchResultContext get context;
  @override
  SearchResultItemType get type;
  @override
  SearchResultItemPageType get pageType;
  @override
  int get score;
  @override
  String get title;
  @override
  String? get subtitle;
  @override
  int get labelHighlightStart;
  @override
  int get labelHighlightEnd;
  @override
  String get uri;
  @override
  @JsonKey(ignore: true)
  _$SearchResultItemCopyWith<_SearchResultItem> get copyWith =>
      throw _privateConstructorUsedError;
}
