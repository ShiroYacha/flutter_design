import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'parameters.freezed.dart';

@freezed
class DataTemplateStringLoremParameter with _$DataTemplateStringLoremParameter {
  const factory DataTemplateStringLoremParameter({
    @Default(10) int length,
    @Default(0) int min,
    @Default(100) int max,
  }) = _DataTemplateStringLoremParameter;
}

@freezed
class DataTemplateWidgetPlaceholderParameter
    with _$DataTemplateWidgetPlaceholderParameter {
  const factory DataTemplateWidgetPlaceholderParameter({
    @Default(Colors.amber) Color color,
    @Default(Size(100, 100)) Size size,
  }) = _DataTemplateWidgetPlaceholderParameter;
}

@freezed
class DataTemplateWidgetPlaceholderListParameter
    with _$DataTemplateWidgetPlaceholderListParameter {
  const factory DataTemplateWidgetPlaceholderListParameter({
    @Default(Size(100, 100)) Size size,
    @Default(3) int count,
  }) = _DataTemplateWidgetPlaceholderListParameter;
}

@freezed
class DataTemplatePubConnectorParameter
    with _$DataTemplatePubConnectorParameter {
  const factory DataTemplatePubConnectorParameter({
    @Default('default') String key,
  }) = _DataTemplatePubConnectorParameter;
}

@freezed
class DataTemplateSubConnectorParameter
    with _$DataTemplateSubConnectorParameter {
  const factory DataTemplateSubConnectorParameter({
    @Default(null) dynamic defaultValue,
    @Default('default') String key,
  }) = _DataTemplateSubConnectorParameter;
}
