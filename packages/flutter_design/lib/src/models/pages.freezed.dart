// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ViewerPageGroupTearOff {
  const _$ViewerPageGroupTearOff();

  _ViewerPageGroup call(
      {required String id,
      required String title,
      ViewerGlyphUnion? glyph,
      List<ViewerPageUnion> children = const []}) {
    return _ViewerPageGroup(
      id: id,
      title: title,
      glyph: glyph,
      children: children,
    );
  }
}

/// @nodoc
const $ViewerPageGroup = _$ViewerPageGroupTearOff();

/// @nodoc
mixin _$ViewerPageGroup {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  ViewerGlyphUnion? get glyph => throw _privateConstructorUsedError;
  List<ViewerPageUnion> get children => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewerPageGroupCopyWith<ViewerPageGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerPageGroupCopyWith<$Res> {
  factory $ViewerPageGroupCopyWith(
          ViewerPageGroup value, $Res Function(ViewerPageGroup) then) =
      _$ViewerPageGroupCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      ViewerGlyphUnion? glyph,
      List<ViewerPageUnion> children});

  $ViewerGlyphUnionCopyWith<$Res>? get glyph;
}

/// @nodoc
class _$ViewerPageGroupCopyWithImpl<$Res>
    implements $ViewerPageGroupCopyWith<$Res> {
  _$ViewerPageGroupCopyWithImpl(this._value, this._then);

  final ViewerPageGroup _value;
  // ignore: unused_field
  final $Res Function(ViewerPageGroup) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? glyph = freezed,
    Object? children = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      glyph: glyph == freezed
          ? _value.glyph
          : glyph // ignore: cast_nullable_to_non_nullable
              as ViewerGlyphUnion?,
      children: children == freezed
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ViewerPageUnion>,
    ));
  }

  @override
  $ViewerGlyphUnionCopyWith<$Res>? get glyph {
    if (_value.glyph == null) {
      return null;
    }

    return $ViewerGlyphUnionCopyWith<$Res>(_value.glyph!, (value) {
      return _then(_value.copyWith(glyph: value));
    });
  }
}

/// @nodoc
abstract class _$ViewerPageGroupCopyWith<$Res>
    implements $ViewerPageGroupCopyWith<$Res> {
  factory _$ViewerPageGroupCopyWith(
          _ViewerPageGroup value, $Res Function(_ViewerPageGroup) then) =
      __$ViewerPageGroupCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      ViewerGlyphUnion? glyph,
      List<ViewerPageUnion> children});

  @override
  $ViewerGlyphUnionCopyWith<$Res>? get glyph;
}

/// @nodoc
class __$ViewerPageGroupCopyWithImpl<$Res>
    extends _$ViewerPageGroupCopyWithImpl<$Res>
    implements _$ViewerPageGroupCopyWith<$Res> {
  __$ViewerPageGroupCopyWithImpl(
      _ViewerPageGroup _value, $Res Function(_ViewerPageGroup) _then)
      : super(_value, (v) => _then(v as _ViewerPageGroup));

  @override
  _ViewerPageGroup get _value => super._value as _ViewerPageGroup;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? glyph = freezed,
    Object? children = freezed,
  }) {
    return _then(_ViewerPageGroup(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      glyph: glyph == freezed
          ? _value.glyph
          : glyph // ignore: cast_nullable_to_non_nullable
              as ViewerGlyphUnion?,
      children: children == freezed
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ViewerPageUnion>,
    ));
  }
}

/// @nodoc

class _$_ViewerPageGroup
    with DiagnosticableTreeMixin
    implements _ViewerPageGroup {
  const _$_ViewerPageGroup(
      {required this.id,
      required this.title,
      this.glyph,
      this.children = const []});

  @override
  final String id;
  @override
  final String title;
  @override
  final ViewerGlyphUnion? glyph;
  @JsonKey()
  @override
  final List<ViewerPageUnion> children;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerPageGroup(id: $id, title: $title, glyph: $glyph, children: $children)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerPageGroup'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('glyph', glyph))
      ..add(DiagnosticsProperty('children', children));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ViewerPageGroup &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.glyph, glyph) &&
            const DeepCollectionEquality().equals(other.children, children));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(glyph),
      const DeepCollectionEquality().hash(children));

  @JsonKey(ignore: true)
  @override
  _$ViewerPageGroupCopyWith<_ViewerPageGroup> get copyWith =>
      __$ViewerPageGroupCopyWithImpl<_ViewerPageGroup>(this, _$identity);
}

abstract class _ViewerPageGroup implements ViewerPageGroup {
  const factory _ViewerPageGroup(
      {required String id,
      required String title,
      ViewerGlyphUnion? glyph,
      List<ViewerPageUnion> children}) = _$_ViewerPageGroup;

  @override
  String get id;
  @override
  String get title;
  @override
  ViewerGlyphUnion? get glyph;
  @override
  List<ViewerPageUnion> get children;
  @override
  @JsonKey(ignore: true)
  _$ViewerPageGroupCopyWith<_ViewerPageGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ViewerPageUnionTearOff {
  const _$ViewerPageUnionTearOff();

  ViewerGroupPage group(
      {required String id,
      required List<String> namespace,
      required String title,
      String? description,
      List<ViewerPageUnion> children = const []}) {
    return ViewerGroupPage(
      id: id,
      namespace: namespace,
      title: title,
      description: description,
      children: children,
    );
  }

  ViewerDocumentationPage documentation(
      {required String id,
      required List<String> namespace,
      required String title,
      String? description,
      List<String> tags = const [],
      required String content}) {
    return ViewerDocumentationPage(
      id: id,
      namespace: namespace,
      title: title,
      description: description,
      tags: tags,
      content: content,
    );
  }

  ViewerCatalogPage catalog(
      {required String id,
      required List<String> namespace,
      required String title,
      List<String> tags = const [],
      String? description,
      String? embeddedDesignLink,
      required String catalogBuilderId}) {
    return ViewerCatalogPage(
      id: id,
      namespace: namespace,
      title: title,
      tags: tags,
      description: description,
      embeddedDesignLink: embeddedDesignLink,
      catalogBuilderId: catalogBuilderId,
    );
  }
}

/// @nodoc
const $ViewerPageUnion = _$ViewerPageUnionTearOff();

/// @nodoc
mixin _$ViewerPageUnion {
  String get id => throw _privateConstructorUsedError;
  List<String> get namespace => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, List<String> namespace, String title,
            String? description, List<ViewerPageUnion> children)
        group,
    required TResult Function(String id, List<String> namespace, String title,
            String? description, List<String> tags, String content)
        documentation,
    required TResult Function(
            String id,
            List<String> namespace,
            String title,
            List<String> tags,
            String? description,
            String? embeddedDesignLink,
            String catalogBuilderId)
        catalog,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id, List<String> namespace, String title,
            String? description, List<ViewerPageUnion> children)?
        group,
    TResult Function(String id, List<String> namespace, String title,
            String? description, List<String> tags, String content)?
        documentation,
    TResult Function(
            String id,
            List<String> namespace,
            String title,
            List<String> tags,
            String? description,
            String? embeddedDesignLink,
            String catalogBuilderId)?
        catalog,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, List<String> namespace, String title,
            String? description, List<ViewerPageUnion> children)?
        group,
    TResult Function(String id, List<String> namespace, String title,
            String? description, List<String> tags, String content)?
        documentation,
    TResult Function(
            String id,
            List<String> namespace,
            String title,
            List<String> tags,
            String? description,
            String? embeddedDesignLink,
            String catalogBuilderId)?
        catalog,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerGroupPage value) group,
    required TResult Function(ViewerDocumentationPage value) documentation,
    required TResult Function(ViewerCatalogPage value) catalog,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerGroupPage value)? group,
    TResult Function(ViewerDocumentationPage value)? documentation,
    TResult Function(ViewerCatalogPage value)? catalog,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerGroupPage value)? group,
    TResult Function(ViewerDocumentationPage value)? documentation,
    TResult Function(ViewerCatalogPage value)? catalog,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewerPageUnionCopyWith<ViewerPageUnion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerPageUnionCopyWith<$Res> {
  factory $ViewerPageUnionCopyWith(
          ViewerPageUnion value, $Res Function(ViewerPageUnion) then) =
      _$ViewerPageUnionCopyWithImpl<$Res>;
  $Res call(
      {String id, List<String> namespace, String title, String? description});
}

/// @nodoc
class _$ViewerPageUnionCopyWithImpl<$Res>
    implements $ViewerPageUnionCopyWith<$Res> {
  _$ViewerPageUnionCopyWithImpl(this._value, this._then);

  final ViewerPageUnion _value;
  // ignore: unused_field
  final $Res Function(ViewerPageUnion) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? namespace = freezed,
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      namespace: namespace == freezed
          ? _value.namespace
          : namespace // ignore: cast_nullable_to_non_nullable
              as List<String>,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class $ViewerGroupPageCopyWith<$Res>
    implements $ViewerPageUnionCopyWith<$Res> {
  factory $ViewerGroupPageCopyWith(
          ViewerGroupPage value, $Res Function(ViewerGroupPage) then) =
      _$ViewerGroupPageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      List<String> namespace,
      String title,
      String? description,
      List<ViewerPageUnion> children});
}

/// @nodoc
class _$ViewerGroupPageCopyWithImpl<$Res>
    extends _$ViewerPageUnionCopyWithImpl<$Res>
    implements $ViewerGroupPageCopyWith<$Res> {
  _$ViewerGroupPageCopyWithImpl(
      ViewerGroupPage _value, $Res Function(ViewerGroupPage) _then)
      : super(_value, (v) => _then(v as ViewerGroupPage));

  @override
  ViewerGroupPage get _value => super._value as ViewerGroupPage;

  @override
  $Res call({
    Object? id = freezed,
    Object? namespace = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? children = freezed,
  }) {
    return _then(ViewerGroupPage(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      namespace: namespace == freezed
          ? _value.namespace
          : namespace // ignore: cast_nullable_to_non_nullable
              as List<String>,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      children: children == freezed
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ViewerPageUnion>,
    ));
  }
}

/// @nodoc

class _$ViewerGroupPage extends ViewerGroupPage with DiagnosticableTreeMixin {
  const _$ViewerGroupPage(
      {required this.id,
      required this.namespace,
      required this.title,
      this.description,
      this.children = const []})
      : super._();

  @override
  final String id;
  @override
  final List<String> namespace;
  @override
  final String title;
  @override
  final String? description;
  @JsonKey()
  @override
  final List<ViewerPageUnion> children;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerPageUnion.group(id: $id, namespace: $namespace, title: $title, description: $description, children: $children)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerPageUnion.group'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('namespace', namespace))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('children', children));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewerGroupPage &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.namespace, namespace) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.children, children));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(namespace),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(children));

  @JsonKey(ignore: true)
  @override
  $ViewerGroupPageCopyWith<ViewerGroupPage> get copyWith =>
      _$ViewerGroupPageCopyWithImpl<ViewerGroupPage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, List<String> namespace, String title,
            String? description, List<ViewerPageUnion> children)
        group,
    required TResult Function(String id, List<String> namespace, String title,
            String? description, List<String> tags, String content)
        documentation,
    required TResult Function(
            String id,
            List<String> namespace,
            String title,
            List<String> tags,
            String? description,
            String? embeddedDesignLink,
            String catalogBuilderId)
        catalog,
  }) {
    return group(id, namespace, title, description, children);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id, List<String> namespace, String title,
            String? description, List<ViewerPageUnion> children)?
        group,
    TResult Function(String id, List<String> namespace, String title,
            String? description, List<String> tags, String content)?
        documentation,
    TResult Function(
            String id,
            List<String> namespace,
            String title,
            List<String> tags,
            String? description,
            String? embeddedDesignLink,
            String catalogBuilderId)?
        catalog,
  }) {
    return group?.call(id, namespace, title, description, children);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, List<String> namespace, String title,
            String? description, List<ViewerPageUnion> children)?
        group,
    TResult Function(String id, List<String> namespace, String title,
            String? description, List<String> tags, String content)?
        documentation,
    TResult Function(
            String id,
            List<String> namespace,
            String title,
            List<String> tags,
            String? description,
            String? embeddedDesignLink,
            String catalogBuilderId)?
        catalog,
    required TResult orElse(),
  }) {
    if (group != null) {
      return group(id, namespace, title, description, children);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerGroupPage value) group,
    required TResult Function(ViewerDocumentationPage value) documentation,
    required TResult Function(ViewerCatalogPage value) catalog,
  }) {
    return group(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerGroupPage value)? group,
    TResult Function(ViewerDocumentationPage value)? documentation,
    TResult Function(ViewerCatalogPage value)? catalog,
  }) {
    return group?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerGroupPage value)? group,
    TResult Function(ViewerDocumentationPage value)? documentation,
    TResult Function(ViewerCatalogPage value)? catalog,
    required TResult orElse(),
  }) {
    if (group != null) {
      return group(this);
    }
    return orElse();
  }
}

abstract class ViewerGroupPage extends ViewerPageUnion {
  const factory ViewerGroupPage(
      {required String id,
      required List<String> namespace,
      required String title,
      String? description,
      List<ViewerPageUnion> children}) = _$ViewerGroupPage;
  const ViewerGroupPage._() : super._();

  @override
  String get id;
  @override
  List<String> get namespace;
  @override
  String get title;
  @override
  String? get description;
  List<ViewerPageUnion> get children;
  @override
  @JsonKey(ignore: true)
  $ViewerGroupPageCopyWith<ViewerGroupPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerDocumentationPageCopyWith<$Res>
    implements $ViewerPageUnionCopyWith<$Res> {
  factory $ViewerDocumentationPageCopyWith(ViewerDocumentationPage value,
          $Res Function(ViewerDocumentationPage) then) =
      _$ViewerDocumentationPageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      List<String> namespace,
      String title,
      String? description,
      List<String> tags,
      String content});
}

/// @nodoc
class _$ViewerDocumentationPageCopyWithImpl<$Res>
    extends _$ViewerPageUnionCopyWithImpl<$Res>
    implements $ViewerDocumentationPageCopyWith<$Res> {
  _$ViewerDocumentationPageCopyWithImpl(ViewerDocumentationPage _value,
      $Res Function(ViewerDocumentationPage) _then)
      : super(_value, (v) => _then(v as ViewerDocumentationPage));

  @override
  ViewerDocumentationPage get _value => super._value as ViewerDocumentationPage;

  @override
  $Res call({
    Object? id = freezed,
    Object? namespace = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? tags = freezed,
    Object? content = freezed,
  }) {
    return _then(ViewerDocumentationPage(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      namespace: namespace == freezed
          ? _value.namespace
          : namespace // ignore: cast_nullable_to_non_nullable
              as List<String>,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ViewerDocumentationPage extends ViewerDocumentationPage
    with DiagnosticableTreeMixin {
  const _$ViewerDocumentationPage(
      {required this.id,
      required this.namespace,
      required this.title,
      this.description,
      this.tags = const [],
      required this.content})
      : super._();

  @override
  final String id;
  @override
  final List<String> namespace;
  @override
  final String title;
  @override
  final String? description;
  @JsonKey()
  @override
  final List<String> tags;
  @override
  final String content;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerPageUnion.documentation(id: $id, namespace: $namespace, title: $title, description: $description, tags: $tags, content: $content)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerPageUnion.documentation'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('namespace', namespace))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('content', content));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewerDocumentationPage &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.namespace, namespace) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(namespace),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(tags),
      const DeepCollectionEquality().hash(content));

  @JsonKey(ignore: true)
  @override
  $ViewerDocumentationPageCopyWith<ViewerDocumentationPage> get copyWith =>
      _$ViewerDocumentationPageCopyWithImpl<ViewerDocumentationPage>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, List<String> namespace, String title,
            String? description, List<ViewerPageUnion> children)
        group,
    required TResult Function(String id, List<String> namespace, String title,
            String? description, List<String> tags, String content)
        documentation,
    required TResult Function(
            String id,
            List<String> namespace,
            String title,
            List<String> tags,
            String? description,
            String? embeddedDesignLink,
            String catalogBuilderId)
        catalog,
  }) {
    return documentation(id, namespace, title, description, tags, content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id, List<String> namespace, String title,
            String? description, List<ViewerPageUnion> children)?
        group,
    TResult Function(String id, List<String> namespace, String title,
            String? description, List<String> tags, String content)?
        documentation,
    TResult Function(
            String id,
            List<String> namespace,
            String title,
            List<String> tags,
            String? description,
            String? embeddedDesignLink,
            String catalogBuilderId)?
        catalog,
  }) {
    return documentation?.call(
        id, namespace, title, description, tags, content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, List<String> namespace, String title,
            String? description, List<ViewerPageUnion> children)?
        group,
    TResult Function(String id, List<String> namespace, String title,
            String? description, List<String> tags, String content)?
        documentation,
    TResult Function(
            String id,
            List<String> namespace,
            String title,
            List<String> tags,
            String? description,
            String? embeddedDesignLink,
            String catalogBuilderId)?
        catalog,
    required TResult orElse(),
  }) {
    if (documentation != null) {
      return documentation(id, namespace, title, description, tags, content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerGroupPage value) group,
    required TResult Function(ViewerDocumentationPage value) documentation,
    required TResult Function(ViewerCatalogPage value) catalog,
  }) {
    return documentation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerGroupPage value)? group,
    TResult Function(ViewerDocumentationPage value)? documentation,
    TResult Function(ViewerCatalogPage value)? catalog,
  }) {
    return documentation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerGroupPage value)? group,
    TResult Function(ViewerDocumentationPage value)? documentation,
    TResult Function(ViewerCatalogPage value)? catalog,
    required TResult orElse(),
  }) {
    if (documentation != null) {
      return documentation(this);
    }
    return orElse();
  }
}

abstract class ViewerDocumentationPage extends ViewerPageUnion {
  const factory ViewerDocumentationPage(
      {required String id,
      required List<String> namespace,
      required String title,
      String? description,
      List<String> tags,
      required String content}) = _$ViewerDocumentationPage;
  const ViewerDocumentationPage._() : super._();

  @override
  String get id;
  @override
  List<String> get namespace;
  @override
  String get title;
  @override
  String? get description;
  List<String> get tags;
  String get content;
  @override
  @JsonKey(ignore: true)
  $ViewerDocumentationPageCopyWith<ViewerDocumentationPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerCatalogPageCopyWith<$Res>
    implements $ViewerPageUnionCopyWith<$Res> {
  factory $ViewerCatalogPageCopyWith(
          ViewerCatalogPage value, $Res Function(ViewerCatalogPage) then) =
      _$ViewerCatalogPageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      List<String> namespace,
      String title,
      List<String> tags,
      String? description,
      String? embeddedDesignLink,
      String catalogBuilderId});
}

/// @nodoc
class _$ViewerCatalogPageCopyWithImpl<$Res>
    extends _$ViewerPageUnionCopyWithImpl<$Res>
    implements $ViewerCatalogPageCopyWith<$Res> {
  _$ViewerCatalogPageCopyWithImpl(
      ViewerCatalogPage _value, $Res Function(ViewerCatalogPage) _then)
      : super(_value, (v) => _then(v as ViewerCatalogPage));

  @override
  ViewerCatalogPage get _value => super._value as ViewerCatalogPage;

  @override
  $Res call({
    Object? id = freezed,
    Object? namespace = freezed,
    Object? title = freezed,
    Object? tags = freezed,
    Object? description = freezed,
    Object? embeddedDesignLink = freezed,
    Object? catalogBuilderId = freezed,
  }) {
    return _then(ViewerCatalogPage(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      namespace: namespace == freezed
          ? _value.namespace
          : namespace // ignore: cast_nullable_to_non_nullable
              as List<String>,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      embeddedDesignLink: embeddedDesignLink == freezed
          ? _value.embeddedDesignLink
          : embeddedDesignLink // ignore: cast_nullable_to_non_nullable
              as String?,
      catalogBuilderId: catalogBuilderId == freezed
          ? _value.catalogBuilderId
          : catalogBuilderId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ViewerCatalogPage extends ViewerCatalogPage
    with DiagnosticableTreeMixin {
  const _$ViewerCatalogPage(
      {required this.id,
      required this.namespace,
      required this.title,
      this.tags = const [],
      this.description,
      this.embeddedDesignLink,
      required this.catalogBuilderId})
      : super._();

  @override
  final String id;
  @override
  final List<String> namespace;
  @override
  final String title;
  @JsonKey()
  @override
  final List<String> tags;
  @override
  final String? description;
  @override
  final String? embeddedDesignLink;
  @override
  final String catalogBuilderId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerPageUnion.catalog(id: $id, namespace: $namespace, title: $title, tags: $tags, description: $description, embeddedDesignLink: $embeddedDesignLink, catalogBuilderId: $catalogBuilderId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerPageUnion.catalog'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('namespace', namespace))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('embeddedDesignLink', embeddedDesignLink))
      ..add(DiagnosticsProperty('catalogBuilderId', catalogBuilderId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewerCatalogPage &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.namespace, namespace) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.embeddedDesignLink, embeddedDesignLink) &&
            const DeepCollectionEquality()
                .equals(other.catalogBuilderId, catalogBuilderId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(namespace),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(tags),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(embeddedDesignLink),
      const DeepCollectionEquality().hash(catalogBuilderId));

  @JsonKey(ignore: true)
  @override
  $ViewerCatalogPageCopyWith<ViewerCatalogPage> get copyWith =>
      _$ViewerCatalogPageCopyWithImpl<ViewerCatalogPage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, List<String> namespace, String title,
            String? description, List<ViewerPageUnion> children)
        group,
    required TResult Function(String id, List<String> namespace, String title,
            String? description, List<String> tags, String content)
        documentation,
    required TResult Function(
            String id,
            List<String> namespace,
            String title,
            List<String> tags,
            String? description,
            String? embeddedDesignLink,
            String catalogBuilderId)
        catalog,
  }) {
    return catalog(id, namespace, title, tags, description, embeddedDesignLink,
        catalogBuilderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id, List<String> namespace, String title,
            String? description, List<ViewerPageUnion> children)?
        group,
    TResult Function(String id, List<String> namespace, String title,
            String? description, List<String> tags, String content)?
        documentation,
    TResult Function(
            String id,
            List<String> namespace,
            String title,
            List<String> tags,
            String? description,
            String? embeddedDesignLink,
            String catalogBuilderId)?
        catalog,
  }) {
    return catalog?.call(id, namespace, title, tags, description,
        embeddedDesignLink, catalogBuilderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, List<String> namespace, String title,
            String? description, List<ViewerPageUnion> children)?
        group,
    TResult Function(String id, List<String> namespace, String title,
            String? description, List<String> tags, String content)?
        documentation,
    TResult Function(
            String id,
            List<String> namespace,
            String title,
            List<String> tags,
            String? description,
            String? embeddedDesignLink,
            String catalogBuilderId)?
        catalog,
    required TResult orElse(),
  }) {
    if (catalog != null) {
      return catalog(id, namespace, title, tags, description,
          embeddedDesignLink, catalogBuilderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerGroupPage value) group,
    required TResult Function(ViewerDocumentationPage value) documentation,
    required TResult Function(ViewerCatalogPage value) catalog,
  }) {
    return catalog(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerGroupPage value)? group,
    TResult Function(ViewerDocumentationPage value)? documentation,
    TResult Function(ViewerCatalogPage value)? catalog,
  }) {
    return catalog?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerGroupPage value)? group,
    TResult Function(ViewerDocumentationPage value)? documentation,
    TResult Function(ViewerCatalogPage value)? catalog,
    required TResult orElse(),
  }) {
    if (catalog != null) {
      return catalog(this);
    }
    return orElse();
  }
}

abstract class ViewerCatalogPage extends ViewerPageUnion {
  const factory ViewerCatalogPage(
      {required String id,
      required List<String> namespace,
      required String title,
      List<String> tags,
      String? description,
      String? embeddedDesignLink,
      required String catalogBuilderId}) = _$ViewerCatalogPage;
  const ViewerCatalogPage._() : super._();

  @override
  String get id;
  @override
  List<String> get namespace;
  @override
  String get title;
  List<String> get tags;
  @override
  String? get description;
  String? get embeddedDesignLink;
  String get catalogBuilderId;
  @override
  @JsonKey(ignore: true)
  $ViewerCatalogPageCopyWith<ViewerCatalogPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ViewerGlyphUnionTearOff {
  const _$ViewerGlyphUnionTearOff();

  ViewerIconGlyph icon({required IconData icon, double size = 18}) {
    return ViewerIconGlyph(
      icon: icon,
      size: size,
    );
  }

  ViewerImageGlyph image({required String uri, double size = 18}) {
    return ViewerImageGlyph(
      uri: uri,
      size: size,
    );
  }
}

/// @nodoc
const $ViewerGlyphUnion = _$ViewerGlyphUnionTearOff();

/// @nodoc
mixin _$ViewerGlyphUnion {
  double get size => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IconData icon, double size) icon,
    required TResult Function(String uri, double size) image,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(IconData icon, double size)? icon,
    TResult Function(String uri, double size)? image,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IconData icon, double size)? icon,
    TResult Function(String uri, double size)? image,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerIconGlyph value) icon,
    required TResult Function(ViewerImageGlyph value) image,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerIconGlyph value)? icon,
    TResult Function(ViewerImageGlyph value)? image,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerIconGlyph value)? icon,
    TResult Function(ViewerImageGlyph value)? image,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewerGlyphUnionCopyWith<ViewerGlyphUnion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerGlyphUnionCopyWith<$Res> {
  factory $ViewerGlyphUnionCopyWith(
          ViewerGlyphUnion value, $Res Function(ViewerGlyphUnion) then) =
      _$ViewerGlyphUnionCopyWithImpl<$Res>;
  $Res call({double size});
}

/// @nodoc
class _$ViewerGlyphUnionCopyWithImpl<$Res>
    implements $ViewerGlyphUnionCopyWith<$Res> {
  _$ViewerGlyphUnionCopyWithImpl(this._value, this._then);

  final ViewerGlyphUnion _value;
  // ignore: unused_field
  final $Res Function(ViewerGlyphUnion) _then;

  @override
  $Res call({
    Object? size = freezed,
  }) {
    return _then(_value.copyWith(
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class $ViewerIconGlyphCopyWith<$Res>
    implements $ViewerGlyphUnionCopyWith<$Res> {
  factory $ViewerIconGlyphCopyWith(
          ViewerIconGlyph value, $Res Function(ViewerIconGlyph) then) =
      _$ViewerIconGlyphCopyWithImpl<$Res>;
  @override
  $Res call({IconData icon, double size});
}

/// @nodoc
class _$ViewerIconGlyphCopyWithImpl<$Res>
    extends _$ViewerGlyphUnionCopyWithImpl<$Res>
    implements $ViewerIconGlyphCopyWith<$Res> {
  _$ViewerIconGlyphCopyWithImpl(
      ViewerIconGlyph _value, $Res Function(ViewerIconGlyph) _then)
      : super(_value, (v) => _then(v as ViewerIconGlyph));

  @override
  ViewerIconGlyph get _value => super._value as ViewerIconGlyph;

  @override
  $Res call({
    Object? icon = freezed,
    Object? size = freezed,
  }) {
    return _then(ViewerIconGlyph(
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ViewerIconGlyph extends ViewerIconGlyph with DiagnosticableTreeMixin {
  const _$ViewerIconGlyph({required this.icon, this.size = 18}) : super._();

  @override
  final IconData icon;
  @JsonKey()
  @override
  final double size;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerGlyphUnion.icon(icon: $icon, size: $size)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerGlyphUnion.icon'))
      ..add(DiagnosticsProperty('icon', icon))
      ..add(DiagnosticsProperty('size', size));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewerIconGlyph &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            const DeepCollectionEquality().equals(other.size, size));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(icon),
      const DeepCollectionEquality().hash(size));

  @JsonKey(ignore: true)
  @override
  $ViewerIconGlyphCopyWith<ViewerIconGlyph> get copyWith =>
      _$ViewerIconGlyphCopyWithImpl<ViewerIconGlyph>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IconData icon, double size) icon,
    required TResult Function(String uri, double size) image,
  }) {
    return icon(this.icon, size);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(IconData icon, double size)? icon,
    TResult Function(String uri, double size)? image,
  }) {
    return icon?.call(this.icon, size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IconData icon, double size)? icon,
    TResult Function(String uri, double size)? image,
    required TResult orElse(),
  }) {
    if (icon != null) {
      return icon(this.icon, size);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerIconGlyph value) icon,
    required TResult Function(ViewerImageGlyph value) image,
  }) {
    return icon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerIconGlyph value)? icon,
    TResult Function(ViewerImageGlyph value)? image,
  }) {
    return icon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerIconGlyph value)? icon,
    TResult Function(ViewerImageGlyph value)? image,
    required TResult orElse(),
  }) {
    if (icon != null) {
      return icon(this);
    }
    return orElse();
  }
}

abstract class ViewerIconGlyph extends ViewerGlyphUnion {
  const factory ViewerIconGlyph({required IconData icon, double size}) =
      _$ViewerIconGlyph;
  const ViewerIconGlyph._() : super._();

  IconData get icon;
  @override
  double get size;
  @override
  @JsonKey(ignore: true)
  $ViewerIconGlyphCopyWith<ViewerIconGlyph> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerImageGlyphCopyWith<$Res>
    implements $ViewerGlyphUnionCopyWith<$Res> {
  factory $ViewerImageGlyphCopyWith(
          ViewerImageGlyph value, $Res Function(ViewerImageGlyph) then) =
      _$ViewerImageGlyphCopyWithImpl<$Res>;
  @override
  $Res call({String uri, double size});
}

/// @nodoc
class _$ViewerImageGlyphCopyWithImpl<$Res>
    extends _$ViewerGlyphUnionCopyWithImpl<$Res>
    implements $ViewerImageGlyphCopyWith<$Res> {
  _$ViewerImageGlyphCopyWithImpl(
      ViewerImageGlyph _value, $Res Function(ViewerImageGlyph) _then)
      : super(_value, (v) => _then(v as ViewerImageGlyph));

  @override
  ViewerImageGlyph get _value => super._value as ViewerImageGlyph;

  @override
  $Res call({
    Object? uri = freezed,
    Object? size = freezed,
  }) {
    return _then(ViewerImageGlyph(
      uri: uri == freezed
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ViewerImageGlyph extends ViewerImageGlyph with DiagnosticableTreeMixin {
  const _$ViewerImageGlyph({required this.uri, this.size = 18}) : super._();

  @override
  final String uri;
  @JsonKey()
  @override
  final double size;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerGlyphUnion.image(uri: $uri, size: $size)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerGlyphUnion.image'))
      ..add(DiagnosticsProperty('uri', uri))
      ..add(DiagnosticsProperty('size', size));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewerImageGlyph &&
            const DeepCollectionEquality().equals(other.uri, uri) &&
            const DeepCollectionEquality().equals(other.size, size));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uri),
      const DeepCollectionEquality().hash(size));

  @JsonKey(ignore: true)
  @override
  $ViewerImageGlyphCopyWith<ViewerImageGlyph> get copyWith =>
      _$ViewerImageGlyphCopyWithImpl<ViewerImageGlyph>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IconData icon, double size) icon,
    required TResult Function(String uri, double size) image,
  }) {
    return image(uri, size);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(IconData icon, double size)? icon,
    TResult Function(String uri, double size)? image,
  }) {
    return image?.call(uri, size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IconData icon, double size)? icon,
    TResult Function(String uri, double size)? image,
    required TResult orElse(),
  }) {
    if (image != null) {
      return image(uri, size);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerIconGlyph value) icon,
    required TResult Function(ViewerImageGlyph value) image,
  }) {
    return image(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerIconGlyph value)? icon,
    TResult Function(ViewerImageGlyph value)? image,
  }) {
    return image?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerIconGlyph value)? icon,
    TResult Function(ViewerImageGlyph value)? image,
    required TResult orElse(),
  }) {
    if (image != null) {
      return image(this);
    }
    return orElse();
  }
}

abstract class ViewerImageGlyph extends ViewerGlyphUnion {
  const factory ViewerImageGlyph({required String uri, double size}) =
      _$ViewerImageGlyph;
  const ViewerImageGlyph._() : super._();

  String get uri;
  @override
  double get size;
  @override
  @JsonKey(ignore: true)
  $ViewerImageGlyphCopyWith<ViewerImageGlyph> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ViewerSourceCodeTearOff {
  const _$ViewerSourceCodeTearOff();

  _ViewerSourceCode call({required String location, required String code}) {
    return _ViewerSourceCode(
      location: location,
      code: code,
    );
  }
}

/// @nodoc
const $ViewerSourceCode = _$ViewerSourceCodeTearOff();

/// @nodoc
mixin _$ViewerSourceCode {
  String get location => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewerSourceCodeCopyWith<ViewerSourceCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerSourceCodeCopyWith<$Res> {
  factory $ViewerSourceCodeCopyWith(
          ViewerSourceCode value, $Res Function(ViewerSourceCode) then) =
      _$ViewerSourceCodeCopyWithImpl<$Res>;
  $Res call({String location, String code});
}

/// @nodoc
class _$ViewerSourceCodeCopyWithImpl<$Res>
    implements $ViewerSourceCodeCopyWith<$Res> {
  _$ViewerSourceCodeCopyWithImpl(this._value, this._then);

  final ViewerSourceCode _value;
  // ignore: unused_field
  final $Res Function(ViewerSourceCode) _then;

  @override
  $Res call({
    Object? location = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ViewerSourceCodeCopyWith<$Res>
    implements $ViewerSourceCodeCopyWith<$Res> {
  factory _$ViewerSourceCodeCopyWith(
          _ViewerSourceCode value, $Res Function(_ViewerSourceCode) then) =
      __$ViewerSourceCodeCopyWithImpl<$Res>;
  @override
  $Res call({String location, String code});
}

/// @nodoc
class __$ViewerSourceCodeCopyWithImpl<$Res>
    extends _$ViewerSourceCodeCopyWithImpl<$Res>
    implements _$ViewerSourceCodeCopyWith<$Res> {
  __$ViewerSourceCodeCopyWithImpl(
      _ViewerSourceCode _value, $Res Function(_ViewerSourceCode) _then)
      : super(_value, (v) => _then(v as _ViewerSourceCode));

  @override
  _ViewerSourceCode get _value => super._value as _ViewerSourceCode;

  @override
  $Res call({
    Object? location = freezed,
    Object? code = freezed,
  }) {
    return _then(_ViewerSourceCode(
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ViewerSourceCode
    with DiagnosticableTreeMixin
    implements _ViewerSourceCode {
  const _$_ViewerSourceCode({required this.location, required this.code});

  @override
  final String location;
  @override
  final String code;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerSourceCode(location: $location, code: $code)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerSourceCode'))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('code', code));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ViewerSourceCode &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  _$ViewerSourceCodeCopyWith<_ViewerSourceCode> get copyWith =>
      __$ViewerSourceCodeCopyWithImpl<_ViewerSourceCode>(this, _$identity);
}

abstract class _ViewerSourceCode implements ViewerSourceCode {
  const factory _ViewerSourceCode(
      {required String location, required String code}) = _$_ViewerSourceCode;

  @override
  String get location;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$ViewerSourceCodeCopyWith<_ViewerSourceCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ViewerCatalogUnionTearOff {
  const _$ViewerCatalogUnionTearOff();

  ViewerPrimaryComponentCatalog primaryComponent(
      {required String id,
      List<ViewerCatalogFeature> features = const [],
      List<ViewerCatalogLink> links = const [],
      required WidgetBuilder builder,
      required ViewerSourceCode sourceCode,
      required List<ViewerExampleUnion> examples,
      List<ViewerSecondaryComponentCatalog> secondaryComponents = const []}) {
    return ViewerPrimaryComponentCatalog(
      id: id,
      features: features,
      links: links,
      builder: builder,
      sourceCode: sourceCode,
      examples: examples,
      secondaryComponents: secondaryComponents,
    );
  }

  ViewerSecondaryComponentCatalog secondaryComponent(
      {required String name,
      String? description,
      required WidgetBuilder builder,
      required ViewerSourceCode sourceCode,
      required List<ViewerExampleUnion> examples}) {
    return ViewerSecondaryComponentCatalog(
      name: name,
      description: description,
      builder: builder,
      sourceCode: sourceCode,
      examples: examples,
    );
  }

  ViewerPrototypeCatalog prototype({required String id}) {
    return ViewerPrototypeCatalog(
      id: id,
    );
  }
}

/// @nodoc
const $ViewerCatalogUnion = _$ViewerCatalogUnionTearOff();

/// @nodoc
mixin _$ViewerCatalogUnion {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            List<ViewerCatalogFeature> features,
            List<ViewerCatalogLink> links,
            WidgetBuilder builder,
            ViewerSourceCode sourceCode,
            List<ViewerExampleUnion> examples,
            List<ViewerSecondaryComponentCatalog> secondaryComponents)
        primaryComponent,
    required TResult Function(
            String name,
            String? description,
            WidgetBuilder builder,
            ViewerSourceCode sourceCode,
            List<ViewerExampleUnion> examples)
        secondaryComponent,
    required TResult Function(String id) prototype,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String id,
            List<ViewerCatalogFeature> features,
            List<ViewerCatalogLink> links,
            WidgetBuilder builder,
            ViewerSourceCode sourceCode,
            List<ViewerExampleUnion> examples,
            List<ViewerSecondaryComponentCatalog> secondaryComponents)?
        primaryComponent,
    TResult Function(String name, String? description, WidgetBuilder builder,
            ViewerSourceCode sourceCode, List<ViewerExampleUnion> examples)?
        secondaryComponent,
    TResult Function(String id)? prototype,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            List<ViewerCatalogFeature> features,
            List<ViewerCatalogLink> links,
            WidgetBuilder builder,
            ViewerSourceCode sourceCode,
            List<ViewerExampleUnion> examples,
            List<ViewerSecondaryComponentCatalog> secondaryComponents)?
        primaryComponent,
    TResult Function(String name, String? description, WidgetBuilder builder,
            ViewerSourceCode sourceCode, List<ViewerExampleUnion> examples)?
        secondaryComponent,
    TResult Function(String id)? prototype,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerPrimaryComponentCatalog value)
        primaryComponent,
    required TResult Function(ViewerSecondaryComponentCatalog value)
        secondaryComponent,
    required TResult Function(ViewerPrototypeCatalog value) prototype,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerPrimaryComponentCatalog value)? primaryComponent,
    TResult Function(ViewerSecondaryComponentCatalog value)? secondaryComponent,
    TResult Function(ViewerPrototypeCatalog value)? prototype,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerPrimaryComponentCatalog value)? primaryComponent,
    TResult Function(ViewerSecondaryComponentCatalog value)? secondaryComponent,
    TResult Function(ViewerPrototypeCatalog value)? prototype,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerCatalogUnionCopyWith<$Res> {
  factory $ViewerCatalogUnionCopyWith(
          ViewerCatalogUnion value, $Res Function(ViewerCatalogUnion) then) =
      _$ViewerCatalogUnionCopyWithImpl<$Res>;
}

/// @nodoc
class _$ViewerCatalogUnionCopyWithImpl<$Res>
    implements $ViewerCatalogUnionCopyWith<$Res> {
  _$ViewerCatalogUnionCopyWithImpl(this._value, this._then);

  final ViewerCatalogUnion _value;
  // ignore: unused_field
  final $Res Function(ViewerCatalogUnion) _then;
}

/// @nodoc
abstract class $ViewerPrimaryComponentCatalogCopyWith<$Res> {
  factory $ViewerPrimaryComponentCatalogCopyWith(
          ViewerPrimaryComponentCatalog value,
          $Res Function(ViewerPrimaryComponentCatalog) then) =
      _$ViewerPrimaryComponentCatalogCopyWithImpl<$Res>;
  $Res call(
      {String id,
      List<ViewerCatalogFeature> features,
      List<ViewerCatalogLink> links,
      WidgetBuilder builder,
      ViewerSourceCode sourceCode,
      List<ViewerExampleUnion> examples,
      List<ViewerSecondaryComponentCatalog> secondaryComponents});

  $ViewerSourceCodeCopyWith<$Res> get sourceCode;
}

/// @nodoc
class _$ViewerPrimaryComponentCatalogCopyWithImpl<$Res>
    extends _$ViewerCatalogUnionCopyWithImpl<$Res>
    implements $ViewerPrimaryComponentCatalogCopyWith<$Res> {
  _$ViewerPrimaryComponentCatalogCopyWithImpl(
      ViewerPrimaryComponentCatalog _value,
      $Res Function(ViewerPrimaryComponentCatalog) _then)
      : super(_value, (v) => _then(v as ViewerPrimaryComponentCatalog));

  @override
  ViewerPrimaryComponentCatalog get _value =>
      super._value as ViewerPrimaryComponentCatalog;

  @override
  $Res call({
    Object? id = freezed,
    Object? features = freezed,
    Object? links = freezed,
    Object? builder = freezed,
    Object? sourceCode = freezed,
    Object? examples = freezed,
    Object? secondaryComponents = freezed,
  }) {
    return _then(ViewerPrimaryComponentCatalog(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      features: features == freezed
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<ViewerCatalogFeature>,
      links: links == freezed
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<ViewerCatalogLink>,
      builder: builder == freezed
          ? _value.builder
          : builder // ignore: cast_nullable_to_non_nullable
              as WidgetBuilder,
      sourceCode: sourceCode == freezed
          ? _value.sourceCode
          : sourceCode // ignore: cast_nullable_to_non_nullable
              as ViewerSourceCode,
      examples: examples == freezed
          ? _value.examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<ViewerExampleUnion>,
      secondaryComponents: secondaryComponents == freezed
          ? _value.secondaryComponents
          : secondaryComponents // ignore: cast_nullable_to_non_nullable
              as List<ViewerSecondaryComponentCatalog>,
    ));
  }

  @override
  $ViewerSourceCodeCopyWith<$Res> get sourceCode {
    return $ViewerSourceCodeCopyWith<$Res>(_value.sourceCode, (value) {
      return _then(_value.copyWith(sourceCode: value));
    });
  }
}

/// @nodoc

class _$ViewerPrimaryComponentCatalog
    with DiagnosticableTreeMixin
    implements ViewerPrimaryComponentCatalog {
  const _$ViewerPrimaryComponentCatalog(
      {required this.id,
      this.features = const [],
      this.links = const [],
      required this.builder,
      required this.sourceCode,
      required this.examples,
      this.secondaryComponents = const []});

  @override
  final String id;
  @JsonKey()
  @override
  final List<ViewerCatalogFeature> features;
  @JsonKey()
  @override
  final List<ViewerCatalogLink> links;
  @override
  final WidgetBuilder builder;
  @override
  final ViewerSourceCode sourceCode;
  @override
  final List<ViewerExampleUnion> examples;
  @JsonKey()
  @override
  final List<ViewerSecondaryComponentCatalog> secondaryComponents;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerCatalogUnion.primaryComponent(id: $id, features: $features, links: $links, builder: $builder, sourceCode: $sourceCode, examples: $examples, secondaryComponents: $secondaryComponents)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerCatalogUnion.primaryComponent'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('features', features))
      ..add(DiagnosticsProperty('links', links))
      ..add(DiagnosticsProperty('builder', builder))
      ..add(DiagnosticsProperty('sourceCode', sourceCode))
      ..add(DiagnosticsProperty('examples', examples))
      ..add(DiagnosticsProperty('secondaryComponents', secondaryComponents));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewerPrimaryComponentCatalog &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.features, features) &&
            const DeepCollectionEquality().equals(other.links, links) &&
            (identical(other.builder, builder) || other.builder == builder) &&
            const DeepCollectionEquality()
                .equals(other.sourceCode, sourceCode) &&
            const DeepCollectionEquality().equals(other.examples, examples) &&
            const DeepCollectionEquality()
                .equals(other.secondaryComponents, secondaryComponents));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(features),
      const DeepCollectionEquality().hash(links),
      builder,
      const DeepCollectionEquality().hash(sourceCode),
      const DeepCollectionEquality().hash(examples),
      const DeepCollectionEquality().hash(secondaryComponents));

  @JsonKey(ignore: true)
  @override
  $ViewerPrimaryComponentCatalogCopyWith<ViewerPrimaryComponentCatalog>
      get copyWith => _$ViewerPrimaryComponentCatalogCopyWithImpl<
          ViewerPrimaryComponentCatalog>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            List<ViewerCatalogFeature> features,
            List<ViewerCatalogLink> links,
            WidgetBuilder builder,
            ViewerSourceCode sourceCode,
            List<ViewerExampleUnion> examples,
            List<ViewerSecondaryComponentCatalog> secondaryComponents)
        primaryComponent,
    required TResult Function(
            String name,
            String? description,
            WidgetBuilder builder,
            ViewerSourceCode sourceCode,
            List<ViewerExampleUnion> examples)
        secondaryComponent,
    required TResult Function(String id) prototype,
  }) {
    return primaryComponent(id, features, links, builder, sourceCode, examples,
        secondaryComponents);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String id,
            List<ViewerCatalogFeature> features,
            List<ViewerCatalogLink> links,
            WidgetBuilder builder,
            ViewerSourceCode sourceCode,
            List<ViewerExampleUnion> examples,
            List<ViewerSecondaryComponentCatalog> secondaryComponents)?
        primaryComponent,
    TResult Function(String name, String? description, WidgetBuilder builder,
            ViewerSourceCode sourceCode, List<ViewerExampleUnion> examples)?
        secondaryComponent,
    TResult Function(String id)? prototype,
  }) {
    return primaryComponent?.call(id, features, links, builder, sourceCode,
        examples, secondaryComponents);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            List<ViewerCatalogFeature> features,
            List<ViewerCatalogLink> links,
            WidgetBuilder builder,
            ViewerSourceCode sourceCode,
            List<ViewerExampleUnion> examples,
            List<ViewerSecondaryComponentCatalog> secondaryComponents)?
        primaryComponent,
    TResult Function(String name, String? description, WidgetBuilder builder,
            ViewerSourceCode sourceCode, List<ViewerExampleUnion> examples)?
        secondaryComponent,
    TResult Function(String id)? prototype,
    required TResult orElse(),
  }) {
    if (primaryComponent != null) {
      return primaryComponent(id, features, links, builder, sourceCode,
          examples, secondaryComponents);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerPrimaryComponentCatalog value)
        primaryComponent,
    required TResult Function(ViewerSecondaryComponentCatalog value)
        secondaryComponent,
    required TResult Function(ViewerPrototypeCatalog value) prototype,
  }) {
    return primaryComponent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerPrimaryComponentCatalog value)? primaryComponent,
    TResult Function(ViewerSecondaryComponentCatalog value)? secondaryComponent,
    TResult Function(ViewerPrototypeCatalog value)? prototype,
  }) {
    return primaryComponent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerPrimaryComponentCatalog value)? primaryComponent,
    TResult Function(ViewerSecondaryComponentCatalog value)? secondaryComponent,
    TResult Function(ViewerPrototypeCatalog value)? prototype,
    required TResult orElse(),
  }) {
    if (primaryComponent != null) {
      return primaryComponent(this);
    }
    return orElse();
  }
}

abstract class ViewerPrimaryComponentCatalog implements ViewerCatalogUnion {
  const factory ViewerPrimaryComponentCatalog(
          {required String id,
          List<ViewerCatalogFeature> features,
          List<ViewerCatalogLink> links,
          required WidgetBuilder builder,
          required ViewerSourceCode sourceCode,
          required List<ViewerExampleUnion> examples,
          List<ViewerSecondaryComponentCatalog> secondaryComponents}) =
      _$ViewerPrimaryComponentCatalog;

  String get id;
  List<ViewerCatalogFeature> get features;
  List<ViewerCatalogLink> get links;
  WidgetBuilder get builder;
  ViewerSourceCode get sourceCode;
  List<ViewerExampleUnion> get examples;
  List<ViewerSecondaryComponentCatalog> get secondaryComponents;
  @JsonKey(ignore: true)
  $ViewerPrimaryComponentCatalogCopyWith<ViewerPrimaryComponentCatalog>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerSecondaryComponentCatalogCopyWith<$Res> {
  factory $ViewerSecondaryComponentCatalogCopyWith(
          ViewerSecondaryComponentCatalog value,
          $Res Function(ViewerSecondaryComponentCatalog) then) =
      _$ViewerSecondaryComponentCatalogCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String? description,
      WidgetBuilder builder,
      ViewerSourceCode sourceCode,
      List<ViewerExampleUnion> examples});

  $ViewerSourceCodeCopyWith<$Res> get sourceCode;
}

/// @nodoc
class _$ViewerSecondaryComponentCatalogCopyWithImpl<$Res>
    extends _$ViewerCatalogUnionCopyWithImpl<$Res>
    implements $ViewerSecondaryComponentCatalogCopyWith<$Res> {
  _$ViewerSecondaryComponentCatalogCopyWithImpl(
      ViewerSecondaryComponentCatalog _value,
      $Res Function(ViewerSecondaryComponentCatalog) _then)
      : super(_value, (v) => _then(v as ViewerSecondaryComponentCatalog));

  @override
  ViewerSecondaryComponentCatalog get _value =>
      super._value as ViewerSecondaryComponentCatalog;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? builder = freezed,
    Object? sourceCode = freezed,
    Object? examples = freezed,
  }) {
    return _then(ViewerSecondaryComponentCatalog(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      builder: builder == freezed
          ? _value.builder
          : builder // ignore: cast_nullable_to_non_nullable
              as WidgetBuilder,
      sourceCode: sourceCode == freezed
          ? _value.sourceCode
          : sourceCode // ignore: cast_nullable_to_non_nullable
              as ViewerSourceCode,
      examples: examples == freezed
          ? _value.examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<ViewerExampleUnion>,
    ));
  }

  @override
  $ViewerSourceCodeCopyWith<$Res> get sourceCode {
    return $ViewerSourceCodeCopyWith<$Res>(_value.sourceCode, (value) {
      return _then(_value.copyWith(sourceCode: value));
    });
  }
}

/// @nodoc

class _$ViewerSecondaryComponentCatalog
    with DiagnosticableTreeMixin
    implements ViewerSecondaryComponentCatalog {
  const _$ViewerSecondaryComponentCatalog(
      {required this.name,
      this.description,
      required this.builder,
      required this.sourceCode,
      required this.examples});

  @override
  final String name;
  @override
  final String? description;
  @override
  final WidgetBuilder builder;
  @override
  final ViewerSourceCode sourceCode;
  @override
  final List<ViewerExampleUnion> examples;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerCatalogUnion.secondaryComponent(name: $name, description: $description, builder: $builder, sourceCode: $sourceCode, examples: $examples)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'ViewerCatalogUnion.secondaryComponent'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('builder', builder))
      ..add(DiagnosticsProperty('sourceCode', sourceCode))
      ..add(DiagnosticsProperty('examples', examples));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewerSecondaryComponentCatalog &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            (identical(other.builder, builder) || other.builder == builder) &&
            const DeepCollectionEquality()
                .equals(other.sourceCode, sourceCode) &&
            const DeepCollectionEquality().equals(other.examples, examples));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      builder,
      const DeepCollectionEquality().hash(sourceCode),
      const DeepCollectionEquality().hash(examples));

  @JsonKey(ignore: true)
  @override
  $ViewerSecondaryComponentCatalogCopyWith<ViewerSecondaryComponentCatalog>
      get copyWith => _$ViewerSecondaryComponentCatalogCopyWithImpl<
          ViewerSecondaryComponentCatalog>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            List<ViewerCatalogFeature> features,
            List<ViewerCatalogLink> links,
            WidgetBuilder builder,
            ViewerSourceCode sourceCode,
            List<ViewerExampleUnion> examples,
            List<ViewerSecondaryComponentCatalog> secondaryComponents)
        primaryComponent,
    required TResult Function(
            String name,
            String? description,
            WidgetBuilder builder,
            ViewerSourceCode sourceCode,
            List<ViewerExampleUnion> examples)
        secondaryComponent,
    required TResult Function(String id) prototype,
  }) {
    return secondaryComponent(name, description, builder, sourceCode, examples);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String id,
            List<ViewerCatalogFeature> features,
            List<ViewerCatalogLink> links,
            WidgetBuilder builder,
            ViewerSourceCode sourceCode,
            List<ViewerExampleUnion> examples,
            List<ViewerSecondaryComponentCatalog> secondaryComponents)?
        primaryComponent,
    TResult Function(String name, String? description, WidgetBuilder builder,
            ViewerSourceCode sourceCode, List<ViewerExampleUnion> examples)?
        secondaryComponent,
    TResult Function(String id)? prototype,
  }) {
    return secondaryComponent?.call(
        name, description, builder, sourceCode, examples);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            List<ViewerCatalogFeature> features,
            List<ViewerCatalogLink> links,
            WidgetBuilder builder,
            ViewerSourceCode sourceCode,
            List<ViewerExampleUnion> examples,
            List<ViewerSecondaryComponentCatalog> secondaryComponents)?
        primaryComponent,
    TResult Function(String name, String? description, WidgetBuilder builder,
            ViewerSourceCode sourceCode, List<ViewerExampleUnion> examples)?
        secondaryComponent,
    TResult Function(String id)? prototype,
    required TResult orElse(),
  }) {
    if (secondaryComponent != null) {
      return secondaryComponent(
          name, description, builder, sourceCode, examples);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerPrimaryComponentCatalog value)
        primaryComponent,
    required TResult Function(ViewerSecondaryComponentCatalog value)
        secondaryComponent,
    required TResult Function(ViewerPrototypeCatalog value) prototype,
  }) {
    return secondaryComponent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerPrimaryComponentCatalog value)? primaryComponent,
    TResult Function(ViewerSecondaryComponentCatalog value)? secondaryComponent,
    TResult Function(ViewerPrototypeCatalog value)? prototype,
  }) {
    return secondaryComponent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerPrimaryComponentCatalog value)? primaryComponent,
    TResult Function(ViewerSecondaryComponentCatalog value)? secondaryComponent,
    TResult Function(ViewerPrototypeCatalog value)? prototype,
    required TResult orElse(),
  }) {
    if (secondaryComponent != null) {
      return secondaryComponent(this);
    }
    return orElse();
  }
}

abstract class ViewerSecondaryComponentCatalog implements ViewerCatalogUnion {
  const factory ViewerSecondaryComponentCatalog(
          {required String name,
          String? description,
          required WidgetBuilder builder,
          required ViewerSourceCode sourceCode,
          required List<ViewerExampleUnion> examples}) =
      _$ViewerSecondaryComponentCatalog;

  String get name;
  String? get description;
  WidgetBuilder get builder;
  ViewerSourceCode get sourceCode;
  List<ViewerExampleUnion> get examples;
  @JsonKey(ignore: true)
  $ViewerSecondaryComponentCatalogCopyWith<ViewerSecondaryComponentCatalog>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerPrototypeCatalogCopyWith<$Res> {
  factory $ViewerPrototypeCatalogCopyWith(ViewerPrototypeCatalog value,
          $Res Function(ViewerPrototypeCatalog) then) =
      _$ViewerPrototypeCatalogCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$ViewerPrototypeCatalogCopyWithImpl<$Res>
    extends _$ViewerCatalogUnionCopyWithImpl<$Res>
    implements $ViewerPrototypeCatalogCopyWith<$Res> {
  _$ViewerPrototypeCatalogCopyWithImpl(ViewerPrototypeCatalog _value,
      $Res Function(ViewerPrototypeCatalog) _then)
      : super(_value, (v) => _then(v as ViewerPrototypeCatalog));

  @override
  ViewerPrototypeCatalog get _value => super._value as ViewerPrototypeCatalog;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(ViewerPrototypeCatalog(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ViewerPrototypeCatalog
    with DiagnosticableTreeMixin
    implements ViewerPrototypeCatalog {
  const _$ViewerPrototypeCatalog({required this.id});

  @override
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerCatalogUnion.prototype(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerCatalogUnion.prototype'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewerPrototypeCatalog &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  $ViewerPrototypeCatalogCopyWith<ViewerPrototypeCatalog> get copyWith =>
      _$ViewerPrototypeCatalogCopyWithImpl<ViewerPrototypeCatalog>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            List<ViewerCatalogFeature> features,
            List<ViewerCatalogLink> links,
            WidgetBuilder builder,
            ViewerSourceCode sourceCode,
            List<ViewerExampleUnion> examples,
            List<ViewerSecondaryComponentCatalog> secondaryComponents)
        primaryComponent,
    required TResult Function(
            String name,
            String? description,
            WidgetBuilder builder,
            ViewerSourceCode sourceCode,
            List<ViewerExampleUnion> examples)
        secondaryComponent,
    required TResult Function(String id) prototype,
  }) {
    return prototype(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String id,
            List<ViewerCatalogFeature> features,
            List<ViewerCatalogLink> links,
            WidgetBuilder builder,
            ViewerSourceCode sourceCode,
            List<ViewerExampleUnion> examples,
            List<ViewerSecondaryComponentCatalog> secondaryComponents)?
        primaryComponent,
    TResult Function(String name, String? description, WidgetBuilder builder,
            ViewerSourceCode sourceCode, List<ViewerExampleUnion> examples)?
        secondaryComponent,
    TResult Function(String id)? prototype,
  }) {
    return prototype?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            List<ViewerCatalogFeature> features,
            List<ViewerCatalogLink> links,
            WidgetBuilder builder,
            ViewerSourceCode sourceCode,
            List<ViewerExampleUnion> examples,
            List<ViewerSecondaryComponentCatalog> secondaryComponents)?
        primaryComponent,
    TResult Function(String name, String? description, WidgetBuilder builder,
            ViewerSourceCode sourceCode, List<ViewerExampleUnion> examples)?
        secondaryComponent,
    TResult Function(String id)? prototype,
    required TResult orElse(),
  }) {
    if (prototype != null) {
      return prototype(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerPrimaryComponentCatalog value)
        primaryComponent,
    required TResult Function(ViewerSecondaryComponentCatalog value)
        secondaryComponent,
    required TResult Function(ViewerPrototypeCatalog value) prototype,
  }) {
    return prototype(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerPrimaryComponentCatalog value)? primaryComponent,
    TResult Function(ViewerSecondaryComponentCatalog value)? secondaryComponent,
    TResult Function(ViewerPrototypeCatalog value)? prototype,
  }) {
    return prototype?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerPrimaryComponentCatalog value)? primaryComponent,
    TResult Function(ViewerSecondaryComponentCatalog value)? secondaryComponent,
    TResult Function(ViewerPrototypeCatalog value)? prototype,
    required TResult orElse(),
  }) {
    if (prototype != null) {
      return prototype(this);
    }
    return orElse();
  }
}

abstract class ViewerPrototypeCatalog implements ViewerCatalogUnion {
  const factory ViewerPrototypeCatalog({required String id}) =
      _$ViewerPrototypeCatalog;

  String get id;
  @JsonKey(ignore: true)
  $ViewerPrototypeCatalogCopyWith<ViewerPrototypeCatalog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ViewerCatalogFeatureTearOff {
  const _$ViewerCatalogFeatureTearOff();

  _ViewerCatalogFeature call({required bool capable, required String title}) {
    return _ViewerCatalogFeature(
      capable: capable,
      title: title,
    );
  }
}

/// @nodoc
const $ViewerCatalogFeature = _$ViewerCatalogFeatureTearOff();

/// @nodoc
mixin _$ViewerCatalogFeature {
  bool get capable => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewerCatalogFeatureCopyWith<ViewerCatalogFeature> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerCatalogFeatureCopyWith<$Res> {
  factory $ViewerCatalogFeatureCopyWith(ViewerCatalogFeature value,
          $Res Function(ViewerCatalogFeature) then) =
      _$ViewerCatalogFeatureCopyWithImpl<$Res>;
  $Res call({bool capable, String title});
}

/// @nodoc
class _$ViewerCatalogFeatureCopyWithImpl<$Res>
    implements $ViewerCatalogFeatureCopyWith<$Res> {
  _$ViewerCatalogFeatureCopyWithImpl(this._value, this._then);

  final ViewerCatalogFeature _value;
  // ignore: unused_field
  final $Res Function(ViewerCatalogFeature) _then;

  @override
  $Res call({
    Object? capable = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      capable: capable == freezed
          ? _value.capable
          : capable // ignore: cast_nullable_to_non_nullable
              as bool,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ViewerCatalogFeatureCopyWith<$Res>
    implements $ViewerCatalogFeatureCopyWith<$Res> {
  factory _$ViewerCatalogFeatureCopyWith(_ViewerCatalogFeature value,
          $Res Function(_ViewerCatalogFeature) then) =
      __$ViewerCatalogFeatureCopyWithImpl<$Res>;
  @override
  $Res call({bool capable, String title});
}

/// @nodoc
class __$ViewerCatalogFeatureCopyWithImpl<$Res>
    extends _$ViewerCatalogFeatureCopyWithImpl<$Res>
    implements _$ViewerCatalogFeatureCopyWith<$Res> {
  __$ViewerCatalogFeatureCopyWithImpl(
      _ViewerCatalogFeature _value, $Res Function(_ViewerCatalogFeature) _then)
      : super(_value, (v) => _then(v as _ViewerCatalogFeature));

  @override
  _ViewerCatalogFeature get _value => super._value as _ViewerCatalogFeature;

  @override
  $Res call({
    Object? capable = freezed,
    Object? title = freezed,
  }) {
    return _then(_ViewerCatalogFeature(
      capable: capable == freezed
          ? _value.capable
          : capable // ignore: cast_nullable_to_non_nullable
              as bool,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ViewerCatalogFeature
    with DiagnosticableTreeMixin
    implements _ViewerCatalogFeature {
  const _$_ViewerCatalogFeature({required this.capable, required this.title});

  @override
  final bool capable;
  @override
  final String title;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerCatalogFeature(capable: $capable, title: $title)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerCatalogFeature'))
      ..add(DiagnosticsProperty('capable', capable))
      ..add(DiagnosticsProperty('title', title));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ViewerCatalogFeature &&
            const DeepCollectionEquality().equals(other.capable, capable) &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(capable),
      const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  _$ViewerCatalogFeatureCopyWith<_ViewerCatalogFeature> get copyWith =>
      __$ViewerCatalogFeatureCopyWithImpl<_ViewerCatalogFeature>(
          this, _$identity);
}

abstract class _ViewerCatalogFeature implements ViewerCatalogFeature {
  const factory _ViewerCatalogFeature(
      {required bool capable, required String title}) = _$_ViewerCatalogFeature;

  @override
  bool get capable;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$ViewerCatalogFeatureCopyWith<_ViewerCatalogFeature> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ViewerCatalogLinkTearOff {
  const _$ViewerCatalogLinkTearOff();

  _ViewerCatalogLink call({required String title, required String url}) {
    return _ViewerCatalogLink(
      title: title,
      url: url,
    );
  }
}

/// @nodoc
const $ViewerCatalogLink = _$ViewerCatalogLinkTearOff();

/// @nodoc
mixin _$ViewerCatalogLink {
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewerCatalogLinkCopyWith<ViewerCatalogLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerCatalogLinkCopyWith<$Res> {
  factory $ViewerCatalogLinkCopyWith(
          ViewerCatalogLink value, $Res Function(ViewerCatalogLink) then) =
      _$ViewerCatalogLinkCopyWithImpl<$Res>;
  $Res call({String title, String url});
}

/// @nodoc
class _$ViewerCatalogLinkCopyWithImpl<$Res>
    implements $ViewerCatalogLinkCopyWith<$Res> {
  _$ViewerCatalogLinkCopyWithImpl(this._value, this._then);

  final ViewerCatalogLink _value;
  // ignore: unused_field
  final $Res Function(ViewerCatalogLink) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ViewerCatalogLinkCopyWith<$Res>
    implements $ViewerCatalogLinkCopyWith<$Res> {
  factory _$ViewerCatalogLinkCopyWith(
          _ViewerCatalogLink value, $Res Function(_ViewerCatalogLink) then) =
      __$ViewerCatalogLinkCopyWithImpl<$Res>;
  @override
  $Res call({String title, String url});
}

/// @nodoc
class __$ViewerCatalogLinkCopyWithImpl<$Res>
    extends _$ViewerCatalogLinkCopyWithImpl<$Res>
    implements _$ViewerCatalogLinkCopyWith<$Res> {
  __$ViewerCatalogLinkCopyWithImpl(
      _ViewerCatalogLink _value, $Res Function(_ViewerCatalogLink) _then)
      : super(_value, (v) => _then(v as _ViewerCatalogLink));

  @override
  _ViewerCatalogLink get _value => super._value as _ViewerCatalogLink;

  @override
  $Res call({
    Object? title = freezed,
    Object? url = freezed,
  }) {
    return _then(_ViewerCatalogLink(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ViewerCatalogLink
    with DiagnosticableTreeMixin
    implements _ViewerCatalogLink {
  const _$_ViewerCatalogLink({required this.title, required this.url});

  @override
  final String title;
  @override
  final String url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerCatalogLink(title: $title, url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerCatalogLink'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ViewerCatalogLink &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$ViewerCatalogLinkCopyWith<_ViewerCatalogLink> get copyWith =>
      __$ViewerCatalogLinkCopyWithImpl<_ViewerCatalogLink>(this, _$identity);
}

abstract class _ViewerCatalogLink implements ViewerCatalogLink {
  const factory _ViewerCatalogLink(
      {required String title, required String url}) = _$_ViewerCatalogLink;

  @override
  String get title;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$ViewerCatalogLinkCopyWith<_ViewerCatalogLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ViewerDataGeneratorFactoryTearOff {
  const _$ViewerDataGeneratorFactoryTearOff();

  _ViewerDataGeneratorFactory call(
      {required List<ViewerDataGenerator> dataGenerators}) {
    return _ViewerDataGeneratorFactory(
      dataGenerators: dataGenerators,
    );
  }
}

/// @nodoc
const $ViewerDataGeneratorFactory = _$ViewerDataGeneratorFactoryTearOff();

/// @nodoc
mixin _$ViewerDataGeneratorFactory {
  List<ViewerDataGenerator> get dataGenerators =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewerDataGeneratorFactoryCopyWith<ViewerDataGeneratorFactory>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerDataGeneratorFactoryCopyWith<$Res> {
  factory $ViewerDataGeneratorFactoryCopyWith(ViewerDataGeneratorFactory value,
          $Res Function(ViewerDataGeneratorFactory) then) =
      _$ViewerDataGeneratorFactoryCopyWithImpl<$Res>;
  $Res call({List<ViewerDataGenerator> dataGenerators});
}

/// @nodoc
class _$ViewerDataGeneratorFactoryCopyWithImpl<$Res>
    implements $ViewerDataGeneratorFactoryCopyWith<$Res> {
  _$ViewerDataGeneratorFactoryCopyWithImpl(this._value, this._then);

  final ViewerDataGeneratorFactory _value;
  // ignore: unused_field
  final $Res Function(ViewerDataGeneratorFactory) _then;

  @override
  $Res call({
    Object? dataGenerators = freezed,
  }) {
    return _then(_value.copyWith(
      dataGenerators: dataGenerators == freezed
          ? _value.dataGenerators
          : dataGenerators // ignore: cast_nullable_to_non_nullable
              as List<ViewerDataGenerator>,
    ));
  }
}

/// @nodoc
abstract class _$ViewerDataGeneratorFactoryCopyWith<$Res>
    implements $ViewerDataGeneratorFactoryCopyWith<$Res> {
  factory _$ViewerDataGeneratorFactoryCopyWith(
          _ViewerDataGeneratorFactory value,
          $Res Function(_ViewerDataGeneratorFactory) then) =
      __$ViewerDataGeneratorFactoryCopyWithImpl<$Res>;
  @override
  $Res call({List<ViewerDataGenerator> dataGenerators});
}

/// @nodoc
class __$ViewerDataGeneratorFactoryCopyWithImpl<$Res>
    extends _$ViewerDataGeneratorFactoryCopyWithImpl<$Res>
    implements _$ViewerDataGeneratorFactoryCopyWith<$Res> {
  __$ViewerDataGeneratorFactoryCopyWithImpl(_ViewerDataGeneratorFactory _value,
      $Res Function(_ViewerDataGeneratorFactory) _then)
      : super(_value, (v) => _then(v as _ViewerDataGeneratorFactory));

  @override
  _ViewerDataGeneratorFactory get _value =>
      super._value as _ViewerDataGeneratorFactory;

  @override
  $Res call({
    Object? dataGenerators = freezed,
  }) {
    return _then(_ViewerDataGeneratorFactory(
      dataGenerators: dataGenerators == freezed
          ? _value.dataGenerators
          : dataGenerators // ignore: cast_nullable_to_non_nullable
              as List<ViewerDataGenerator>,
    ));
  }
}

/// @nodoc

class _$_ViewerDataGeneratorFactory extends _ViewerDataGeneratorFactory
    with DiagnosticableTreeMixin {
  const _$_ViewerDataGeneratorFactory({required this.dataGenerators})
      : super._();

  @override
  final List<ViewerDataGenerator> dataGenerators;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerDataGeneratorFactory(dataGenerators: $dataGenerators)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerDataGeneratorFactory'))
      ..add(DiagnosticsProperty('dataGenerators', dataGenerators));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ViewerDataGeneratorFactory &&
            const DeepCollectionEquality()
                .equals(other.dataGenerators, dataGenerators));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(dataGenerators));

  @JsonKey(ignore: true)
  @override
  _$ViewerDataGeneratorFactoryCopyWith<_ViewerDataGeneratorFactory>
      get copyWith => __$ViewerDataGeneratorFactoryCopyWithImpl<
          _ViewerDataGeneratorFactory>(this, _$identity);
}

abstract class _ViewerDataGeneratorFactory extends ViewerDataGeneratorFactory {
  const factory _ViewerDataGeneratorFactory(
          {required List<ViewerDataGenerator> dataGenerators}) =
      _$_ViewerDataGeneratorFactory;
  const _ViewerDataGeneratorFactory._() : super._();

  @override
  List<ViewerDataGenerator> get dataGenerators;
  @override
  @JsonKey(ignore: true)
  _$ViewerDataGeneratorFactoryCopyWith<_ViewerDataGeneratorFactory>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$ViewerExampleUnionTearOff {
  const _$ViewerExampleUnionTearOff();

  ViewerStaticExample<T> static<T>(
      {required String name,
      String? description,
      required WidgetBuilder builder,
      required ViewerSourceCode sourceCode}) {
    return ViewerStaticExample<T>(
      name: name,
      description: description,
      builder: builder,
      sourceCode: sourceCode,
    );
  }

  ViewerDynamicExample<T> dynamic<T>(
      {required String name,
      String? description,
      required DynamicWidgetBuilder<T> builder,
      required ViewerSourceCode sourceCode}) {
    return ViewerDynamicExample<T>(
      name: name,
      description: description,
      builder: builder,
      sourceCode: sourceCode,
    );
  }
}

/// @nodoc
const $ViewerExampleUnion = _$ViewerExampleUnionTearOff();

/// @nodoc
mixin _$ViewerExampleUnion<T> {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  ViewerSourceCode get sourceCode => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String? description,
            WidgetBuilder builder, ViewerSourceCode sourceCode)
        static,
    required TResult Function(String name, String? description,
            DynamicWidgetBuilder<T> builder, ViewerSourceCode sourceCode)
        dynamic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, String? description, WidgetBuilder builder,
            ViewerSourceCode sourceCode)?
        static,
    TResult Function(String name, String? description,
            DynamicWidgetBuilder<T> builder, ViewerSourceCode sourceCode)?
        dynamic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String? description, WidgetBuilder builder,
            ViewerSourceCode sourceCode)?
        static,
    TResult Function(String name, String? description,
            DynamicWidgetBuilder<T> builder, ViewerSourceCode sourceCode)?
        dynamic,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerStaticExample<T> value) static,
    required TResult Function(ViewerDynamicExample<T> value) dynamic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerStaticExample<T> value)? static,
    TResult Function(ViewerDynamicExample<T> value)? dynamic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerStaticExample<T> value)? static,
    TResult Function(ViewerDynamicExample<T> value)? dynamic,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewerExampleUnionCopyWith<T, ViewerExampleUnion<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerExampleUnionCopyWith<T, $Res> {
  factory $ViewerExampleUnionCopyWith(ViewerExampleUnion<T> value,
          $Res Function(ViewerExampleUnion<T>) then) =
      _$ViewerExampleUnionCopyWithImpl<T, $Res>;
  $Res call({String name, String? description, ViewerSourceCode sourceCode});

  $ViewerSourceCodeCopyWith<$Res> get sourceCode;
}

/// @nodoc
class _$ViewerExampleUnionCopyWithImpl<T, $Res>
    implements $ViewerExampleUnionCopyWith<T, $Res> {
  _$ViewerExampleUnionCopyWithImpl(this._value, this._then);

  final ViewerExampleUnion<T> _value;
  // ignore: unused_field
  final $Res Function(ViewerExampleUnion<T>) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? sourceCode = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceCode: sourceCode == freezed
          ? _value.sourceCode
          : sourceCode // ignore: cast_nullable_to_non_nullable
              as ViewerSourceCode,
    ));
  }

  @override
  $ViewerSourceCodeCopyWith<$Res> get sourceCode {
    return $ViewerSourceCodeCopyWith<$Res>(_value.sourceCode, (value) {
      return _then(_value.copyWith(sourceCode: value));
    });
  }
}

/// @nodoc
abstract class $ViewerStaticExampleCopyWith<T, $Res>
    implements $ViewerExampleUnionCopyWith<T, $Res> {
  factory $ViewerStaticExampleCopyWith(ViewerStaticExample<T> value,
          $Res Function(ViewerStaticExample<T>) then) =
      _$ViewerStaticExampleCopyWithImpl<T, $Res>;
  @override
  $Res call(
      {String name,
      String? description,
      WidgetBuilder builder,
      ViewerSourceCode sourceCode});

  @override
  $ViewerSourceCodeCopyWith<$Res> get sourceCode;
}

/// @nodoc
class _$ViewerStaticExampleCopyWithImpl<T, $Res>
    extends _$ViewerExampleUnionCopyWithImpl<T, $Res>
    implements $ViewerStaticExampleCopyWith<T, $Res> {
  _$ViewerStaticExampleCopyWithImpl(ViewerStaticExample<T> _value,
      $Res Function(ViewerStaticExample<T>) _then)
      : super(_value, (v) => _then(v as ViewerStaticExample<T>));

  @override
  ViewerStaticExample<T> get _value => super._value as ViewerStaticExample<T>;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? builder = freezed,
    Object? sourceCode = freezed,
  }) {
    return _then(ViewerStaticExample<T>(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      builder: builder == freezed
          ? _value.builder
          : builder // ignore: cast_nullable_to_non_nullable
              as WidgetBuilder,
      sourceCode: sourceCode == freezed
          ? _value.sourceCode
          : sourceCode // ignore: cast_nullable_to_non_nullable
              as ViewerSourceCode,
    ));
  }
}

/// @nodoc

class _$ViewerStaticExample<T> extends ViewerStaticExample<T>
    with DiagnosticableTreeMixin {
  const _$ViewerStaticExample(
      {required this.name,
      this.description,
      required this.builder,
      required this.sourceCode})
      : super._();

  @override
  final String name;
  @override
  final String? description;
  @override
  final WidgetBuilder builder;
  @override
  final ViewerSourceCode sourceCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerExampleUnion<$T>.static(name: $name, description: $description, builder: $builder, sourceCode: $sourceCode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerExampleUnion<$T>.static'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('builder', builder))
      ..add(DiagnosticsProperty('sourceCode', sourceCode));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewerStaticExample<T> &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            (identical(other.builder, builder) || other.builder == builder) &&
            const DeepCollectionEquality()
                .equals(other.sourceCode, sourceCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      builder,
      const DeepCollectionEquality().hash(sourceCode));

  @JsonKey(ignore: true)
  @override
  $ViewerStaticExampleCopyWith<T, ViewerStaticExample<T>> get copyWith =>
      _$ViewerStaticExampleCopyWithImpl<T, ViewerStaticExample<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String? description,
            WidgetBuilder builder, ViewerSourceCode sourceCode)
        static,
    required TResult Function(String name, String? description,
            DynamicWidgetBuilder<T> builder, ViewerSourceCode sourceCode)
        dynamic,
  }) {
    return static(name, description, builder, sourceCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, String? description, WidgetBuilder builder,
            ViewerSourceCode sourceCode)?
        static,
    TResult Function(String name, String? description,
            DynamicWidgetBuilder<T> builder, ViewerSourceCode sourceCode)?
        dynamic,
  }) {
    return static?.call(name, description, builder, sourceCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String? description, WidgetBuilder builder,
            ViewerSourceCode sourceCode)?
        static,
    TResult Function(String name, String? description,
            DynamicWidgetBuilder<T> builder, ViewerSourceCode sourceCode)?
        dynamic,
    required TResult orElse(),
  }) {
    if (static != null) {
      return static(name, description, builder, sourceCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerStaticExample<T> value) static,
    required TResult Function(ViewerDynamicExample<T> value) dynamic,
  }) {
    return static(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerStaticExample<T> value)? static,
    TResult Function(ViewerDynamicExample<T> value)? dynamic,
  }) {
    return static?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerStaticExample<T> value)? static,
    TResult Function(ViewerDynamicExample<T> value)? dynamic,
    required TResult orElse(),
  }) {
    if (static != null) {
      return static(this);
    }
    return orElse();
  }
}

abstract class ViewerStaticExample<T> extends ViewerExampleUnion<T> {
  const factory ViewerStaticExample(
      {required String name,
      String? description,
      required WidgetBuilder builder,
      required ViewerSourceCode sourceCode}) = _$ViewerStaticExample<T>;
  const ViewerStaticExample._() : super._();

  @override
  String get name;
  @override
  String? get description;
  WidgetBuilder get builder;
  @override
  ViewerSourceCode get sourceCode;
  @override
  @JsonKey(ignore: true)
  $ViewerStaticExampleCopyWith<T, ViewerStaticExample<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerDynamicExampleCopyWith<T, $Res>
    implements $ViewerExampleUnionCopyWith<T, $Res> {
  factory $ViewerDynamicExampleCopyWith(ViewerDynamicExample<T> value,
          $Res Function(ViewerDynamicExample<T>) then) =
      _$ViewerDynamicExampleCopyWithImpl<T, $Res>;
  @override
  $Res call(
      {String name,
      String? description,
      DynamicWidgetBuilder<T> builder,
      ViewerSourceCode sourceCode});

  @override
  $ViewerSourceCodeCopyWith<$Res> get sourceCode;
}

/// @nodoc
class _$ViewerDynamicExampleCopyWithImpl<T, $Res>
    extends _$ViewerExampleUnionCopyWithImpl<T, $Res>
    implements $ViewerDynamicExampleCopyWith<T, $Res> {
  _$ViewerDynamicExampleCopyWithImpl(ViewerDynamicExample<T> _value,
      $Res Function(ViewerDynamicExample<T>) _then)
      : super(_value, (v) => _then(v as ViewerDynamicExample<T>));

  @override
  ViewerDynamicExample<T> get _value => super._value as ViewerDynamicExample<T>;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? builder = freezed,
    Object? sourceCode = freezed,
  }) {
    return _then(ViewerDynamicExample<T>(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      builder: builder == freezed
          ? _value.builder
          : builder // ignore: cast_nullable_to_non_nullable
              as DynamicWidgetBuilder<T>,
      sourceCode: sourceCode == freezed
          ? _value.sourceCode
          : sourceCode // ignore: cast_nullable_to_non_nullable
              as ViewerSourceCode,
    ));
  }
}

/// @nodoc

class _$ViewerDynamicExample<T> extends ViewerDynamicExample<T>
    with DiagnosticableTreeMixin {
  const _$ViewerDynamicExample(
      {required this.name,
      this.description,
      required this.builder,
      required this.sourceCode})
      : super._();

  @override
  final String name;
  @override
  final String? description;
  @override
  final DynamicWidgetBuilder<T> builder;
  @override
  final ViewerSourceCode sourceCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerExampleUnion<$T>.dynamic(name: $name, description: $description, builder: $builder, sourceCode: $sourceCode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerExampleUnion<$T>.dynamic'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('builder', builder))
      ..add(DiagnosticsProperty('sourceCode', sourceCode));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewerDynamicExample<T> &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            (identical(other.builder, builder) || other.builder == builder) &&
            const DeepCollectionEquality()
                .equals(other.sourceCode, sourceCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      builder,
      const DeepCollectionEquality().hash(sourceCode));

  @JsonKey(ignore: true)
  @override
  $ViewerDynamicExampleCopyWith<T, ViewerDynamicExample<T>> get copyWith =>
      _$ViewerDynamicExampleCopyWithImpl<T, ViewerDynamicExample<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String? description,
            WidgetBuilder builder, ViewerSourceCode sourceCode)
        static,
    required TResult Function(String name, String? description,
            DynamicWidgetBuilder<T> builder, ViewerSourceCode sourceCode)
        dynamic,
  }) {
    return dynamic(name, description, builder, sourceCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, String? description, WidgetBuilder builder,
            ViewerSourceCode sourceCode)?
        static,
    TResult Function(String name, String? description,
            DynamicWidgetBuilder<T> builder, ViewerSourceCode sourceCode)?
        dynamic,
  }) {
    return dynamic?.call(name, description, builder, sourceCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String? description, WidgetBuilder builder,
            ViewerSourceCode sourceCode)?
        static,
    TResult Function(String name, String? description,
            DynamicWidgetBuilder<T> builder, ViewerSourceCode sourceCode)?
        dynamic,
    required TResult orElse(),
  }) {
    if (dynamic != null) {
      return dynamic(name, description, builder, sourceCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerStaticExample<T> value) static,
    required TResult Function(ViewerDynamicExample<T> value) dynamic,
  }) {
    return dynamic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerStaticExample<T> value)? static,
    TResult Function(ViewerDynamicExample<T> value)? dynamic,
  }) {
    return dynamic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerStaticExample<T> value)? static,
    TResult Function(ViewerDynamicExample<T> value)? dynamic,
    required TResult orElse(),
  }) {
    if (dynamic != null) {
      return dynamic(this);
    }
    return orElse();
  }
}

abstract class ViewerDynamicExample<T> extends ViewerExampleUnion<T> {
  const factory ViewerDynamicExample(
      {required String name,
      String? description,
      required DynamicWidgetBuilder<T> builder,
      required ViewerSourceCode sourceCode}) = _$ViewerDynamicExample<T>;
  const ViewerDynamicExample._() : super._();

  @override
  String get name;
  @override
  String? get description;
  DynamicWidgetBuilder<T> get builder;
  @override
  ViewerSourceCode get sourceCode;
  @override
  @JsonKey(ignore: true)
  $ViewerDynamicExampleCopyWith<T, ViewerDynamicExample<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ViewerDataTemplateGeneratorUnionTearOff {
  const _$ViewerDataTemplateGeneratorUnionTearOff();

  ViewerLoremGenerator<T> lorem<T>(
      {required String dataKey,
      String label = 'Number of words',
      int length = 10,
      double min = 0,
      double max = 100}) {
    return ViewerLoremGenerator<T>(
      dataKey: dataKey,
      label: label,
      length: length,
      min: min,
      max: max,
    );
  }
}

/// @nodoc
const $ViewerDataTemplateGeneratorUnion =
    _$ViewerDataTemplateGeneratorUnionTearOff();

/// @nodoc
mixin _$ViewerDataTemplateGeneratorUnion<T> {
  String get dataKey => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  int get length => throw _privateConstructorUsedError;
  double get min => throw _privateConstructorUsedError;
  double get max => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String dataKey, String label, int length, double min, double max)
        lorem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String dataKey, String label, int length, double min, double max)?
        lorem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String dataKey, String label, int length, double min, double max)?
        lorem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerLoremGenerator<T> value) lorem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerLoremGenerator<T> value)? lorem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerLoremGenerator<T> value)? lorem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewerDataTemplateGeneratorUnionCopyWith<T,
          ViewerDataTemplateGeneratorUnion<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerDataTemplateGeneratorUnionCopyWith<T, $Res> {
  factory $ViewerDataTemplateGeneratorUnionCopyWith(
          ViewerDataTemplateGeneratorUnion<T> value,
          $Res Function(ViewerDataTemplateGeneratorUnion<T>) then) =
      _$ViewerDataTemplateGeneratorUnionCopyWithImpl<T, $Res>;
  $Res call({String dataKey, String label, int length, double min, double max});
}

/// @nodoc
class _$ViewerDataTemplateGeneratorUnionCopyWithImpl<T, $Res>
    implements $ViewerDataTemplateGeneratorUnionCopyWith<T, $Res> {
  _$ViewerDataTemplateGeneratorUnionCopyWithImpl(this._value, this._then);

  final ViewerDataTemplateGeneratorUnion<T> _value;
  // ignore: unused_field
  final $Res Function(ViewerDataTemplateGeneratorUnion<T>) _then;

  @override
  $Res call({
    Object? dataKey = freezed,
    Object? label = freezed,
    Object? length = freezed,
    Object? min = freezed,
    Object? max = freezed,
  }) {
    return _then(_value.copyWith(
      dataKey: dataKey == freezed
          ? _value.dataKey
          : dataKey // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      length: length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      min: min == freezed
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as double,
      max: max == freezed
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class $ViewerLoremGeneratorCopyWith<T, $Res>
    implements $ViewerDataTemplateGeneratorUnionCopyWith<T, $Res> {
  factory $ViewerLoremGeneratorCopyWith(ViewerLoremGenerator<T> value,
          $Res Function(ViewerLoremGenerator<T>) then) =
      _$ViewerLoremGeneratorCopyWithImpl<T, $Res>;
  @override
  $Res call({String dataKey, String label, int length, double min, double max});
}

/// @nodoc
class _$ViewerLoremGeneratorCopyWithImpl<T, $Res>
    extends _$ViewerDataTemplateGeneratorUnionCopyWithImpl<T, $Res>
    implements $ViewerLoremGeneratorCopyWith<T, $Res> {
  _$ViewerLoremGeneratorCopyWithImpl(ViewerLoremGenerator<T> _value,
      $Res Function(ViewerLoremGenerator<T>) _then)
      : super(_value, (v) => _then(v as ViewerLoremGenerator<T>));

  @override
  ViewerLoremGenerator<T> get _value => super._value as ViewerLoremGenerator<T>;

  @override
  $Res call({
    Object? dataKey = freezed,
    Object? label = freezed,
    Object? length = freezed,
    Object? min = freezed,
    Object? max = freezed,
  }) {
    return _then(ViewerLoremGenerator<T>(
      dataKey: dataKey == freezed
          ? _value.dataKey
          : dataKey // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      length: length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      min: min == freezed
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as double,
      max: max == freezed
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@Implements<ViewerDataGenerator>()
class _$ViewerLoremGenerator<T> extends ViewerLoremGenerator<T>
    with DiagnosticableTreeMixin {
  const _$ViewerLoremGenerator(
      {required this.dataKey,
      this.label = 'Number of words',
      this.length = 10,
      this.min = 0,
      this.max = 100})
      : super._();

  @override
  final String dataKey;
  @JsonKey()
  @override
  final String label;
  @JsonKey()
  @override
  final int length;
  @JsonKey()
  @override
  final double min;
  @JsonKey()
  @override
  final double max;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerDataTemplateGeneratorUnion<$T>.lorem(dataKey: $dataKey, label: $label, length: $length, min: $min, max: $max)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'ViewerDataTemplateGeneratorUnion<$T>.lorem'))
      ..add(DiagnosticsProperty('dataKey', dataKey))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('length', length))
      ..add(DiagnosticsProperty('min', min))
      ..add(DiagnosticsProperty('max', max));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewerLoremGenerator<T> &&
            const DeepCollectionEquality().equals(other.dataKey, dataKey) &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.length, length) &&
            const DeepCollectionEquality().equals(other.min, min) &&
            const DeepCollectionEquality().equals(other.max, max));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dataKey),
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(length),
      const DeepCollectionEquality().hash(min),
      const DeepCollectionEquality().hash(max));

  @JsonKey(ignore: true)
  @override
  $ViewerLoremGeneratorCopyWith<T, ViewerLoremGenerator<T>> get copyWith =>
      _$ViewerLoremGeneratorCopyWithImpl<T, ViewerLoremGenerator<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String dataKey, String label, int length, double min, double max)
        lorem,
  }) {
    return lorem(dataKey, label, length, min, max);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String dataKey, String label, int length, double min, double max)?
        lorem,
  }) {
    return lorem?.call(dataKey, label, length, min, max);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String dataKey, String label, int length, double min, double max)?
        lorem,
    required TResult orElse(),
  }) {
    if (lorem != null) {
      return lorem(dataKey, label, length, min, max);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerLoremGenerator<T> value) lorem,
  }) {
    return lorem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerLoremGenerator<T> value)? lorem,
  }) {
    return lorem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerLoremGenerator<T> value)? lorem,
    required TResult orElse(),
  }) {
    if (lorem != null) {
      return lorem(this);
    }
    return orElse();
  }
}

abstract class ViewerLoremGenerator<T>
    extends ViewerDataTemplateGeneratorUnion<T>
    implements ViewerDataGenerator<dynamic> {
  const factory ViewerLoremGenerator(
      {required String dataKey,
      String label,
      int length,
      double min,
      double max}) = _$ViewerLoremGenerator<T>;
  const ViewerLoremGenerator._() : super._();

  @override
  String get dataKey;
  @override
  String get label;
  @override
  int get length;
  @override
  double get min;
  @override
  double get max;
  @override
  @JsonKey(ignore: true)
  $ViewerLoremGeneratorCopyWith<T, ViewerLoremGenerator<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
