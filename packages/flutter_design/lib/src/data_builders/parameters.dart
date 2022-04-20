import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'parameters.freezed.dart';

/// Configures a lorem ipsum string generator
///
/// The generated data is of type `String`
@freezed
class DesignParamStringLorem with _$DesignParamStringLorem {
  const factory DesignParamStringLorem({
    /// Length of the generated sentence
    @Default(10) int length,

    /// Min length of the generated sentence
    @Default(0) int min,

    /// Max length of the generated sentence
    @Default(100) int max,
  }) = _DesignParamStringLorem;
}

/// Configures a widget placeholder generator
///
/// The generated data is of type `Widget`
@freezed
class DesignParamWidgetPlaceholder with _$DesignParamWidgetPlaceholder {
  const DesignParamWidgetPlaceholder._();
  const factory DesignParamWidgetPlaceholder({
    /// Background color of the placeholder
    @Default(Colors.amber) Color color,

    /// Size of the placeholder
    @Default(Size(100, 100)) Size size,
  }) = _DesignParamWidgetPlaceholder;

  static const DesignParamWidgetPlaceholder infinite =
      DesignParamWidgetPlaceholder(size: Size.infinite);
}

/// Configures a widget placeholder list generator. Each placeholder
/// will take a [MaterialColor] from [Colors.primaries]
///
/// The generated data is of type `List<Widget>`
@freezed
class DesignParamWidgetPlaceholderList with _$DesignParamWidgetPlaceholderList {
  const factory DesignParamWidgetPlaceholderList({
    /// Size of the placeholder
    @Default(Size(100, 100)) Size size,

    /// Number of placeholders
    @Default(3) int count,
  }) = _DesignParamWidgetPlaceholderList;
}

/// Configures a dynamic publisher generator. It should be used along with
/// a [DesignParamSubscriber] with the same [key].
///
/// The generated data is of type `Void Function(dynamic)`
@freezed
class DesignParamPublisher with _$DesignParamPublisher {
  const factory DesignParamPublisher({
    @Default('default') String key,
  }) = _DesignParamPublisher;
}

/// Configures a dynamic subscriber generator. It should be used along with
/// a [DesignParamPublisher] with the same [key].
///
/// The generated data is of type `dynamic`
@freezed
class DesignParamSubscriber with _$DesignParamSubscriber {
  const factory DesignParamSubscriber({
    @Default(null) dynamic defaultValue,
    @Default('default') String key,
  }) = _DesignParamSubscriber;
}
