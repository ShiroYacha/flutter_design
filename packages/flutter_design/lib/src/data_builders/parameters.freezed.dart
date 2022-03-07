// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DesignParamStringLoremTearOff {
  const _$DesignParamStringLoremTearOff();

  _DesignParamStringLorem call({int length = 10, int min = 0, int max = 100}) {
    return _DesignParamStringLorem(
      length: length,
      min: min,
      max: max,
    );
  }
}

/// @nodoc
const $DesignParamStringLorem = _$DesignParamStringLoremTearOff();

/// @nodoc
mixin _$DesignParamStringLorem {
  int get length => throw _privateConstructorUsedError;
  int get min => throw _privateConstructorUsedError;
  int get max => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DesignParamStringLoremCopyWith<DesignParamStringLorem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DesignParamStringLoremCopyWith<$Res> {
  factory $DesignParamStringLoremCopyWith(DesignParamStringLorem value,
          $Res Function(DesignParamStringLorem) then) =
      _$DesignParamStringLoremCopyWithImpl<$Res>;
  $Res call({int length, int min, int max});
}

/// @nodoc
class _$DesignParamStringLoremCopyWithImpl<$Res>
    implements $DesignParamStringLoremCopyWith<$Res> {
  _$DesignParamStringLoremCopyWithImpl(this._value, this._then);

  final DesignParamStringLorem _value;
  // ignore: unused_field
  final $Res Function(DesignParamStringLorem) _then;

  @override
  $Res call({
    Object? length = freezed,
    Object? min = freezed,
    Object? max = freezed,
  }) {
    return _then(_value.copyWith(
      length: length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      min: min == freezed
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: max == freezed
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$DesignParamStringLoremCopyWith<$Res>
    implements $DesignParamStringLoremCopyWith<$Res> {
  factory _$DesignParamStringLoremCopyWith(_DesignParamStringLorem value,
          $Res Function(_DesignParamStringLorem) then) =
      __$DesignParamStringLoremCopyWithImpl<$Res>;
  @override
  $Res call({int length, int min, int max});
}

/// @nodoc
class __$DesignParamStringLoremCopyWithImpl<$Res>
    extends _$DesignParamStringLoremCopyWithImpl<$Res>
    implements _$DesignParamStringLoremCopyWith<$Res> {
  __$DesignParamStringLoremCopyWithImpl(_DesignParamStringLorem _value,
      $Res Function(_DesignParamStringLorem) _then)
      : super(_value, (v) => _then(v as _DesignParamStringLorem));

  @override
  _DesignParamStringLorem get _value => super._value as _DesignParamStringLorem;

  @override
  $Res call({
    Object? length = freezed,
    Object? min = freezed,
    Object? max = freezed,
  }) {
    return _then(_DesignParamStringLorem(
      length: length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      min: min == freezed
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: max == freezed
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DesignParamStringLorem
    with DiagnosticableTreeMixin
    implements _DesignParamStringLorem {
  const _$_DesignParamStringLorem(
      {this.length = 10, this.min = 0, this.max = 100});

  @JsonKey()
  @override
  final int length;
  @JsonKey()
  @override
  final int min;
  @JsonKey()
  @override
  final int max;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DesignParamStringLorem(length: $length, min: $min, max: $max)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DesignParamStringLorem'))
      ..add(DiagnosticsProperty('length', length))
      ..add(DiagnosticsProperty('min', min))
      ..add(DiagnosticsProperty('max', max));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DesignParamStringLorem &&
            const DeepCollectionEquality().equals(other.length, length) &&
            const DeepCollectionEquality().equals(other.min, min) &&
            const DeepCollectionEquality().equals(other.max, max));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(length),
      const DeepCollectionEquality().hash(min),
      const DeepCollectionEquality().hash(max));

  @JsonKey(ignore: true)
  @override
  _$DesignParamStringLoremCopyWith<_DesignParamStringLorem> get copyWith =>
      __$DesignParamStringLoremCopyWithImpl<_DesignParamStringLorem>(
          this, _$identity);
}

abstract class _DesignParamStringLorem implements DesignParamStringLorem {
  const factory _DesignParamStringLorem({int length, int min, int max}) =
      _$_DesignParamStringLorem;

  @override
  int get length;
  @override
  int get min;
  @override
  int get max;
  @override
  @JsonKey(ignore: true)
  _$DesignParamStringLoremCopyWith<_DesignParamStringLorem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$DesignParamWidgetPlaceholderTearOff {
  const _$DesignParamWidgetPlaceholderTearOff();

  _DesignParamWidgetPlaceholder call(
      {Color color = Colors.amber, Size size = const Size(100, 100)}) {
    return _DesignParamWidgetPlaceholder(
      color: color,
      size: size,
    );
  }
}

/// @nodoc
const $DesignParamWidgetPlaceholder = _$DesignParamWidgetPlaceholderTearOff();

/// @nodoc
mixin _$DesignParamWidgetPlaceholder {
  Color get color => throw _privateConstructorUsedError;
  Size get size => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DesignParamWidgetPlaceholderCopyWith<DesignParamWidgetPlaceholder>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DesignParamWidgetPlaceholderCopyWith<$Res> {
  factory $DesignParamWidgetPlaceholderCopyWith(
          DesignParamWidgetPlaceholder value,
          $Res Function(DesignParamWidgetPlaceholder) then) =
      _$DesignParamWidgetPlaceholderCopyWithImpl<$Res>;
  $Res call({Color color, Size size});
}

/// @nodoc
class _$DesignParamWidgetPlaceholderCopyWithImpl<$Res>
    implements $DesignParamWidgetPlaceholderCopyWith<$Res> {
  _$DesignParamWidgetPlaceholderCopyWithImpl(this._value, this._then);

  final DesignParamWidgetPlaceholder _value;
  // ignore: unused_field
  final $Res Function(DesignParamWidgetPlaceholder) _then;

  @override
  $Res call({
    Object? color = freezed,
    Object? size = freezed,
  }) {
    return _then(_value.copyWith(
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
    ));
  }
}

/// @nodoc
abstract class _$DesignParamWidgetPlaceholderCopyWith<$Res>
    implements $DesignParamWidgetPlaceholderCopyWith<$Res> {
  factory _$DesignParamWidgetPlaceholderCopyWith(
          _DesignParamWidgetPlaceholder value,
          $Res Function(_DesignParamWidgetPlaceholder) then) =
      __$DesignParamWidgetPlaceholderCopyWithImpl<$Res>;
  @override
  $Res call({Color color, Size size});
}

/// @nodoc
class __$DesignParamWidgetPlaceholderCopyWithImpl<$Res>
    extends _$DesignParamWidgetPlaceholderCopyWithImpl<$Res>
    implements _$DesignParamWidgetPlaceholderCopyWith<$Res> {
  __$DesignParamWidgetPlaceholderCopyWithImpl(
      _DesignParamWidgetPlaceholder _value,
      $Res Function(_DesignParamWidgetPlaceholder) _then)
      : super(_value, (v) => _then(v as _DesignParamWidgetPlaceholder));

  @override
  _DesignParamWidgetPlaceholder get _value =>
      super._value as _DesignParamWidgetPlaceholder;

  @override
  $Res call({
    Object? color = freezed,
    Object? size = freezed,
  }) {
    return _then(_DesignParamWidgetPlaceholder(
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
    ));
  }
}

/// @nodoc

class _$_DesignParamWidgetPlaceholder
    with DiagnosticableTreeMixin
    implements _DesignParamWidgetPlaceholder {
  const _$_DesignParamWidgetPlaceholder(
      {this.color = Colors.amber, this.size = const Size(100, 100)});

  @JsonKey()
  @override
  final Color color;
  @JsonKey()
  @override
  final Size size;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DesignParamWidgetPlaceholder(color: $color, size: $size)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DesignParamWidgetPlaceholder'))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('size', size));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DesignParamWidgetPlaceholder &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other.size, size));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(size));

  @JsonKey(ignore: true)
  @override
  _$DesignParamWidgetPlaceholderCopyWith<_DesignParamWidgetPlaceholder>
      get copyWith => __$DesignParamWidgetPlaceholderCopyWithImpl<
          _DesignParamWidgetPlaceholder>(this, _$identity);
}

abstract class _DesignParamWidgetPlaceholder
    implements DesignParamWidgetPlaceholder {
  const factory _DesignParamWidgetPlaceholder({Color color, Size size}) =
      _$_DesignParamWidgetPlaceholder;

  @override
  Color get color;
  @override
  Size get size;
  @override
  @JsonKey(ignore: true)
  _$DesignParamWidgetPlaceholderCopyWith<_DesignParamWidgetPlaceholder>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$DesignParamWidgetPlaceholderListTearOff {
  const _$DesignParamWidgetPlaceholderListTearOff();

  _DesignParamWidgetPlaceholderList call(
      {Size size = const Size(100, 100), int count = 3}) {
    return _DesignParamWidgetPlaceholderList(
      size: size,
      count: count,
    );
  }
}

/// @nodoc
const $DesignParamWidgetPlaceholderList =
    _$DesignParamWidgetPlaceholderListTearOff();

/// @nodoc
mixin _$DesignParamWidgetPlaceholderList {
  Size get size => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DesignParamWidgetPlaceholderListCopyWith<DesignParamWidgetPlaceholderList>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DesignParamWidgetPlaceholderListCopyWith<$Res> {
  factory $DesignParamWidgetPlaceholderListCopyWith(
          DesignParamWidgetPlaceholderList value,
          $Res Function(DesignParamWidgetPlaceholderList) then) =
      _$DesignParamWidgetPlaceholderListCopyWithImpl<$Res>;
  $Res call({Size size, int count});
}

/// @nodoc
class _$DesignParamWidgetPlaceholderListCopyWithImpl<$Res>
    implements $DesignParamWidgetPlaceholderListCopyWith<$Res> {
  _$DesignParamWidgetPlaceholderListCopyWithImpl(this._value, this._then);

  final DesignParamWidgetPlaceholderList _value;
  // ignore: unused_field
  final $Res Function(DesignParamWidgetPlaceholderList) _then;

  @override
  $Res call({
    Object? size = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$DesignParamWidgetPlaceholderListCopyWith<$Res>
    implements $DesignParamWidgetPlaceholderListCopyWith<$Res> {
  factory _$DesignParamWidgetPlaceholderListCopyWith(
          _DesignParamWidgetPlaceholderList value,
          $Res Function(_DesignParamWidgetPlaceholderList) then) =
      __$DesignParamWidgetPlaceholderListCopyWithImpl<$Res>;
  @override
  $Res call({Size size, int count});
}

/// @nodoc
class __$DesignParamWidgetPlaceholderListCopyWithImpl<$Res>
    extends _$DesignParamWidgetPlaceholderListCopyWithImpl<$Res>
    implements _$DesignParamWidgetPlaceholderListCopyWith<$Res> {
  __$DesignParamWidgetPlaceholderListCopyWithImpl(
      _DesignParamWidgetPlaceholderList _value,
      $Res Function(_DesignParamWidgetPlaceholderList) _then)
      : super(_value, (v) => _then(v as _DesignParamWidgetPlaceholderList));

  @override
  _DesignParamWidgetPlaceholderList get _value =>
      super._value as _DesignParamWidgetPlaceholderList;

  @override
  $Res call({
    Object? size = freezed,
    Object? count = freezed,
  }) {
    return _then(_DesignParamWidgetPlaceholderList(
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DesignParamWidgetPlaceholderList
    with DiagnosticableTreeMixin
    implements _DesignParamWidgetPlaceholderList {
  const _$_DesignParamWidgetPlaceholderList(
      {this.size = const Size(100, 100), this.count = 3});

  @JsonKey()
  @override
  final Size size;
  @JsonKey()
  @override
  final int count;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DesignParamWidgetPlaceholderList(size: $size, count: $count)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DesignParamWidgetPlaceholderList'))
      ..add(DiagnosticsProperty('size', size))
      ..add(DiagnosticsProperty('count', count));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DesignParamWidgetPlaceholderList &&
            const DeepCollectionEquality().equals(other.size, size) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$DesignParamWidgetPlaceholderListCopyWith<_DesignParamWidgetPlaceholderList>
      get copyWith => __$DesignParamWidgetPlaceholderListCopyWithImpl<
          _DesignParamWidgetPlaceholderList>(this, _$identity);
}

abstract class _DesignParamWidgetPlaceholderList
    implements DesignParamWidgetPlaceholderList {
  const factory _DesignParamWidgetPlaceholderList({Size size, int count}) =
      _$_DesignParamWidgetPlaceholderList;

  @override
  Size get size;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$DesignParamWidgetPlaceholderListCopyWith<_DesignParamWidgetPlaceholderList>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$DesignParamPublisherTearOff {
  const _$DesignParamPublisherTearOff();

  _DesignParamPublisher call({String key = 'default'}) {
    return _DesignParamPublisher(
      key: key,
    );
  }
}

/// @nodoc
const $DesignParamPublisher = _$DesignParamPublisherTearOff();

/// @nodoc
mixin _$DesignParamPublisher {
  String get key => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DesignParamPublisherCopyWith<DesignParamPublisher> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DesignParamPublisherCopyWith<$Res> {
  factory $DesignParamPublisherCopyWith(DesignParamPublisher value,
          $Res Function(DesignParamPublisher) then) =
      _$DesignParamPublisherCopyWithImpl<$Res>;
  $Res call({String key});
}

/// @nodoc
class _$DesignParamPublisherCopyWithImpl<$Res>
    implements $DesignParamPublisherCopyWith<$Res> {
  _$DesignParamPublisherCopyWithImpl(this._value, this._then);

  final DesignParamPublisher _value;
  // ignore: unused_field
  final $Res Function(DesignParamPublisher) _then;

  @override
  $Res call({
    Object? key = freezed,
  }) {
    return _then(_value.copyWith(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DesignParamPublisherCopyWith<$Res>
    implements $DesignParamPublisherCopyWith<$Res> {
  factory _$DesignParamPublisherCopyWith(_DesignParamPublisher value,
          $Res Function(_DesignParamPublisher) then) =
      __$DesignParamPublisherCopyWithImpl<$Res>;
  @override
  $Res call({String key});
}

/// @nodoc
class __$DesignParamPublisherCopyWithImpl<$Res>
    extends _$DesignParamPublisherCopyWithImpl<$Res>
    implements _$DesignParamPublisherCopyWith<$Res> {
  __$DesignParamPublisherCopyWithImpl(
      _DesignParamPublisher _value, $Res Function(_DesignParamPublisher) _then)
      : super(_value, (v) => _then(v as _DesignParamPublisher));

  @override
  _DesignParamPublisher get _value => super._value as _DesignParamPublisher;

  @override
  $Res call({
    Object? key = freezed,
  }) {
    return _then(_DesignParamPublisher(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DesignParamPublisher
    with DiagnosticableTreeMixin
    implements _DesignParamPublisher {
  const _$_DesignParamPublisher({this.key = 'default'});

  @JsonKey()
  @override
  final String key;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DesignParamPublisher(key: $key)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DesignParamPublisher'))
      ..add(DiagnosticsProperty('key', key));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DesignParamPublisher &&
            const DeepCollectionEquality().equals(other.key, key));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(key));

  @JsonKey(ignore: true)
  @override
  _$DesignParamPublisherCopyWith<_DesignParamPublisher> get copyWith =>
      __$DesignParamPublisherCopyWithImpl<_DesignParamPublisher>(
          this, _$identity);
}

abstract class _DesignParamPublisher implements DesignParamPublisher {
  const factory _DesignParamPublisher({String key}) = _$_DesignParamPublisher;

  @override
  String get key;
  @override
  @JsonKey(ignore: true)
  _$DesignParamPublisherCopyWith<_DesignParamPublisher> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$DesignParamSubscriberTearOff {
  const _$DesignParamSubscriberTearOff();

  _DesignParamSubscriber call(
      {dynamic defaultValue = null, String key = 'default'}) {
    return _DesignParamSubscriber(
      defaultValue: defaultValue,
      key: key,
    );
  }
}

/// @nodoc
const $DesignParamSubscriber = _$DesignParamSubscriberTearOff();

/// @nodoc
mixin _$DesignParamSubscriber {
  dynamic get defaultValue => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DesignParamSubscriberCopyWith<DesignParamSubscriber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DesignParamSubscriberCopyWith<$Res> {
  factory $DesignParamSubscriberCopyWith(DesignParamSubscriber value,
          $Res Function(DesignParamSubscriber) then) =
      _$DesignParamSubscriberCopyWithImpl<$Res>;
  $Res call({dynamic defaultValue, String key});
}

/// @nodoc
class _$DesignParamSubscriberCopyWithImpl<$Res>
    implements $DesignParamSubscriberCopyWith<$Res> {
  _$DesignParamSubscriberCopyWithImpl(this._value, this._then);

  final DesignParamSubscriber _value;
  // ignore: unused_field
  final $Res Function(DesignParamSubscriber) _then;

  @override
  $Res call({
    Object? defaultValue = freezed,
    Object? key = freezed,
  }) {
    return _then(_value.copyWith(
      defaultValue: defaultValue == freezed
          ? _value.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DesignParamSubscriberCopyWith<$Res>
    implements $DesignParamSubscriberCopyWith<$Res> {
  factory _$DesignParamSubscriberCopyWith(_DesignParamSubscriber value,
          $Res Function(_DesignParamSubscriber) then) =
      __$DesignParamSubscriberCopyWithImpl<$Res>;
  @override
  $Res call({dynamic defaultValue, String key});
}

/// @nodoc
class __$DesignParamSubscriberCopyWithImpl<$Res>
    extends _$DesignParamSubscriberCopyWithImpl<$Res>
    implements _$DesignParamSubscriberCopyWith<$Res> {
  __$DesignParamSubscriberCopyWithImpl(_DesignParamSubscriber _value,
      $Res Function(_DesignParamSubscriber) _then)
      : super(_value, (v) => _then(v as _DesignParamSubscriber));

  @override
  _DesignParamSubscriber get _value => super._value as _DesignParamSubscriber;

  @override
  $Res call({
    Object? defaultValue = freezed,
    Object? key = freezed,
  }) {
    return _then(_DesignParamSubscriber(
      defaultValue: defaultValue == freezed
          ? _value.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DesignParamSubscriber
    with DiagnosticableTreeMixin
    implements _DesignParamSubscriber {
  const _$_DesignParamSubscriber(
      {this.defaultValue = null, this.key = 'default'});

  @JsonKey()
  @override
  final dynamic defaultValue;
  @JsonKey()
  @override
  final String key;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DesignParamSubscriber(defaultValue: $defaultValue, key: $key)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DesignParamSubscriber'))
      ..add(DiagnosticsProperty('defaultValue', defaultValue))
      ..add(DiagnosticsProperty('key', key));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DesignParamSubscriber &&
            const DeepCollectionEquality()
                .equals(other.defaultValue, defaultValue) &&
            const DeepCollectionEquality().equals(other.key, key));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(defaultValue),
      const DeepCollectionEquality().hash(key));

  @JsonKey(ignore: true)
  @override
  _$DesignParamSubscriberCopyWith<_DesignParamSubscriber> get copyWith =>
      __$DesignParamSubscriberCopyWithImpl<_DesignParamSubscriber>(
          this, _$identity);
}

abstract class _DesignParamSubscriber implements DesignParamSubscriber {
  const factory _DesignParamSubscriber({dynamic defaultValue, String key}) =
      _$_DesignParamSubscriber;

  @override
  dynamic get defaultValue;
  @override
  String get key;
  @override
  @JsonKey(ignore: true)
  _$DesignParamSubscriberCopyWith<_DesignParamSubscriber> get copyWith =>
      throw _privateConstructorUsedError;
}
