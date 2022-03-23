import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';

import 'data_builders/builders.dart';
import 'data_builders/factory.dart';

DataBuilder<dynamic, dynamic> subConnectorDataBuilderCreator([p]) =>
    p != null && p is DesignParamSubscriber
        ? DesignSubscriberBuilder(p)
        : DesignSubscriberBuilder();

DataBuilder<dynamic, dynamic> pubConnectorDataBuilderCreator([p]) =>
    p != null && p is DesignParamPublisher
        ? DesignPublisherBuilder(p)
        : DesignPublisherBuilder();

// TODO: this could be handled by codegen?
final defaultBuilders = <Type, List<DataBuilderCreator>>{
  String: [
    ([p]) => p != null && p is String
        ? DesignStringBuilder(p)
        : DesignStringBuilder(),
    ([p]) => DesignStringLoremBuilder(),
    subConnectorDataBuilderCreator,
  ],
  Color: [
    ([p]) => p != null && p is Color
        ? DesignColorPickerBuilder(p)
        : DesignColorPickerBuilder(),
    subConnectorDataBuilderCreator,
  ],
  double: [
    ([p]) => p != null && (p is double || p is int)
        ? DesignDoubleBuilder(p is int ? p.toDouble() : p)
        : DesignDoubleBuilder(),
    subConnectorDataBuilderCreator,
  ],
  int: [
    ([p]) => p != null && p is int ? DesignIntBuilder(p) : DesignIntBuilder(),
    subConnectorDataBuilderCreator,
  ],
  bool: [
    ([p]) => p != null && p is bool
        ? DesignBoolToggleBuilder(p)
        : DesignBoolToggleBuilder(),
    subConnectorDataBuilderCreator,
  ],
  Widget: [
    ([p]) => p != null && p is DesignParamWidgetPlaceholder
        ? DesignWidgetPlaceholderBuilder(p)
        : DesignWidgetPlaceholderBuilder(),
    subConnectorDataBuilderCreator,
  ],
  List<Widget>: [
    ([p]) => p != null && p is DesignParamWidgetPlaceholderList
        ? DesignWidgetPlaceholderListBuilder(p)
        : DesignWidgetPlaceholderListBuilder(),
    ([p]) => DesignWidgetPlaceholderListBuilder(),
    subConnectorDataBuilderCreator,
  ],
  VoidCallback: [
    ([p]) => DesignStubFunctionBuilder(VoidCallback),
  ],
  VoidBoolCallback: [
    ([p]) => DesignStubFunctionBuilder(VoidBoolCallback),
    pubConnectorDataBuilderCreator
  ],
  VoidStringCallback: [
    ([p]) => DesignStubFunctionBuilder(VoidStringCallback),
    pubConnectorDataBuilderCreator
  ],
  VoidDoubleCallback: [
    ([p]) => DesignStubFunctionBuilder(VoidDoubleCallback),
    pubConnectorDataBuilderCreator
  ],
  VoidIntCallback: [
    ([p]) => DesignStubFunctionBuilder(VoidIntCallback),
    pubConnectorDataBuilderCreator
  ],
  VoidDynamicCallback: [
    ([p]) => DesignStubFunctionBuilder(VoidDynamicCallback),
    pubConnectorDataBuilderCreator
  ],
};
