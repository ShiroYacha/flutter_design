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
      String? description,
      List<String> tags = const [],
      List<ViewerSectionUnion> sections = const []}) {
    return ViewerDocumentPage(
      id: id,
      namespace: namespace,
      title: title,
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
  final String? description;
  @JsonKey()
  @override
  final List<String> tags;
  @JsonKey()
  @override
  final List<ViewerSectionUnion> sections;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerPageUnion.document(id: $id, namespace: $namespace, title: $title, description: $description, tags: $tags, sections: $sections)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerPageUnion.document'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('namespace', namespace))
      ..add(DiagnosticsProperty('title', title))
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
            String? description,
            List<String> tags,
            List<ViewerSectionUnion> sections)
        document,
  }) {
    return document(id, namespace, title, description, tags, sections);
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
            String? description,
            List<String> tags,
            List<ViewerSectionUnion> sections)?
        document,
  }) {
    return document?.call(id, namespace, title, description, tags, sections);
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
            String? description,
            List<String> tags,
            List<ViewerSectionUnion> sections)?
        document,
    required TResult orElse(),
  }) {
    if (document != null) {
      return document(id, namespace, title, description, tags, sections);
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
      required WidgetBuilder builder,
      required ViewerSourceCode sourceCode}) {
    return ViewerComponentSection(
      id: id,
      title: title,
      description: description,
      builder: builder,
      sourceCode: sourceCode,
    );
  }

  ViewerExamplesSection examples(
      {required String id,
      required String title,
      String? description,
      List<ViewerExampleUnion> examples = const []}) {
    return ViewerExamplesSection(
      id: id,
      title: title,
      description: description,
      examples: examples,
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
            WidgetBuilder builder, ViewerSourceCode sourceCode)
        component,
    required TResult Function(String id, String title, String? description,
            List<ViewerExampleUnion> examples)
        examples,
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
            WidgetBuilder builder, ViewerSourceCode sourceCode)?
        component,
    TResult Function(String id, String title, String? description,
            List<ViewerExampleUnion> examples)?
        examples,
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
            WidgetBuilder builder, ViewerSourceCode sourceCode)?
        component,
    TResult Function(String id, String title, String? description,
            List<ViewerExampleUnion> examples)?
        examples,
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
    required TResult Function(ViewerExamplesSection value) examples,
    required TResult Function(ViewerApiDocsSection value) apiDocs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerParagraphSection value)? paragraph,
    TResult Function(ViewerComponentSection value)? component,
    TResult Function(ViewerExamplesSection value)? examples,
    TResult Function(ViewerApiDocsSection value)? apiDocs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerParagraphSection value)? paragraph,
    TResult Function(ViewerComponentSection value)? component,
    TResult Function(ViewerExamplesSection value)? examples,
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
            WidgetBuilder builder, ViewerSourceCode sourceCode)
        component,
    required TResult Function(String id, String title, String? description,
            List<ViewerExampleUnion> examples)
        examples,
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
            WidgetBuilder builder, ViewerSourceCode sourceCode)?
        component,
    TResult Function(String id, String title, String? description,
            List<ViewerExampleUnion> examples)?
        examples,
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
            WidgetBuilder builder, ViewerSourceCode sourceCode)?
        component,
    TResult Function(String id, String title, String? description,
            List<ViewerExampleUnion> examples)?
        examples,
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
    required TResult Function(ViewerExamplesSection value) examples,
    required TResult Function(ViewerApiDocsSection value) apiDocs,
  }) {
    return paragraph(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerParagraphSection value)? paragraph,
    TResult Function(ViewerComponentSection value)? component,
    TResult Function(ViewerExamplesSection value)? examples,
    TResult Function(ViewerApiDocsSection value)? apiDocs,
  }) {
    return paragraph?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerParagraphSection value)? paragraph,
    TResult Function(ViewerComponentSection value)? component,
    TResult Function(ViewerExamplesSection value)? examples,
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
      WidgetBuilder builder,
      ViewerSourceCode sourceCode});

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
              as WidgetBuilder,
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
  final WidgetBuilder builder;
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
            (identical(other.builder, builder) || other.builder == builder) &&
            const DeepCollectionEquality()
                .equals(other.sourceCode, sourceCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      builder,
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
            WidgetBuilder builder, ViewerSourceCode sourceCode)
        component,
    required TResult Function(String id, String title, String? description,
            List<ViewerExampleUnion> examples)
        examples,
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
            WidgetBuilder builder, ViewerSourceCode sourceCode)?
        component,
    TResult Function(String id, String title, String? description,
            List<ViewerExampleUnion> examples)?
        examples,
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
            WidgetBuilder builder, ViewerSourceCode sourceCode)?
        component,
    TResult Function(String id, String title, String? description,
            List<ViewerExampleUnion> examples)?
        examples,
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
    required TResult Function(ViewerExamplesSection value) examples,
    required TResult Function(ViewerApiDocsSection value) apiDocs,
  }) {
    return component(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerParagraphSection value)? paragraph,
    TResult Function(ViewerComponentSection value)? component,
    TResult Function(ViewerExamplesSection value)? examples,
    TResult Function(ViewerApiDocsSection value)? apiDocs,
  }) {
    return component?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerParagraphSection value)? paragraph,
    TResult Function(ViewerComponentSection value)? component,
    TResult Function(ViewerExamplesSection value)? examples,
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
      required WidgetBuilder builder,
      required ViewerSourceCode sourceCode}) = _$ViewerComponentSection;
  const ViewerComponentSection._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  WidgetBuilder get builder;
  ViewerSourceCode get sourceCode;
  @override
  @JsonKey(ignore: true)
  $ViewerComponentSectionCopyWith<ViewerComponentSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewerExamplesSectionCopyWith<$Res>
    implements $ViewerSectionUnionCopyWith<$Res> {
  factory $ViewerExamplesSectionCopyWith(ViewerExamplesSection value,
          $Res Function(ViewerExamplesSection) then) =
      _$ViewerExamplesSectionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      String? description,
      List<ViewerExampleUnion> examples});
}

/// @nodoc
class _$ViewerExamplesSectionCopyWithImpl<$Res>
    extends _$ViewerSectionUnionCopyWithImpl<$Res>
    implements $ViewerExamplesSectionCopyWith<$Res> {
  _$ViewerExamplesSectionCopyWithImpl(
      ViewerExamplesSection _value, $Res Function(ViewerExamplesSection) _then)
      : super(_value, (v) => _then(v as ViewerExamplesSection));

  @override
  ViewerExamplesSection get _value => super._value as ViewerExamplesSection;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? examples = freezed,
  }) {
    return _then(ViewerExamplesSection(
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
      examples: examples == freezed
          ? _value.examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<ViewerExampleUnion>,
    ));
  }
}

/// @nodoc

class _$ViewerExamplesSection extends ViewerExamplesSection
    with DiagnosticableTreeMixin {
  const _$ViewerExamplesSection(
      {required this.id,
      required this.title,
      this.description,
      this.examples = const []})
      : super._();

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @JsonKey()
  @override
  final List<ViewerExampleUnion> examples;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViewerSectionUnion.examples(id: $id, title: $title, description: $description, examples: $examples)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViewerSectionUnion.examples'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('examples', examples));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewerExamplesSection &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.examples, examples));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(examples));

  @JsonKey(ignore: true)
  @override
  $ViewerExamplesSectionCopyWith<ViewerExamplesSection> get copyWith =>
      _$ViewerExamplesSectionCopyWithImpl<ViewerExamplesSection>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String title, String? description,
            List<List<ViewerCollectionItemUnion>> contents)
        paragraph,
    required TResult Function(String id, String title, String? description,
            WidgetBuilder builder, ViewerSourceCode sourceCode)
        component,
    required TResult Function(String id, String title, String? description,
            List<ViewerExampleUnion> examples)
        examples,
    required TResult Function(String id, String title, String? description,
            List<ClassMemberElement> items)
        apiDocs,
  }) {
    return examples(id, title, description, this.examples);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id, String title, String? description,
            List<List<ViewerCollectionItemUnion>> contents)?
        paragraph,
    TResult Function(String id, String title, String? description,
            WidgetBuilder builder, ViewerSourceCode sourceCode)?
        component,
    TResult Function(String id, String title, String? description,
            List<ViewerExampleUnion> examples)?
        examples,
    TResult Function(String id, String title, String? description,
            List<ClassMemberElement> items)?
        apiDocs,
  }) {
    return examples?.call(id, title, description, this.examples);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String title, String? description,
            List<List<ViewerCollectionItemUnion>> contents)?
        paragraph,
    TResult Function(String id, String title, String? description,
            WidgetBuilder builder, ViewerSourceCode sourceCode)?
        component,
    TResult Function(String id, String title, String? description,
            List<ViewerExampleUnion> examples)?
        examples,
    TResult Function(String id, String title, String? description,
            List<ClassMemberElement> items)?
        apiDocs,
    required TResult orElse(),
  }) {
    if (examples != null) {
      return examples(id, title, description, this.examples);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ViewerParagraphSection value) paragraph,
    required TResult Function(ViewerComponentSection value) component,
    required TResult Function(ViewerExamplesSection value) examples,
    required TResult Function(ViewerApiDocsSection value) apiDocs,
  }) {
    return examples(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerParagraphSection value)? paragraph,
    TResult Function(ViewerComponentSection value)? component,
    TResult Function(ViewerExamplesSection value)? examples,
    TResult Function(ViewerApiDocsSection value)? apiDocs,
  }) {
    return examples?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerParagraphSection value)? paragraph,
    TResult Function(ViewerComponentSection value)? component,
    TResult Function(ViewerExamplesSection value)? examples,
    TResult Function(ViewerApiDocsSection value)? apiDocs,
    required TResult orElse(),
  }) {
    if (examples != null) {
      return examples(this);
    }
    return orElse();
  }
}

abstract class ViewerExamplesSection extends ViewerSectionUnion {
  const factory ViewerExamplesSection(
      {required String id,
      required String title,
      String? description,
      List<ViewerExampleUnion> examples}) = _$ViewerExamplesSection;
  const ViewerExamplesSection._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  List<ViewerExampleUnion> get examples;
  @override
  @JsonKey(ignore: true)
  $ViewerExamplesSectionCopyWith<ViewerExamplesSection> get copyWith =>
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
            WidgetBuilder builder, ViewerSourceCode sourceCode)
        component,
    required TResult Function(String id, String title, String? description,
            List<ViewerExampleUnion> examples)
        examples,
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
            WidgetBuilder builder, ViewerSourceCode sourceCode)?
        component,
    TResult Function(String id, String title, String? description,
            List<ViewerExampleUnion> examples)?
        examples,
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
            WidgetBuilder builder, ViewerSourceCode sourceCode)?
        component,
    TResult Function(String id, String title, String? description,
            List<ViewerExampleUnion> examples)?
        examples,
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
    required TResult Function(ViewerExamplesSection value) examples,
    required TResult Function(ViewerApiDocsSection value) apiDocs,
  }) {
    return apiDocs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ViewerParagraphSection value)? paragraph,
    TResult Function(ViewerComponentSection value)? component,
    TResult Function(ViewerExamplesSection value)? examples,
    TResult Function(ViewerApiDocsSection value)? apiDocs,
  }) {
    return apiDocs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ViewerParagraphSection value)? paragraph,
    TResult Function(ViewerComponentSection value)? component,
    TResult Function(ViewerExamplesSection value)? examples,
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
