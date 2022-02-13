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

  ViewerDocumentPage document(
      {required String id,
      required List<String> namespace,
      required String title,
      String? subtitle,
      String? description,
      List<String> tags = const [],
      List<ViewerSectionUnion> sections = const []}) {
    return ViewerDocumentPage(
      id: id,
      namespace: namespace,
      title: title,
      subtitle: subtitle,
      description: description,
      tags: tags,
      sections: sections,
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
    required TResult Function(
            String id,
            List<String> namespace,
            String title,
            String? subtitle,
            String? description,
            List<String> tags,
            List<ViewerSectionUnion> sections)
        document,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id, List<String> namespace, String title,
            String? description, List<ViewerPageUnion> children)?
        group,
    TResult Function(
            String id,
            List<String> namespace,
            String title,
            String? subtitle,
            String? description,
            List<String> tags,
            List<ViewerSectionUnion> sections)?
        document,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, List<String> namespace, String title,
            String? description, List<ViewerPageUnion> children)?
        group,
    TResult Function(
            String id,
            List<String> namespace,
            String title,
            String? subtitle,
            String? description,
            List<String> tags,
            List<ViewerSectionUnion> sections)?
        document,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerGroupPage value) group,
    required TResult Function(ViewerDocumentPage value) document,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerGroupPage value)? group,
    TResult Function(ViewerDocumentPage value)? document,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerGroupPage value)? group,
    TResult Function(ViewerDocumentPage value)? document,
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
    required TResult Function(
            String id,
            List<String> namespace,
            String title,
            String? subtitle,
            String? description,
            List<String> tags,
            List<ViewerSectionUnion> sections)
        document,
  }) {
    return group(id, namespace, title, description, children);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id, List<String> namespace, String title,
            String? description, List<ViewerPageUnion> children)?
        group,
    TResult Function(
            String id,
            List<String> namespace,
            String title,
            String? subtitle,
            String? description,
            List<String> tags,
            List<ViewerSectionUnion> sections)?
        document,
  }) {
    return group?.call(id, namespace, title, description, children);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, List<String> namespace, String title,
            String? description, List<ViewerPageUnion> children)?
        group,
    TResult Function(
            String id,
            List<String> namespace,
            String title,
            String? subtitle,
            String? description,
            List<String> tags,
            List<ViewerSectionUnion> sections)?
        document,
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
    required TResult Function(ViewerDocumentPage value) document,
  }) {
    return group(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerGroupPage value)? group,
    TResult Function(ViewerDocumentPage value)? document,
  }) {
    return group?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerGroupPage value)? group,
    TResult Function(ViewerDocumentPage value)? document,
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
abstract class $ViewerDocumentPageCopyWith<$Res>
    implements $ViewerPageUnionCopyWith<$Res> {
  factory $ViewerDocumentPageCopyWith(
          ViewerDocumentPage value, $Res Function(ViewerDocumentPage) then) =
      _$ViewerDocumentPageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      List<String> namespace,
      String title,
      String? subtitle,
      String? description,
      List<String> tags,
      List<ViewerSectionUnion> sections});
}

/// @nodoc
class _$ViewerDocumentPageCopyWithImpl<$Res>
    extends _$ViewerPageUnionCopyWithImpl<$Res>
    implements $ViewerDocumentPageCopyWith<$Res> {
  _$ViewerDocumentPageCopyWithImpl(
      ViewerDocumentPage _value, $Res Function(ViewerDocumentPage) _then)
      : super(_value, (v) => _then(v as ViewerDocumentPage));

  @override
  ViewerDocumentPage get _value => super._value as ViewerDocumentPage;

  @override
  $Res call({
    Object? id = freezed,
    Object? namespace = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? description = freezed,
    Object? tags = freezed,
    Object? sections = freezed,
  }) {
    return _then(ViewerDocumentPage(
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
      subtitle: subtitle == freezed
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sections: sections == freezed
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<ViewerSectionUnion>,
    ));
  }
}

/// @nodoc

class _$ViewerDocumentPage extends ViewerDocumentPage
    with DiagnosticableTreeMixin {
  const _$ViewerDocumentPage(
      {required this.id,
      required this.namespace,
      required this.title,
      this.subtitle,
      this.description,
      this.tags = const [],
      this.sections = const []})
      : super._();

  @override
  final String id;
  @override
  final List<String> namespace;
  @override
  final String title;
  @override
  final String? subtitle;
  @override
  final String? description;
  @JsonKey()
  @override
  final List<String> tags;
  @JsonKey()
  @override
  final List<ViewerSectionUnion> sections;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerPageUnion.document(id: $id, namespace: $namespace, title: $title, subtitle: $subtitle, description: $description, tags: $tags, sections: $sections)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerPageUnion.document'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('namespace', namespace))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('subtitle', subtitle))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('sections', sections));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewerDocumentPage &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.namespace, namespace) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.subtitle, subtitle) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality().equals(other.sections, sections));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(namespace),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(subtitle),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(tags),
      const DeepCollectionEquality().hash(sections));

  @JsonKey(ignore: true)
  @override
  $ViewerDocumentPageCopyWith<ViewerDocumentPage> get copyWith =>
      _$ViewerDocumentPageCopyWithImpl<ViewerDocumentPage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, List<String> namespace, String title,
            String? description, List<ViewerPageUnion> children)
        group,
    required TResult Function(
            String id,
            List<String> namespace,
            String title,
            String? subtitle,
            String? description,
            List<String> tags,
            List<ViewerSectionUnion> sections)
        document,
  }) {
    return document(
        id, namespace, title, subtitle, description, tags, sections);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id, List<String> namespace, String title,
            String? description, List<ViewerPageUnion> children)?
        group,
    TResult Function(
            String id,
            List<String> namespace,
            String title,
            String? subtitle,
            String? description,
            List<String> tags,
            List<ViewerSectionUnion> sections)?
        document,
  }) {
    return document?.call(
        id, namespace, title, subtitle, description, tags, sections);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, List<String> namespace, String title,
            String? description, List<ViewerPageUnion> children)?
        group,
    TResult Function(
            String id,
            List<String> namespace,
            String title,
            String? subtitle,
            String? description,
            List<String> tags,
            List<ViewerSectionUnion> sections)?
        document,
    required TResult orElse(),
  }) {
    if (document != null) {
      return document(
          id, namespace, title, subtitle, description, tags, sections);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerGroupPage value) group,
    required TResult Function(ViewerDocumentPage value) document,
  }) {
    return document(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerGroupPage value)? group,
    TResult Function(ViewerDocumentPage value)? document,
  }) {
    return document?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerGroupPage value)? group,
    TResult Function(ViewerDocumentPage value)? document,
    required TResult orElse(),
  }) {
    if (document != null) {
      return document(this);
    }
    return orElse();
  }
}

abstract class ViewerDocumentPage extends ViewerPageUnion {
  const factory ViewerDocumentPage(
      {required String id,
      required List<String> namespace,
      required String title,
      String? subtitle,
      String? description,
      List<String> tags,
      List<ViewerSectionUnion> sections}) = _$ViewerDocumentPage;
  const ViewerDocumentPage._() : super._();

  @override
  String get id;
  @override
  List<String> get namespace;
  @override
  String get title;
  String? get subtitle;
  @override
  String? get description;
  List<String> get tags;
  List<ViewerSectionUnion> get sections;
  @override
  @JsonKey(ignore: true)
  $ViewerDocumentPageCopyWith<ViewerDocumentPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ViewerGlyphUnionTearOff {
  const _$ViewerGlyphUnionTearOff();

  ViewerIconGlyph icon(
      {required IconData icon, Color? color, double size = 18}) {
    return ViewerIconGlyph(
      icon: icon,
      color: color,
      size: size,
    );
  }

  ViewerImageGlyph image(
      {required String uri, Color? color, double size = 18}) {
    return ViewerImageGlyph(
      uri: uri,
      color: color,
      size: size,
    );
  }
}

/// @nodoc
const $ViewerGlyphUnion = _$ViewerGlyphUnionTearOff();

/// @nodoc
mixin _$ViewerGlyphUnion {
  Color? get color => throw _privateConstructorUsedError;
  double get size => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IconData icon, Color? color, double size) icon,
    required TResult Function(String uri, Color? color, double size) image,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(IconData icon, Color? color, double size)? icon,
    TResult Function(String uri, Color? color, double size)? image,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IconData icon, Color? color, double size)? icon,
    TResult Function(String uri, Color? color, double size)? image,
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
  $Res call({Color? color, double size});
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
    Object? color = freezed,
    Object? size = freezed,
  }) {
    return _then(_value.copyWith(
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
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
  $Res call({IconData icon, Color? color, double size});
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
    Object? color = freezed,
    Object? size = freezed,
  }) {
    return _then(ViewerIconGlyph(
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ViewerIconGlyph extends ViewerIconGlyph with DiagnosticableTreeMixin {
  const _$ViewerIconGlyph({required this.icon, this.color, this.size = 18})
      : super._();

  @override
  final IconData icon;
  @override
  final Color? color;
  @JsonKey()
  @override
  final double size;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerGlyphUnion.icon(icon: $icon, color: $color, size: $size)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerGlyphUnion.icon'))
      ..add(DiagnosticsProperty('icon', icon))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('size', size));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewerIconGlyph &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other.size, size));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(icon),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(size));

  @JsonKey(ignore: true)
  @override
  $ViewerIconGlyphCopyWith<ViewerIconGlyph> get copyWith =>
      _$ViewerIconGlyphCopyWithImpl<ViewerIconGlyph>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IconData icon, Color? color, double size) icon,
    required TResult Function(String uri, Color? color, double size) image,
  }) {
    return icon(this.icon, color, size);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(IconData icon, Color? color, double size)? icon,
    TResult Function(String uri, Color? color, double size)? image,
  }) {
    return icon?.call(this.icon, color, size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IconData icon, Color? color, double size)? icon,
    TResult Function(String uri, Color? color, double size)? image,
    required TResult orElse(),
  }) {
    if (icon != null) {
      return icon(this.icon, color, size);
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
  const factory ViewerIconGlyph(
      {required IconData icon, Color? color, double size}) = _$ViewerIconGlyph;
  const ViewerIconGlyph._() : super._();

  IconData get icon;
  @override
  Color? get color;
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
  $Res call({String uri, Color? color, double size});
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
    Object? color = freezed,
    Object? size = freezed,
  }) {
    return _then(ViewerImageGlyph(
      uri: uri == freezed
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ViewerImageGlyph extends ViewerImageGlyph with DiagnosticableTreeMixin {
  const _$ViewerImageGlyph({required this.uri, this.color, this.size = 18})
      : super._();

  @override
  final String uri;
  @override
  final Color? color;
  @JsonKey()
  @override
  final double size;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerGlyphUnion.image(uri: $uri, color: $color, size: $size)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerGlyphUnion.image'))
      ..add(DiagnosticsProperty('uri', uri))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('size', size));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewerImageGlyph &&
            const DeepCollectionEquality().equals(other.uri, uri) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other.size, size));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uri),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(size));

  @JsonKey(ignore: true)
  @override
  $ViewerImageGlyphCopyWith<ViewerImageGlyph> get copyWith =>
      _$ViewerImageGlyphCopyWithImpl<ViewerImageGlyph>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IconData icon, Color? color, double size) icon,
    required TResult Function(String uri, Color? color, double size) image,
  }) {
    return image(uri, color, size);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(IconData icon, Color? color, double size)? icon,
    TResult Function(String uri, Color? color, double size)? image,
  }) {
    return image?.call(uri, color, size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IconData icon, Color? color, double size)? icon,
    TResult Function(String uri, Color? color, double size)? image,
    required TResult orElse(),
  }) {
    if (image != null) {
      return image(uri, color, size);
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
  const factory ViewerImageGlyph(
      {required String uri, Color? color, double size}) = _$ViewerImageGlyph;
  const ViewerImageGlyph._() : super._();

  String get uri;
  @override
  Color? get color;
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
class _$ViewerSectionUnionTearOff {
  const _$ViewerSectionUnionTearOff();

  ViewerParagraphSection paragraph(
      {required String id,
      required String title,
      String? description,
      List<List<ViewerCollectionItemUnion>> contents = const []}) {
    return ViewerParagraphSection(
      id: id,
      title: title,
      description: description,
      contents: contents,
    );
  }

  ViewerComponentSection component(
      {required String id,
      required String title,
      String? description,
      required ViewerWidgetBuilder builder,
      required ViewerSourceCode sourceCode}) {
    return ViewerComponentSection(
      id: id,
      title: title,
      description: description,
      builder: builder,
      sourceCode: sourceCode,
    );
  }

  ViewerApiDocsSection apiDocs(
      {required String id,
      required String title,
      String? description,
      required List<ClassMemberElement> items}) {
    return ViewerApiDocsSection(
      id: id,
      title: title,
      description: description,
      items: items,
    );
  }
}

/// @nodoc
const $ViewerSectionUnion = _$ViewerSectionUnionTearOff();

/// @nodoc
mixin _$ViewerSectionUnion {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String title, String? description,
            List<List<ViewerCollectionItemUnion>> contents)
        paragraph,
    required TResult Function(String id, String title, String? description,
            ViewerWidgetBuilder builder, ViewerSourceCode sourceCode)
        component,
    required TResult Function(String id, String title, String? description,
            List<ClassMemberElement> items)
        apiDocs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id, String title, String? description,
            List<List<ViewerCollectionItemUnion>> contents)?
        paragraph,
    TResult Function(String id, String title, String? description,
            ViewerWidgetBuilder builder, ViewerSourceCode sourceCode)?
        component,
    TResult Function(String id, String title, String? description,
            List<ClassMemberElement> items)?
        apiDocs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String title, String? description,
            List<List<ViewerCollectionItemUnion>> contents)?
        paragraph,
    TResult Function(String id, String title, String? description,
            ViewerWidgetBuilder builder, ViewerSourceCode sourceCode)?
        component,
    TResult Function(String id, String title, String? description,
            List<ClassMemberElement> items)?
        apiDocs,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerParagraphSection value) paragraph,
    required TResult Function(ViewerComponentSection value) component,
    required TResult Function(ViewerApiDocsSection value) apiDocs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerParagraphSection value)? paragraph,
    TResult Function(ViewerComponentSection value)? component,
    TResult Function(ViewerApiDocsSection value)? apiDocs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerParagraphSection value)? paragraph,
    TResult Function(ViewerComponentSection value)? component,
    TResult Function(ViewerApiDocsSection value)? apiDocs,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewerSectionUnionCopyWith<ViewerSectionUnion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerSectionUnionCopyWith<$Res> {
  factory $ViewerSectionUnionCopyWith(
          ViewerSectionUnion value, $Res Function(ViewerSectionUnion) then) =
      _$ViewerSectionUnionCopyWithImpl<$Res>;
  $Res call({String id, String title, String? description});
}

/// @nodoc
class _$ViewerSectionUnionCopyWithImpl<$Res>
    implements $ViewerSectionUnionCopyWith<$Res> {
  _$ViewerSectionUnionCopyWithImpl(this._value, this._then);

  final ViewerSectionUnion _value;
  // ignore: unused_field
  final $Res Function(ViewerSectionUnion) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
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
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class $ViewerParagraphSectionCopyWith<$Res>
    implements $ViewerSectionUnionCopyWith<$Res> {
  factory $ViewerParagraphSectionCopyWith(ViewerParagraphSection value,
          $Res Function(ViewerParagraphSection) then) =
      _$ViewerParagraphSectionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      String? description,
      List<List<ViewerCollectionItemUnion>> contents});
}

/// @nodoc
class _$ViewerParagraphSectionCopyWithImpl<$Res>
    extends _$ViewerSectionUnionCopyWithImpl<$Res>
    implements $ViewerParagraphSectionCopyWith<$Res> {
  _$ViewerParagraphSectionCopyWithImpl(ViewerParagraphSection _value,
      $Res Function(ViewerParagraphSection) _then)
      : super(_value, (v) => _then(v as ViewerParagraphSection));

  @override
  ViewerParagraphSection get _value => super._value as ViewerParagraphSection;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? contents = freezed,
  }) {
    return _then(ViewerParagraphSection(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      contents: contents == freezed
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<List<ViewerCollectionItemUnion>>,
    ));
  }
}

/// @nodoc

class _$ViewerParagraphSection extends ViewerParagraphSection
    with DiagnosticableTreeMixin {
  const _$ViewerParagraphSection(
      {required this.id,
      required this.title,
      this.description,
      this.contents = const []})
      : super._();

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @JsonKey()
  @override
  final List<List<ViewerCollectionItemUnion>> contents;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerSectionUnion.paragraph(id: $id, title: $title, description: $description, contents: $contents)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerSectionUnion.paragraph'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('contents', contents));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewerParagraphSection &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.contents, contents));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(contents));

  @JsonKey(ignore: true)
  @override
  $ViewerParagraphSectionCopyWith<ViewerParagraphSection> get copyWith =>
      _$ViewerParagraphSectionCopyWithImpl<ViewerParagraphSection>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String title, String? description,
            List<List<ViewerCollectionItemUnion>> contents)
        paragraph,
    required TResult Function(String id, String title, String? description,
            ViewerWidgetBuilder builder, ViewerSourceCode sourceCode)
        component,
    required TResult Function(String id, String title, String? description,
            List<ClassMemberElement> items)
        apiDocs,
  }) {
    return paragraph(id, title, description, contents);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id, String title, String? description,
            List<List<ViewerCollectionItemUnion>> contents)?
        paragraph,
    TResult Function(String id, String title, String? description,
            ViewerWidgetBuilder builder, ViewerSourceCode sourceCode)?
        component,
    TResult Function(String id, String title, String? description,
            List<ClassMemberElement> items)?
        apiDocs,
  }) {
    return paragraph?.call(id, title, description, contents);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String title, String? description,
            List<List<ViewerCollectionItemUnion>> contents)?
        paragraph,
    TResult Function(String id, String title, String? description,
            ViewerWidgetBuilder builder, ViewerSourceCode sourceCode)?
        component,
    TResult Function(String id, String title, String? description,
            List<ClassMemberElement> items)?
        apiDocs,
    required TResult orElse(),
  }) {
    if (paragraph != null) {
      return paragraph(id, title, description, contents);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerParagraphSection value) paragraph,
    required TResult Function(ViewerComponentSection value) component,
    required TResult Function(ViewerApiDocsSection value) apiDocs,
  }) {
    return paragraph(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerParagraphSection value)? paragraph,
    TResult Function(ViewerComponentSection value)? component,
    TResult Function(ViewerApiDocsSection value)? apiDocs,
  }) {
    return paragraph?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerParagraphSection value)? paragraph,
    TResult Function(ViewerComponentSection value)? component,
    TResult Function(ViewerApiDocsSection value)? apiDocs,
    required TResult orElse(),
  }) {
    if (paragraph != null) {
      return paragraph(this);
    }
    return orElse();
  }
}

abstract class ViewerParagraphSection extends ViewerSectionUnion {
  const factory ViewerParagraphSection(
          {required String id,
          required String title,
          String? description,
          List<List<ViewerCollectionItemUnion>> contents}) =
      _$ViewerParagraphSection;
  const ViewerParagraphSection._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  List<List<ViewerCollectionItemUnion>> get contents;
  @override
  @JsonKey(ignore: true)
  $ViewerParagraphSectionCopyWith<ViewerParagraphSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerComponentSectionCopyWith<$Res>
    implements $ViewerSectionUnionCopyWith<$Res> {
  factory $ViewerComponentSectionCopyWith(ViewerComponentSection value,
          $Res Function(ViewerComponentSection) then) =
      _$ViewerComponentSectionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      String? description,
      ViewerWidgetBuilder builder,
      ViewerSourceCode sourceCode});

  $ViewerWidgetBuilderCopyWith<$Res> get builder;
  $ViewerSourceCodeCopyWith<$Res> get sourceCode;
}

/// @nodoc
class _$ViewerComponentSectionCopyWithImpl<$Res>
    extends _$ViewerSectionUnionCopyWithImpl<$Res>
    implements $ViewerComponentSectionCopyWith<$Res> {
  _$ViewerComponentSectionCopyWithImpl(ViewerComponentSection _value,
      $Res Function(ViewerComponentSection) _then)
      : super(_value, (v) => _then(v as ViewerComponentSection));

  @override
  ViewerComponentSection get _value => super._value as ViewerComponentSection;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? builder = freezed,
    Object? sourceCode = freezed,
  }) {
    return _then(ViewerComponentSection(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      builder: builder == freezed
          ? _value.builder
          : builder // ignore: cast_nullable_to_non_nullable
              as ViewerWidgetBuilder,
      sourceCode: sourceCode == freezed
          ? _value.sourceCode
          : sourceCode // ignore: cast_nullable_to_non_nullable
              as ViewerSourceCode,
    ));
  }

  @override
  $ViewerWidgetBuilderCopyWith<$Res> get builder {
    return $ViewerWidgetBuilderCopyWith<$Res>(_value.builder, (value) {
      return _then(_value.copyWith(builder: value));
    });
  }

  @override
  $ViewerSourceCodeCopyWith<$Res> get sourceCode {
    return $ViewerSourceCodeCopyWith<$Res>(_value.sourceCode, (value) {
      return _then(_value.copyWith(sourceCode: value));
    });
  }
}

/// @nodoc

class _$ViewerComponentSection extends ViewerComponentSection
    with DiagnosticableTreeMixin {
  const _$ViewerComponentSection(
      {required this.id,
      required this.title,
      this.description,
      required this.builder,
      required this.sourceCode})
      : super._();

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final ViewerWidgetBuilder builder;
  @override
  final ViewerSourceCode sourceCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerSectionUnion.component(id: $id, title: $title, description: $description, builder: $builder, sourceCode: $sourceCode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerSectionUnion.component'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('builder', builder))
      ..add(DiagnosticsProperty('sourceCode', sourceCode));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewerComponentSection &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.builder, builder) &&
            const DeepCollectionEquality()
                .equals(other.sourceCode, sourceCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(builder),
      const DeepCollectionEquality().hash(sourceCode));

  @JsonKey(ignore: true)
  @override
  $ViewerComponentSectionCopyWith<ViewerComponentSection> get copyWith =>
      _$ViewerComponentSectionCopyWithImpl<ViewerComponentSection>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String title, String? description,
            List<List<ViewerCollectionItemUnion>> contents)
        paragraph,
    required TResult Function(String id, String title, String? description,
            ViewerWidgetBuilder builder, ViewerSourceCode sourceCode)
        component,
    required TResult Function(String id, String title, String? description,
            List<ClassMemberElement> items)
        apiDocs,
  }) {
    return component(id, title, description, builder, sourceCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id, String title, String? description,
            List<List<ViewerCollectionItemUnion>> contents)?
        paragraph,
    TResult Function(String id, String title, String? description,
            ViewerWidgetBuilder builder, ViewerSourceCode sourceCode)?
        component,
    TResult Function(String id, String title, String? description,
            List<ClassMemberElement> items)?
        apiDocs,
  }) {
    return component?.call(id, title, description, builder, sourceCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String title, String? description,
            List<List<ViewerCollectionItemUnion>> contents)?
        paragraph,
    TResult Function(String id, String title, String? description,
            ViewerWidgetBuilder builder, ViewerSourceCode sourceCode)?
        component,
    TResult Function(String id, String title, String? description,
            List<ClassMemberElement> items)?
        apiDocs,
    required TResult orElse(),
  }) {
    if (component != null) {
      return component(id, title, description, builder, sourceCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerParagraphSection value) paragraph,
    required TResult Function(ViewerComponentSection value) component,
    required TResult Function(ViewerApiDocsSection value) apiDocs,
  }) {
    return component(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerParagraphSection value)? paragraph,
    TResult Function(ViewerComponentSection value)? component,
    TResult Function(ViewerApiDocsSection value)? apiDocs,
  }) {
    return component?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerParagraphSection value)? paragraph,
    TResult Function(ViewerComponentSection value)? component,
    TResult Function(ViewerApiDocsSection value)? apiDocs,
    required TResult orElse(),
  }) {
    if (component != null) {
      return component(this);
    }
    return orElse();
  }
}

abstract class ViewerComponentSection extends ViewerSectionUnion {
  const factory ViewerComponentSection(
      {required String id,
      required String title,
      String? description,
      required ViewerWidgetBuilder builder,
      required ViewerSourceCode sourceCode}) = _$ViewerComponentSection;
  const ViewerComponentSection._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  ViewerWidgetBuilder get builder;
  ViewerSourceCode get sourceCode;
  @override
  @JsonKey(ignore: true)
  $ViewerComponentSectionCopyWith<ViewerComponentSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerApiDocsSectionCopyWith<$Res>
    implements $ViewerSectionUnionCopyWith<$Res> {
  factory $ViewerApiDocsSectionCopyWith(ViewerApiDocsSection value,
          $Res Function(ViewerApiDocsSection) then) =
      _$ViewerApiDocsSectionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      String? description,
      List<ClassMemberElement> items});
}

/// @nodoc
class _$ViewerApiDocsSectionCopyWithImpl<$Res>
    extends _$ViewerSectionUnionCopyWithImpl<$Res>
    implements $ViewerApiDocsSectionCopyWith<$Res> {
  _$ViewerApiDocsSectionCopyWithImpl(
      ViewerApiDocsSection _value, $Res Function(ViewerApiDocsSection) _then)
      : super(_value, (v) => _then(v as ViewerApiDocsSection));

  @override
  ViewerApiDocsSection get _value => super._value as ViewerApiDocsSection;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? items = freezed,
  }) {
    return _then(ViewerApiDocsSection(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ClassMemberElement>,
    ));
  }
}

/// @nodoc

class _$ViewerApiDocsSection extends ViewerApiDocsSection
    with DiagnosticableTreeMixin {
  const _$ViewerApiDocsSection(
      {required this.id,
      required this.title,
      this.description,
      required this.items})
      : super._();

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final List<ClassMemberElement> items;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerSectionUnion.apiDocs(id: $id, title: $title, description: $description, items: $items)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerSectionUnion.apiDocs'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('items', items));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewerApiDocsSection &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(items));

  @JsonKey(ignore: true)
  @override
  $ViewerApiDocsSectionCopyWith<ViewerApiDocsSection> get copyWith =>
      _$ViewerApiDocsSectionCopyWithImpl<ViewerApiDocsSection>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String title, String? description,
            List<List<ViewerCollectionItemUnion>> contents)
        paragraph,
    required TResult Function(String id, String title, String? description,
            ViewerWidgetBuilder builder, ViewerSourceCode sourceCode)
        component,
    required TResult Function(String id, String title, String? description,
            List<ClassMemberElement> items)
        apiDocs,
  }) {
    return apiDocs(id, title, description, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id, String title, String? description,
            List<List<ViewerCollectionItemUnion>> contents)?
        paragraph,
    TResult Function(String id, String title, String? description,
            ViewerWidgetBuilder builder, ViewerSourceCode sourceCode)?
        component,
    TResult Function(String id, String title, String? description,
            List<ClassMemberElement> items)?
        apiDocs,
  }) {
    return apiDocs?.call(id, title, description, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String title, String? description,
            List<List<ViewerCollectionItemUnion>> contents)?
        paragraph,
    TResult Function(String id, String title, String? description,
            ViewerWidgetBuilder builder, ViewerSourceCode sourceCode)?
        component,
    TResult Function(String id, String title, String? description,
            List<ClassMemberElement> items)?
        apiDocs,
    required TResult orElse(),
  }) {
    if (apiDocs != null) {
      return apiDocs(id, title, description, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerParagraphSection value) paragraph,
    required TResult Function(ViewerComponentSection value) component,
    required TResult Function(ViewerApiDocsSection value) apiDocs,
  }) {
    return apiDocs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerParagraphSection value)? paragraph,
    TResult Function(ViewerComponentSection value)? component,
    TResult Function(ViewerApiDocsSection value)? apiDocs,
  }) {
    return apiDocs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerParagraphSection value)? paragraph,
    TResult Function(ViewerComponentSection value)? component,
    TResult Function(ViewerApiDocsSection value)? apiDocs,
    required TResult orElse(),
  }) {
    if (apiDocs != null) {
      return apiDocs(this);
    }
    return orElse();
  }
}

abstract class ViewerApiDocsSection extends ViewerSectionUnion {
  const factory ViewerApiDocsSection(
      {required String id,
      required String title,
      String? description,
      required List<ClassMemberElement> items}) = _$ViewerApiDocsSection;
  const ViewerApiDocsSection._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  List<ClassMemberElement> get items;
  @override
  @JsonKey(ignore: true)
  $ViewerApiDocsSectionCopyWith<ViewerApiDocsSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ViewerWidgetBuilderTearOff {
  const _$ViewerWidgetBuilderTearOff();

  _ViewerWidgetBuilder call(
      {required WidgetDynamicBuilder build,
      List<FieldMetaData> fieldMetaDataset = const []}) {
    return _ViewerWidgetBuilder(
      build: build,
      fieldMetaDataset: fieldMetaDataset,
    );
  }
}

/// @nodoc
const $ViewerWidgetBuilder = _$ViewerWidgetBuilderTearOff();

/// @nodoc
mixin _$ViewerWidgetBuilder {
  WidgetDynamicBuilder get build => throw _privateConstructorUsedError;
  List<FieldMetaData> get fieldMetaDataset =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewerWidgetBuilderCopyWith<ViewerWidgetBuilder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerWidgetBuilderCopyWith<$Res> {
  factory $ViewerWidgetBuilderCopyWith(
          ViewerWidgetBuilder value, $Res Function(ViewerWidgetBuilder) then) =
      _$ViewerWidgetBuilderCopyWithImpl<$Res>;
  $Res call({WidgetDynamicBuilder build, List<FieldMetaData> fieldMetaDataset});
}

/// @nodoc
class _$ViewerWidgetBuilderCopyWithImpl<$Res>
    implements $ViewerWidgetBuilderCopyWith<$Res> {
  _$ViewerWidgetBuilderCopyWithImpl(this._value, this._then);

  final ViewerWidgetBuilder _value;
  // ignore: unused_field
  final $Res Function(ViewerWidgetBuilder) _then;

  @override
  $Res call({
    Object? build = freezed,
    Object? fieldMetaDataset = freezed,
  }) {
    return _then(_value.copyWith(
      build: build == freezed
          ? _value.build
          : build // ignore: cast_nullable_to_non_nullable
              as WidgetDynamicBuilder,
      fieldMetaDataset: fieldMetaDataset == freezed
          ? _value.fieldMetaDataset
          : fieldMetaDataset // ignore: cast_nullable_to_non_nullable
              as List<FieldMetaData>,
    ));
  }
}

/// @nodoc
abstract class _$ViewerWidgetBuilderCopyWith<$Res>
    implements $ViewerWidgetBuilderCopyWith<$Res> {
  factory _$ViewerWidgetBuilderCopyWith(_ViewerWidgetBuilder value,
          $Res Function(_ViewerWidgetBuilder) then) =
      __$ViewerWidgetBuilderCopyWithImpl<$Res>;
  @override
  $Res call({WidgetDynamicBuilder build, List<FieldMetaData> fieldMetaDataset});
}

/// @nodoc
class __$ViewerWidgetBuilderCopyWithImpl<$Res>
    extends _$ViewerWidgetBuilderCopyWithImpl<$Res>
    implements _$ViewerWidgetBuilderCopyWith<$Res> {
  __$ViewerWidgetBuilderCopyWithImpl(
      _ViewerWidgetBuilder _value, $Res Function(_ViewerWidgetBuilder) _then)
      : super(_value, (v) => _then(v as _ViewerWidgetBuilder));

  @override
  _ViewerWidgetBuilder get _value => super._value as _ViewerWidgetBuilder;

  @override
  $Res call({
    Object? build = freezed,
    Object? fieldMetaDataset = freezed,
  }) {
    return _then(_ViewerWidgetBuilder(
      build: build == freezed
          ? _value.build
          : build // ignore: cast_nullable_to_non_nullable
              as WidgetDynamicBuilder,
      fieldMetaDataset: fieldMetaDataset == freezed
          ? _value.fieldMetaDataset
          : fieldMetaDataset // ignore: cast_nullable_to_non_nullable
              as List<FieldMetaData>,
    ));
  }
}

/// @nodoc

class _$_ViewerWidgetBuilder extends _ViewerWidgetBuilder
    with DiagnosticableTreeMixin {
  const _$_ViewerWidgetBuilder(
      {required this.build, this.fieldMetaDataset = const []})
      : super._();

  @override
  final WidgetDynamicBuilder build;
  @JsonKey()
  @override
  final List<FieldMetaData> fieldMetaDataset;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerWidgetBuilder(build: $build, fieldMetaDataset: $fieldMetaDataset)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerWidgetBuilder'))
      ..add(DiagnosticsProperty('build', build))
      ..add(DiagnosticsProperty('fieldMetaDataset', fieldMetaDataset));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ViewerWidgetBuilder &&
            (identical(other.build, build) || other.build == build) &&
            const DeepCollectionEquality()
                .equals(other.fieldMetaDataset, fieldMetaDataset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, build,
      const DeepCollectionEquality().hash(fieldMetaDataset));

  @JsonKey(ignore: true)
  @override
  _$ViewerWidgetBuilderCopyWith<_ViewerWidgetBuilder> get copyWith =>
      __$ViewerWidgetBuilderCopyWithImpl<_ViewerWidgetBuilder>(
          this, _$identity);
}

abstract class _ViewerWidgetBuilder extends ViewerWidgetBuilder {
  const factory _ViewerWidgetBuilder(
      {required WidgetDynamicBuilder build,
      List<FieldMetaData> fieldMetaDataset}) = _$_ViewerWidgetBuilder;
  const _ViewerWidgetBuilder._() : super._();

  @override
  WidgetDynamicBuilder get build;
  @override
  List<FieldMetaData> get fieldMetaDataset;
  @override
  @JsonKey(ignore: true)
  _$ViewerWidgetBuilderCopyWith<_ViewerWidgetBuilder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$FieldMetaDataTearOff {
  const _$FieldMetaDataTearOff();

  _FieldMetaData call(
      {required String name, required Type type, dynamic defaultValue}) {
    return _FieldMetaData(
      name: name,
      type: type,
      defaultValue: defaultValue,
    );
  }
}

/// @nodoc
const $FieldMetaData = _$FieldMetaDataTearOff();

/// @nodoc
mixin _$FieldMetaData {
  String get name => throw _privateConstructorUsedError;
  Type get type => throw _privateConstructorUsedError;
  dynamic get defaultValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FieldMetaDataCopyWith<FieldMetaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldMetaDataCopyWith<$Res> {
  factory $FieldMetaDataCopyWith(
          FieldMetaData value, $Res Function(FieldMetaData) then) =
      _$FieldMetaDataCopyWithImpl<$Res>;
  $Res call({String name, Type type, dynamic defaultValue});
}

/// @nodoc
class _$FieldMetaDataCopyWithImpl<$Res>
    implements $FieldMetaDataCopyWith<$Res> {
  _$FieldMetaDataCopyWithImpl(this._value, this._then);

  final FieldMetaData _value;
  // ignore: unused_field
  final $Res Function(FieldMetaData) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? type = freezed,
    Object? defaultValue = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Type,
      defaultValue: defaultValue == freezed
          ? _value.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$FieldMetaDataCopyWith<$Res>
    implements $FieldMetaDataCopyWith<$Res> {
  factory _$FieldMetaDataCopyWith(
          _FieldMetaData value, $Res Function(_FieldMetaData) then) =
      __$FieldMetaDataCopyWithImpl<$Res>;
  @override
  $Res call({String name, Type type, dynamic defaultValue});
}

/// @nodoc
class __$FieldMetaDataCopyWithImpl<$Res>
    extends _$FieldMetaDataCopyWithImpl<$Res>
    implements _$FieldMetaDataCopyWith<$Res> {
  __$FieldMetaDataCopyWithImpl(
      _FieldMetaData _value, $Res Function(_FieldMetaData) _then)
      : super(_value, (v) => _then(v as _FieldMetaData));

  @override
  _FieldMetaData get _value => super._value as _FieldMetaData;

  @override
  $Res call({
    Object? name = freezed,
    Object? type = freezed,
    Object? defaultValue = freezed,
  }) {
    return _then(_FieldMetaData(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Type,
      defaultValue: defaultValue == freezed
          ? _value.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_FieldMetaData with DiagnosticableTreeMixin implements _FieldMetaData {
  const _$_FieldMetaData(
      {required this.name, required this.type, this.defaultValue});

  @override
  final String name;
  @override
  final Type type;
  @override
  final dynamic defaultValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FieldMetaData(name: $name, type: $type, defaultValue: $defaultValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FieldMetaData'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('defaultValue', defaultValue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FieldMetaData &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other.defaultValue, defaultValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(defaultValue));

  @JsonKey(ignore: true)
  @override
  _$FieldMetaDataCopyWith<_FieldMetaData> get copyWith =>
      __$FieldMetaDataCopyWithImpl<_FieldMetaData>(this, _$identity);
}

abstract class _FieldMetaData implements FieldMetaData {
  const factory _FieldMetaData(
      {required String name,
      required Type type,
      dynamic defaultValue}) = _$_FieldMetaData;

  @override
  String get name;
  @override
  Type get type;
  @override
  dynamic get defaultValue;
  @override
  @JsonKey(ignore: true)
  _$FieldMetaDataCopyWith<_FieldMetaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ViewerCollectionItemUnionTearOff {
  const _$ViewerCollectionItemUnionTearOff();

  ViewerTextCollectionItem text({String? title, String? description}) {
    return ViewerTextCollectionItem(
      title: title,
      description: description,
    );
  }

  ViewerGlyphCollectionItem glyph(
      {required ViewerGlyphUnion glyph, required String title}) {
    return ViewerGlyphCollectionItem(
      glyph: glyph,
      title: title,
    );
  }

  ViewerLinkCollectionItem link({required String title, required String url}) {
    return ViewerLinkCollectionItem(
      title: title,
      url: url,
    );
  }

  ViewerImageCollectionItem image(
      {required ViewerImageCollectionItemStyle style,
      required String url,
      String? title,
      String? description,
      double? width,
      double? height}) {
    return ViewerImageCollectionItem(
      style: style,
      url: url,
      title: title,
      description: description,
      width: width,
      height: height,
    );
  }

  ViewerWidgetCollectionItem widget({required Widget widget}) {
    return ViewerWidgetCollectionItem(
      widget: widget,
    );
  }
}

/// @nodoc
const $ViewerCollectionItemUnion = _$ViewerCollectionItemUnionTearOff();

/// @nodoc
mixin _$ViewerCollectionItemUnion {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? title, String? description) text,
    required TResult Function(ViewerGlyphUnion glyph, String title) glyph,
    required TResult Function(String title, String url) link,
    required TResult Function(ViewerImageCollectionItemStyle style, String url,
            String? title, String? description, double? width, double? height)
        image,
    required TResult Function(Widget widget) widget,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? title, String? description)? text,
    TResult Function(ViewerGlyphUnion glyph, String title)? glyph,
    TResult Function(String title, String url)? link,
    TResult Function(ViewerImageCollectionItemStyle style, String url,
            String? title, String? description, double? width, double? height)?
        image,
    TResult Function(Widget widget)? widget,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? title, String? description)? text,
    TResult Function(ViewerGlyphUnion glyph, String title)? glyph,
    TResult Function(String title, String url)? link,
    TResult Function(ViewerImageCollectionItemStyle style, String url,
            String? title, String? description, double? width, double? height)?
        image,
    TResult Function(Widget widget)? widget,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerTextCollectionItem value) text,
    required TResult Function(ViewerGlyphCollectionItem value) glyph,
    required TResult Function(ViewerLinkCollectionItem value) link,
    required TResult Function(ViewerImageCollectionItem value) image,
    required TResult Function(ViewerWidgetCollectionItem value) widget,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerTextCollectionItem value)? text,
    TResult Function(ViewerGlyphCollectionItem value)? glyph,
    TResult Function(ViewerLinkCollectionItem value)? link,
    TResult Function(ViewerImageCollectionItem value)? image,
    TResult Function(ViewerWidgetCollectionItem value)? widget,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerTextCollectionItem value)? text,
    TResult Function(ViewerGlyphCollectionItem value)? glyph,
    TResult Function(ViewerLinkCollectionItem value)? link,
    TResult Function(ViewerImageCollectionItem value)? image,
    TResult Function(ViewerWidgetCollectionItem value)? widget,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerCollectionItemUnionCopyWith<$Res> {
  factory $ViewerCollectionItemUnionCopyWith(ViewerCollectionItemUnion value,
          $Res Function(ViewerCollectionItemUnion) then) =
      _$ViewerCollectionItemUnionCopyWithImpl<$Res>;
}

/// @nodoc
class _$ViewerCollectionItemUnionCopyWithImpl<$Res>
    implements $ViewerCollectionItemUnionCopyWith<$Res> {
  _$ViewerCollectionItemUnionCopyWithImpl(this._value, this._then);

  final ViewerCollectionItemUnion _value;
  // ignore: unused_field
  final $Res Function(ViewerCollectionItemUnion) _then;
}

/// @nodoc
abstract class $ViewerTextCollectionItemCopyWith<$Res> {
  factory $ViewerTextCollectionItemCopyWith(ViewerTextCollectionItem value,
          $Res Function(ViewerTextCollectionItem) then) =
      _$ViewerTextCollectionItemCopyWithImpl<$Res>;
  $Res call({String? title, String? description});
}

/// @nodoc
class _$ViewerTextCollectionItemCopyWithImpl<$Res>
    extends _$ViewerCollectionItemUnionCopyWithImpl<$Res>
    implements $ViewerTextCollectionItemCopyWith<$Res> {
  _$ViewerTextCollectionItemCopyWithImpl(ViewerTextCollectionItem _value,
      $Res Function(ViewerTextCollectionItem) _then)
      : super(_value, (v) => _then(v as ViewerTextCollectionItem));

  @override
  ViewerTextCollectionItem get _value =>
      super._value as ViewerTextCollectionItem;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(ViewerTextCollectionItem(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ViewerTextCollectionItem extends ViewerTextCollectionItem
    with DiagnosticableTreeMixin {
  const _$ViewerTextCollectionItem({this.title, this.description}) : super._();

  @override
  final String? title;
  @override
  final String? description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerCollectionItemUnion.text(title: $title, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerCollectionItemUnion.text'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewerTextCollectionItem &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  $ViewerTextCollectionItemCopyWith<ViewerTextCollectionItem> get copyWith =>
      _$ViewerTextCollectionItemCopyWithImpl<ViewerTextCollectionItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? title, String? description) text,
    required TResult Function(ViewerGlyphUnion glyph, String title) glyph,
    required TResult Function(String title, String url) link,
    required TResult Function(ViewerImageCollectionItemStyle style, String url,
            String? title, String? description, double? width, double? height)
        image,
    required TResult Function(Widget widget) widget,
  }) {
    return text(title, description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? title, String? description)? text,
    TResult Function(ViewerGlyphUnion glyph, String title)? glyph,
    TResult Function(String title, String url)? link,
    TResult Function(ViewerImageCollectionItemStyle style, String url,
            String? title, String? description, double? width, double? height)?
        image,
    TResult Function(Widget widget)? widget,
  }) {
    return text?.call(title, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? title, String? description)? text,
    TResult Function(ViewerGlyphUnion glyph, String title)? glyph,
    TResult Function(String title, String url)? link,
    TResult Function(ViewerImageCollectionItemStyle style, String url,
            String? title, String? description, double? width, double? height)?
        image,
    TResult Function(Widget widget)? widget,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(title, description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerTextCollectionItem value) text,
    required TResult Function(ViewerGlyphCollectionItem value) glyph,
    required TResult Function(ViewerLinkCollectionItem value) link,
    required TResult Function(ViewerImageCollectionItem value) image,
    required TResult Function(ViewerWidgetCollectionItem value) widget,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerTextCollectionItem value)? text,
    TResult Function(ViewerGlyphCollectionItem value)? glyph,
    TResult Function(ViewerLinkCollectionItem value)? link,
    TResult Function(ViewerImageCollectionItem value)? image,
    TResult Function(ViewerWidgetCollectionItem value)? widget,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerTextCollectionItem value)? text,
    TResult Function(ViewerGlyphCollectionItem value)? glyph,
    TResult Function(ViewerLinkCollectionItem value)? link,
    TResult Function(ViewerImageCollectionItem value)? image,
    TResult Function(ViewerWidgetCollectionItem value)? widget,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }
}

abstract class ViewerTextCollectionItem extends ViewerCollectionItemUnion {
  const factory ViewerTextCollectionItem({String? title, String? description}) =
      _$ViewerTextCollectionItem;
  const ViewerTextCollectionItem._() : super._();

  String? get title;
  String? get description;
  @JsonKey(ignore: true)
  $ViewerTextCollectionItemCopyWith<ViewerTextCollectionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerGlyphCollectionItemCopyWith<$Res> {
  factory $ViewerGlyphCollectionItemCopyWith(ViewerGlyphCollectionItem value,
          $Res Function(ViewerGlyphCollectionItem) then) =
      _$ViewerGlyphCollectionItemCopyWithImpl<$Res>;
  $Res call({ViewerGlyphUnion glyph, String title});

  $ViewerGlyphUnionCopyWith<$Res> get glyph;
}

/// @nodoc
class _$ViewerGlyphCollectionItemCopyWithImpl<$Res>
    extends _$ViewerCollectionItemUnionCopyWithImpl<$Res>
    implements $ViewerGlyphCollectionItemCopyWith<$Res> {
  _$ViewerGlyphCollectionItemCopyWithImpl(ViewerGlyphCollectionItem _value,
      $Res Function(ViewerGlyphCollectionItem) _then)
      : super(_value, (v) => _then(v as ViewerGlyphCollectionItem));

  @override
  ViewerGlyphCollectionItem get _value =>
      super._value as ViewerGlyphCollectionItem;

  @override
  $Res call({
    Object? glyph = freezed,
    Object? title = freezed,
  }) {
    return _then(ViewerGlyphCollectionItem(
      glyph: glyph == freezed
          ? _value.glyph
          : glyph // ignore: cast_nullable_to_non_nullable
              as ViewerGlyphUnion,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $ViewerGlyphUnionCopyWith<$Res> get glyph {
    return $ViewerGlyphUnionCopyWith<$Res>(_value.glyph, (value) {
      return _then(_value.copyWith(glyph: value));
    });
  }
}

/// @nodoc

class _$ViewerGlyphCollectionItem extends ViewerGlyphCollectionItem
    with DiagnosticableTreeMixin {
  const _$ViewerGlyphCollectionItem({required this.glyph, required this.title})
      : super._();

  @override
  final ViewerGlyphUnion glyph;
  @override
  final String title;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerCollectionItemUnion.glyph(glyph: $glyph, title: $title)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerCollectionItemUnion.glyph'))
      ..add(DiagnosticsProperty('glyph', glyph))
      ..add(DiagnosticsProperty('title', title));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewerGlyphCollectionItem &&
            const DeepCollectionEquality().equals(other.glyph, glyph) &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(glyph),
      const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  $ViewerGlyphCollectionItemCopyWith<ViewerGlyphCollectionItem> get copyWith =>
      _$ViewerGlyphCollectionItemCopyWithImpl<ViewerGlyphCollectionItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? title, String? description) text,
    required TResult Function(ViewerGlyphUnion glyph, String title) glyph,
    required TResult Function(String title, String url) link,
    required TResult Function(ViewerImageCollectionItemStyle style, String url,
            String? title, String? description, double? width, double? height)
        image,
    required TResult Function(Widget widget) widget,
  }) {
    return glyph(this.glyph, title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? title, String? description)? text,
    TResult Function(ViewerGlyphUnion glyph, String title)? glyph,
    TResult Function(String title, String url)? link,
    TResult Function(ViewerImageCollectionItemStyle style, String url,
            String? title, String? description, double? width, double? height)?
        image,
    TResult Function(Widget widget)? widget,
  }) {
    return glyph?.call(this.glyph, title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? title, String? description)? text,
    TResult Function(ViewerGlyphUnion glyph, String title)? glyph,
    TResult Function(String title, String url)? link,
    TResult Function(ViewerImageCollectionItemStyle style, String url,
            String? title, String? description, double? width, double? height)?
        image,
    TResult Function(Widget widget)? widget,
    required TResult orElse(),
  }) {
    if (glyph != null) {
      return glyph(this.glyph, title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerTextCollectionItem value) text,
    required TResult Function(ViewerGlyphCollectionItem value) glyph,
    required TResult Function(ViewerLinkCollectionItem value) link,
    required TResult Function(ViewerImageCollectionItem value) image,
    required TResult Function(ViewerWidgetCollectionItem value) widget,
  }) {
    return glyph(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerTextCollectionItem value)? text,
    TResult Function(ViewerGlyphCollectionItem value)? glyph,
    TResult Function(ViewerLinkCollectionItem value)? link,
    TResult Function(ViewerImageCollectionItem value)? image,
    TResult Function(ViewerWidgetCollectionItem value)? widget,
  }) {
    return glyph?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerTextCollectionItem value)? text,
    TResult Function(ViewerGlyphCollectionItem value)? glyph,
    TResult Function(ViewerLinkCollectionItem value)? link,
    TResult Function(ViewerImageCollectionItem value)? image,
    TResult Function(ViewerWidgetCollectionItem value)? widget,
    required TResult orElse(),
  }) {
    if (glyph != null) {
      return glyph(this);
    }
    return orElse();
  }
}

abstract class ViewerGlyphCollectionItem extends ViewerCollectionItemUnion {
  const factory ViewerGlyphCollectionItem(
      {required ViewerGlyphUnion glyph,
      required String title}) = _$ViewerGlyphCollectionItem;
  const ViewerGlyphCollectionItem._() : super._();

  ViewerGlyphUnion get glyph;
  String get title;
  @JsonKey(ignore: true)
  $ViewerGlyphCollectionItemCopyWith<ViewerGlyphCollectionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerLinkCollectionItemCopyWith<$Res> {
  factory $ViewerLinkCollectionItemCopyWith(ViewerLinkCollectionItem value,
          $Res Function(ViewerLinkCollectionItem) then) =
      _$ViewerLinkCollectionItemCopyWithImpl<$Res>;
  $Res call({String title, String url});
}

/// @nodoc
class _$ViewerLinkCollectionItemCopyWithImpl<$Res>
    extends _$ViewerCollectionItemUnionCopyWithImpl<$Res>
    implements $ViewerLinkCollectionItemCopyWith<$Res> {
  _$ViewerLinkCollectionItemCopyWithImpl(ViewerLinkCollectionItem _value,
      $Res Function(ViewerLinkCollectionItem) _then)
      : super(_value, (v) => _then(v as ViewerLinkCollectionItem));

  @override
  ViewerLinkCollectionItem get _value =>
      super._value as ViewerLinkCollectionItem;

  @override
  $Res call({
    Object? title = freezed,
    Object? url = freezed,
  }) {
    return _then(ViewerLinkCollectionItem(
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

class _$ViewerLinkCollectionItem extends ViewerLinkCollectionItem
    with DiagnosticableTreeMixin {
  const _$ViewerLinkCollectionItem({required this.title, required this.url})
      : super._();

  @override
  final String title;
  @override
  final String url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerCollectionItemUnion.link(title: $title, url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerCollectionItemUnion.link'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewerLinkCollectionItem &&
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
  $ViewerLinkCollectionItemCopyWith<ViewerLinkCollectionItem> get copyWith =>
      _$ViewerLinkCollectionItemCopyWithImpl<ViewerLinkCollectionItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? title, String? description) text,
    required TResult Function(ViewerGlyphUnion glyph, String title) glyph,
    required TResult Function(String title, String url) link,
    required TResult Function(ViewerImageCollectionItemStyle style, String url,
            String? title, String? description, double? width, double? height)
        image,
    required TResult Function(Widget widget) widget,
  }) {
    return link(title, url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? title, String? description)? text,
    TResult Function(ViewerGlyphUnion glyph, String title)? glyph,
    TResult Function(String title, String url)? link,
    TResult Function(ViewerImageCollectionItemStyle style, String url,
            String? title, String? description, double? width, double? height)?
        image,
    TResult Function(Widget widget)? widget,
  }) {
    return link?.call(title, url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? title, String? description)? text,
    TResult Function(ViewerGlyphUnion glyph, String title)? glyph,
    TResult Function(String title, String url)? link,
    TResult Function(ViewerImageCollectionItemStyle style, String url,
            String? title, String? description, double? width, double? height)?
        image,
    TResult Function(Widget widget)? widget,
    required TResult orElse(),
  }) {
    if (link != null) {
      return link(title, url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerTextCollectionItem value) text,
    required TResult Function(ViewerGlyphCollectionItem value) glyph,
    required TResult Function(ViewerLinkCollectionItem value) link,
    required TResult Function(ViewerImageCollectionItem value) image,
    required TResult Function(ViewerWidgetCollectionItem value) widget,
  }) {
    return link(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerTextCollectionItem value)? text,
    TResult Function(ViewerGlyphCollectionItem value)? glyph,
    TResult Function(ViewerLinkCollectionItem value)? link,
    TResult Function(ViewerImageCollectionItem value)? image,
    TResult Function(ViewerWidgetCollectionItem value)? widget,
  }) {
    return link?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerTextCollectionItem value)? text,
    TResult Function(ViewerGlyphCollectionItem value)? glyph,
    TResult Function(ViewerLinkCollectionItem value)? link,
    TResult Function(ViewerImageCollectionItem value)? image,
    TResult Function(ViewerWidgetCollectionItem value)? widget,
    required TResult orElse(),
  }) {
    if (link != null) {
      return link(this);
    }
    return orElse();
  }
}

abstract class ViewerLinkCollectionItem extends ViewerCollectionItemUnion {
  const factory ViewerLinkCollectionItem(
      {required String title,
      required String url}) = _$ViewerLinkCollectionItem;
  const ViewerLinkCollectionItem._() : super._();

  String get title;
  String get url;
  @JsonKey(ignore: true)
  $ViewerLinkCollectionItemCopyWith<ViewerLinkCollectionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerImageCollectionItemCopyWith<$Res> {
  factory $ViewerImageCollectionItemCopyWith(ViewerImageCollectionItem value,
          $Res Function(ViewerImageCollectionItem) then) =
      _$ViewerImageCollectionItemCopyWithImpl<$Res>;
  $Res call(
      {ViewerImageCollectionItemStyle style,
      String url,
      String? title,
      String? description,
      double? width,
      double? height});
}

/// @nodoc
class _$ViewerImageCollectionItemCopyWithImpl<$Res>
    extends _$ViewerCollectionItemUnionCopyWithImpl<$Res>
    implements $ViewerImageCollectionItemCopyWith<$Res> {
  _$ViewerImageCollectionItemCopyWithImpl(ViewerImageCollectionItem _value,
      $Res Function(ViewerImageCollectionItem) _then)
      : super(_value, (v) => _then(v as ViewerImageCollectionItem));

  @override
  ViewerImageCollectionItem get _value =>
      super._value as ViewerImageCollectionItem;

  @override
  $Res call({
    Object? style = freezed,
    Object? url = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(ViewerImageCollectionItem(
      style: style == freezed
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as ViewerImageCollectionItemStyle,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$ViewerImageCollectionItem extends ViewerImageCollectionItem
    with DiagnosticableTreeMixin {
  const _$ViewerImageCollectionItem(
      {required this.style,
      required this.url,
      this.title,
      this.description,
      this.width,
      this.height})
      : super._();

  @override
  final ViewerImageCollectionItemStyle style;
  @override
  final String url;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final double? width;
  @override
  final double? height;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerCollectionItemUnion.image(style: $style, url: $url, title: $title, description: $description, width: $width, height: $height)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerCollectionItemUnion.image'))
      ..add(DiagnosticsProperty('style', style))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('width', width))
      ..add(DiagnosticsProperty('height', height));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewerImageCollectionItem &&
            const DeepCollectionEquality().equals(other.style, style) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.width, width) &&
            const DeepCollectionEquality().equals(other.height, height));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(style),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(width),
      const DeepCollectionEquality().hash(height));

  @JsonKey(ignore: true)
  @override
  $ViewerImageCollectionItemCopyWith<ViewerImageCollectionItem> get copyWith =>
      _$ViewerImageCollectionItemCopyWithImpl<ViewerImageCollectionItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? title, String? description) text,
    required TResult Function(ViewerGlyphUnion glyph, String title) glyph,
    required TResult Function(String title, String url) link,
    required TResult Function(ViewerImageCollectionItemStyle style, String url,
            String? title, String? description, double? width, double? height)
        image,
    required TResult Function(Widget widget) widget,
  }) {
    return image(style, url, title, description, width, height);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? title, String? description)? text,
    TResult Function(ViewerGlyphUnion glyph, String title)? glyph,
    TResult Function(String title, String url)? link,
    TResult Function(ViewerImageCollectionItemStyle style, String url,
            String? title, String? description, double? width, double? height)?
        image,
    TResult Function(Widget widget)? widget,
  }) {
    return image?.call(style, url, title, description, width, height);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? title, String? description)? text,
    TResult Function(ViewerGlyphUnion glyph, String title)? glyph,
    TResult Function(String title, String url)? link,
    TResult Function(ViewerImageCollectionItemStyle style, String url,
            String? title, String? description, double? width, double? height)?
        image,
    TResult Function(Widget widget)? widget,
    required TResult orElse(),
  }) {
    if (image != null) {
      return image(style, url, title, description, width, height);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerTextCollectionItem value) text,
    required TResult Function(ViewerGlyphCollectionItem value) glyph,
    required TResult Function(ViewerLinkCollectionItem value) link,
    required TResult Function(ViewerImageCollectionItem value) image,
    required TResult Function(ViewerWidgetCollectionItem value) widget,
  }) {
    return image(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerTextCollectionItem value)? text,
    TResult Function(ViewerGlyphCollectionItem value)? glyph,
    TResult Function(ViewerLinkCollectionItem value)? link,
    TResult Function(ViewerImageCollectionItem value)? image,
    TResult Function(ViewerWidgetCollectionItem value)? widget,
  }) {
    return image?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerTextCollectionItem value)? text,
    TResult Function(ViewerGlyphCollectionItem value)? glyph,
    TResult Function(ViewerLinkCollectionItem value)? link,
    TResult Function(ViewerImageCollectionItem value)? image,
    TResult Function(ViewerWidgetCollectionItem value)? widget,
    required TResult orElse(),
  }) {
    if (image != null) {
      return image(this);
    }
    return orElse();
  }
}

abstract class ViewerImageCollectionItem extends ViewerCollectionItemUnion {
  const factory ViewerImageCollectionItem(
      {required ViewerImageCollectionItemStyle style,
      required String url,
      String? title,
      String? description,
      double? width,
      double? height}) = _$ViewerImageCollectionItem;
  const ViewerImageCollectionItem._() : super._();

  ViewerImageCollectionItemStyle get style;
  String get url;
  String? get title;
  String? get description;
  double? get width;
  double? get height;
  @JsonKey(ignore: true)
  $ViewerImageCollectionItemCopyWith<ViewerImageCollectionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerWidgetCollectionItemCopyWith<$Res> {
  factory $ViewerWidgetCollectionItemCopyWith(ViewerWidgetCollectionItem value,
          $Res Function(ViewerWidgetCollectionItem) then) =
      _$ViewerWidgetCollectionItemCopyWithImpl<$Res>;
  $Res call({Widget widget});
}

/// @nodoc
class _$ViewerWidgetCollectionItemCopyWithImpl<$Res>
    extends _$ViewerCollectionItemUnionCopyWithImpl<$Res>
    implements $ViewerWidgetCollectionItemCopyWith<$Res> {
  _$ViewerWidgetCollectionItemCopyWithImpl(ViewerWidgetCollectionItem _value,
      $Res Function(ViewerWidgetCollectionItem) _then)
      : super(_value, (v) => _then(v as ViewerWidgetCollectionItem));

  @override
  ViewerWidgetCollectionItem get _value =>
      super._value as ViewerWidgetCollectionItem;

  @override
  $Res call({
    Object? widget = freezed,
  }) {
    return _then(ViewerWidgetCollectionItem(
      widget: widget == freezed
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as Widget,
    ));
  }
}

/// @nodoc

class _$ViewerWidgetCollectionItem extends ViewerWidgetCollectionItem
    with DiagnosticableTreeMixin {
  const _$ViewerWidgetCollectionItem({required this.widget}) : super._();

  @override
  final Widget widget;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerCollectionItemUnion.widget(widget: $widget)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerCollectionItemUnion.widget'))
      ..add(DiagnosticsProperty('widget', widget));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewerWidgetCollectionItem &&
            const DeepCollectionEquality().equals(other.widget, widget));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(widget));

  @JsonKey(ignore: true)
  @override
  $ViewerWidgetCollectionItemCopyWith<ViewerWidgetCollectionItem>
      get copyWith =>
          _$ViewerWidgetCollectionItemCopyWithImpl<ViewerWidgetCollectionItem>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? title, String? description) text,
    required TResult Function(ViewerGlyphUnion glyph, String title) glyph,
    required TResult Function(String title, String url) link,
    required TResult Function(ViewerImageCollectionItemStyle style, String url,
            String? title, String? description, double? width, double? height)
        image,
    required TResult Function(Widget widget) widget,
  }) {
    return widget(this.widget);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? title, String? description)? text,
    TResult Function(ViewerGlyphUnion glyph, String title)? glyph,
    TResult Function(String title, String url)? link,
    TResult Function(ViewerImageCollectionItemStyle style, String url,
            String? title, String? description, double? width, double? height)?
        image,
    TResult Function(Widget widget)? widget,
  }) {
    return widget?.call(this.widget);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? title, String? description)? text,
    TResult Function(ViewerGlyphUnion glyph, String title)? glyph,
    TResult Function(String title, String url)? link,
    TResult Function(ViewerImageCollectionItemStyle style, String url,
            String? title, String? description, double? width, double? height)?
        image,
    TResult Function(Widget widget)? widget,
    required TResult orElse(),
  }) {
    if (widget != null) {
      return widget(this.widget);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerTextCollectionItem value) text,
    required TResult Function(ViewerGlyphCollectionItem value) glyph,
    required TResult Function(ViewerLinkCollectionItem value) link,
    required TResult Function(ViewerImageCollectionItem value) image,
    required TResult Function(ViewerWidgetCollectionItem value) widget,
  }) {
    return widget(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerTextCollectionItem value)? text,
    TResult Function(ViewerGlyphCollectionItem value)? glyph,
    TResult Function(ViewerLinkCollectionItem value)? link,
    TResult Function(ViewerImageCollectionItem value)? image,
    TResult Function(ViewerWidgetCollectionItem value)? widget,
  }) {
    return widget?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerTextCollectionItem value)? text,
    TResult Function(ViewerGlyphCollectionItem value)? glyph,
    TResult Function(ViewerLinkCollectionItem value)? link,
    TResult Function(ViewerImageCollectionItem value)? image,
    TResult Function(ViewerWidgetCollectionItem value)? widget,
    required TResult orElse(),
  }) {
    if (widget != null) {
      return widget(this);
    }
    return orElse();
  }
}

abstract class ViewerWidgetCollectionItem extends ViewerCollectionItemUnion {
  const factory ViewerWidgetCollectionItem({required Widget widget}) =
      _$ViewerWidgetCollectionItem;
  const ViewerWidgetCollectionItem._() : super._();

  Widget get widget;
  @JsonKey(ignore: true)
  $ViewerWidgetCollectionItemCopyWith<ViewerWidgetCollectionItem>
      get copyWith => throw _privateConstructorUsedError;
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

class _$_ViewerCatalogLink extends _ViewerCatalogLink
    with DiagnosticableTreeMixin {
  const _$_ViewerCatalogLink({required this.title, required this.url})
      : super._();

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

abstract class _ViewerCatalogLink extends ViewerCatalogLink {
  const factory _ViewerCatalogLink(
      {required String title, required String url}) = _$_ViewerCatalogLink;
  const _ViewerCatalogLink._() : super._();

  @override
  String get title;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$ViewerCatalogLinkCopyWith<_ViewerCatalogLink> get copyWith =>
      throw _privateConstructorUsedError;
}
