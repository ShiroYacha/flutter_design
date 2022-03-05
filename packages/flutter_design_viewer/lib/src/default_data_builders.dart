import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';

import 'data_builders/builders.dart';
import 'data_builders/factory.dart';

final defaultBuilders = <Type, List<DataBuilderCreator>>{
  String: [
    // TODO: this could be handled by codegen
    ([p]) => p != null && p is String
        ? DataTemplateStringRawBuilder(p)
        : DataTemplateStringRawBuilder(),
    ([p]) => DataTemplateStringLoremBuilder(),
  ],
  Widget: [
    ([p]) => DataTemplateWidgetPlaceholderBuilder(),
  ],
  List<Widget>: [
    ([p]) => DataTemplateWidgetPlaceholderListBuilder(),
  ],
  VoidCallback: [
    ([p]) => DataTemplateStubFunctionBuilder(VoidCallback),
  ],
  VoidBoolCallback: [
    ([p]) => DataTemplateStubFunctionBuilder(VoidBoolCallback),
    ([p]) => p != null && p is DataTemplatePubConnectorParameter
        ? DataTemplatePubConnectorBuilder(p)
        : DataTemplatePubConnectorBuilder(),
  ],
  Color: [
    ([p]) => p != null && p is Color
        ? DataTemplateColorPickerBuilder(p)
        : DataTemplateColorPickerBuilder(),
  ],
  double: [
    ([p]) => p != null && p is double
        ? DataTemplateDoubleBuilder(p)
        : DataTemplateDoubleBuilder(),
  ],
  int: [
    ([p]) => p != null && p is int
        ? DataTemplateIntBuilder(p)
        : DataTemplateIntBuilder(),
  ],
  bool: [
    ([p]) => p != null && p is bool
        ? DataTemplateBoolToggleBuilder(p)
        : DataTemplateBoolToggleBuilder(),
    ([p]) => p != null && p is DataTemplateSubConnectorParameter
        ? DataTemplateSubConnectorBuilder(p)
        : DataTemplateSubConnectorBuilder(),
  ],
};
