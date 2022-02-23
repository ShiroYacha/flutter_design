import 'package:flutter/material.dart';

import 'models/data.dart';

final defaultBuilders = <Type, List<DataBuilderCreator>>{
  String: [
    ([d]) => d != null
        ? DataTemplateStringRawBuilder(raw: d)
        : DataTemplateStringRawBuilder(),
    ([d]) => DataTemplateStringLoremBuilder(),
  ],
  Widget: [
    ([d]) => DataTemplateWidgetPlaceholderBuilder(),
  ],
  List<Widget>: [
    ([d]) => DataTemplateWidgetPlaceholderListBuilder(),
  ],
  Function: [
    ([d]) => DataTemplateStubFunctionBuilder(),
  ],
  Color: [
    ([d]) => d != null
        ? DataTemplateColorPickerBuilder(color: d)
        : DataTemplateColorPickerBuilder(),
  ],
  double: [
    ([d]) => d != null
        ? DataTemplateDoubleBuilder(value: d)
        : DataTemplateDoubleBuilder(),
  ],
  int: [
    ([d]) =>
        d != null ? DataTemplateIntBuilder(value: d) : DataTemplateIntBuilder(),
  ],
};
