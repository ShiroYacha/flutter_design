// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'design.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ThemeElementTearOff {
  const _$ThemeElementTearOff();

  _ThemeElement call({required String name}) {
    return _ThemeElement(
      name: name,
    );
  }
}

/// @nodoc
const $ThemeElement = _$ThemeElementTearOff();

/// @nodoc
mixin _$ThemeElement {
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeElementCopyWith<ThemeElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeElementCopyWith<$Res> {
  factory $ThemeElementCopyWith(
          ThemeElement value, $Res Function(ThemeElement) then) =
      _$ThemeElementCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$ThemeElementCopyWithImpl<$Res> implements $ThemeElementCopyWith<$Res> {
  _$ThemeElementCopyWithImpl(this._value, this._then);

  final ThemeElement _value;
  // ignore: unused_field
  final $Res Function(ThemeElement) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ThemeElementCopyWith<$Res>
    implements $ThemeElementCopyWith<$Res> {
  factory _$ThemeElementCopyWith(
          _ThemeElement value, $Res Function(_ThemeElement) then) =
      __$ThemeElementCopyWithImpl<$Res>;
  @override
  $Res call({String name});
}

/// @nodoc
class __$ThemeElementCopyWithImpl<$Res> extends _$ThemeElementCopyWithImpl<$Res>
    implements _$ThemeElementCopyWith<$Res> {
  __$ThemeElementCopyWithImpl(
      _ThemeElement _value, $Res Function(_ThemeElement) _then)
      : super(_value, (v) => _then(v as _ThemeElement));

  @override
  _ThemeElement get _value => super._value as _ThemeElement;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_ThemeElement(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ThemeElement implements _ThemeElement {
  const _$_ThemeElement({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'ThemeElement(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ThemeElement &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$ThemeElementCopyWith<_ThemeElement> get copyWith =>
      __$ThemeElementCopyWithImpl<_ThemeElement>(this, _$identity);
}

abstract class _ThemeElement implements ThemeElement {
  const factory _ThemeElement({required String name}) = _$_ThemeElement;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ThemeElementCopyWith<_ThemeElement> get copyWith =>
      throw _privateConstructorUsedError;
}
