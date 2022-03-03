import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';

import 'data_builders/builders.dart';
import 'data_builders/factory.dart';

final defaultBuilders = <Type, List<DataBuilderCreator>>{
  String: [
    // TODO: p!=null could be handled by codegen
    ([p]) => p != null
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
    ([p]) => DataTemplatePubConnectorBuilder(p),
  ],
  Color: [
    ([p]) => p != null
        ? DataTemplateColorPickerBuilder(p)
        : DataTemplateColorPickerBuilder(),
  ],
  double: [
    ([p]) =>
        p != null ? DataTemplateDoubleBuilder(p) : DataTemplateDoubleBuilder(),
  ],
  int: [
    ([p]) => p != null ? DataTemplateIntBuilder(p) : DataTemplateIntBuilder(),
  ],
  bool: [
    ([p]) => p != null
        ? DataTemplateBoolToggleBuilder(p)
        : DataTemplateBoolToggleBuilder(),
    ([p]) => DataTemplateSubConnectorBuilder(p),
  ],
};
