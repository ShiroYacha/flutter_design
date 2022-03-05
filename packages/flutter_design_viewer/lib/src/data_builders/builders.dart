import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/src/widgets/items/images.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recase/recase.dart';
import 'package:faker/faker.dart';

import '../theme.dart';
import 'designers.dart';

class DataTemplateStringRawBuilder extends DataBuilder<String, String> {
  DataTemplateStringRawBuilder([
    String parameter = 'Type something',
  ]) : super(parameter);

  @override
  String build(BuildContext context, String field) {
    return parameter;
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<String, String> updateBuilder,
  ) {
    return DataTemplateStringRawDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Raw text';
}

class DataTemplateStringLoremBuilder
    extends DataBuilder<String, DataTemplateStringLoremParameter> {
  DataTemplateStringLoremBuilder([
    DataTemplateStringLoremParameter parameter =
        const DataTemplateStringLoremParameter(),
  ]) : super(parameter);

  @override
  String build(BuildContext context, String field) {
    return ReCase(
      Faker(seed: field.hashCode).lorem.words(parameter.length).join(' '),
    ).sentenceCase;
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<String, DataTemplateStringLoremParameter> updateBuilder,
  ) {
    return DataTemplateStringLoremDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Lorem ipsum';
}

class DataTemplateWidgetPlaceholderBuilder
    extends DataBuilder<Widget, DataTemplateWidgetPlaceholderParameter> {
  DataTemplateWidgetPlaceholderBuilder([
    DataTemplateWidgetPlaceholderParameter parameter =
        const DataTemplateWidgetPlaceholderParameter(),
  ]) : super(parameter);

  @override
  Widget build(BuildContext context, String field) {
    return CustomPaint(
      key: UniqueKey(),
      size: parameter.size,
      painter: PatternPainter(
        theme: Theme.of(context),
        backgroundColor: parameter.color.withOpacity(0.8),
        foregroundColor: parameter.color,
      ),
    );
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<Widget, DataTemplateWidgetPlaceholderParameter>
        updateBuilder,
  ) {
    return DataTemplateWidgetPlaceholderDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Widget placeholder';
}

class DataTemplateWidgetPlaceholderListBuilder extends DataBuilder<List<Widget>,
    DataTemplateWidgetPlaceholderListParameter> {
  DataTemplateWidgetPlaceholderListBuilder([
    DataTemplateWidgetPlaceholderListParameter parameter =
        const DataTemplateWidgetPlaceholderListParameter(),
  ]) : super(parameter);

  @override
  List<Widget> build(BuildContext context, String field) {
    return List.generate(
      parameter.count,
      (index) {
        final color = Colors.primaries[index % Colors.primaries.length];
        return CustomPaint(
          key: UniqueKey(),
          size: parameter.size,
          painter: PatternPainter(
            theme: Theme.of(context),
            backgroundColor: color.withOpacity(0.8),
            foregroundColor: color,
          ),
        );
      },
    );
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<List<Widget>, DataTemplateWidgetPlaceholderListParameter>
        updateBuilder,
  ) {
    return DataTemplateWidgetPlaceholderListDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Widget placeholder list';
}

class DataTemplateStubFunctionBuilder extends DataBuilder<Function, Type> {
  DataTemplateStubFunctionBuilder(Type parameter) : super(parameter);

  @override
  Function build(BuildContext context, String field) {
    if (parameter == VoidBoolCallback) {
      return (b) {};
    } else if (parameter == VoidCallback) {
      return () {};
    }
    throw UnsupportedError('Not implemented');
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<Function, Type> updateBuilder,
  ) {
    return const SizedBox.shrink();
  }

  @override
  String get name => 'Stub function';
}

class PubSubConnectedData extends InheritedWidget {
  final Map<String, dynamic> _data = {};

  PubSubConnectedData({
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  static PubSubConnectedData of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<PubSubConnectedData>()!);
  }

  void write(String key, dynamic value) {
    _data[key] = value;
  }

  bool hasValue(String key) {
    return _data.containsKey(key);
  }

  dynamic read(String key) {
    return _data[key];
  }

  void clear() {
    _data.clear();
  }

  @override
  bool updateShouldNotify(covariant PubSubConnectedData oldWidget) {
    return !mapEquals(_data, oldWidget._data);
  }
}

class DataTemplatePubConnectorBuilder
    extends DataBuilder<Function, DataTemplatePubConnectorParameter> {
  late UpdateDataBuilder<Function, DataTemplatePubConnectorParameter>
      _updateBuilder;

  DataTemplatePubConnectorBuilder(
      [DataTemplatePubConnectorParameter parameter =
          const DataTemplatePubConnectorParameter()])
      : super(parameter);

  @override
  Function build(BuildContext context, String field) {
    final data = PubSubConnectedData.of(context);
    return (d) {
      print(
          'data = ${data.hashCode}, writing key = ${parameter.key}, value = $d');
      data.write(parameter.key, d);
      _updateBuilder(this);
    };
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<Function, DataTemplatePubConnectorParameter>
        updateBuilder,
  ) {
    // Store the updater locally to notify
    // TODO: this is ugly AF
    _updateBuilder = updateBuilder;
    // Render designer
    return HookConsumer(builder: (
      context,
      ref,
      widget,
    ) {
      final textEditingController = useTextEditingController(
        text: parameter.key,
      );
      useEffect(() {
        textEditingController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: textEditingController.value.text.length,
        );
        textEditingController.addListener(() {
          updateBuilder(this
            ..parameter = parameter.copyWith(key: textEditingController.text));
        });
      }, []);
      return TextField(
        focusNode: useFocusNode(),
        controller: textEditingController,
        showCursor: true,
        decoration:
            buildTextFieldDecoration(context).copyWith(labelText: 'key'),
      );
    });
  }

  @override
  String get name => 'Pub connector';
}

class DataTemplateSubConnectorBuilder
    extends DataBuilder<dynamic, DataTemplateSubConnectorParameter> {
  DataTemplateSubConnectorBuilder(
      [DataTemplateSubConnectorParameter parameter =
          const DataTemplateSubConnectorParameter()])
      : super(parameter);

  @override
  dynamic build(BuildContext context, String field) {
    final data = PubSubConnectedData.of(context);
    print(
        'data = ${data.hashCode}, reading key = ${parameter.key}, value = ${data.read(parameter.key)}');
    return data.hasValue(parameter.key)
        ? data.read(parameter.key)
        : parameter.defaultValue;
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<dynamic, DataTemplateSubConnectorParameter> updateBuilder,
  ) {
    return HookConsumer(builder: (
      context,
      ref,
      widget,
    ) {
      final textEditingController = useTextEditingController(
        text: parameter.key,
      );
      useEffect(() {
        textEditingController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: textEditingController.value.text.length,
        );
        textEditingController.addListener(() {
          updateBuilder(this
            ..parameter = parameter.copyWith(key: textEditingController.text));
        });
      }, []);
      return TextField(
          focusNode: useFocusNode(),
          controller: textEditingController,
          showCursor: true,
          decoration:
              buildTextFieldDecoration(context).copyWith(labelText: 'key'));
    });
  }

  @override
  String get name => 'Sub connector';
}

class DataTemplateNullBuilder extends DataBuilder<void, void> {
  DataTemplateNullBuilder() : super(null);

  @override
  void build(BuildContext context, String field) {
    return;
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<Function, void> updateBuilder,
  ) {
    return const SizedBox.shrink();
  }

  @override
  String get name => 'Null';
}

class DataTemplateColorPickerBuilder extends DataBuilder<Color, Color> {
  DataTemplateColorPickerBuilder([
    Color parameter = Colors.amber,
  ]) : super(parameter);

  @override
  Color build(BuildContext context, String field) {
    return parameter;
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<Color, Color> updateBuilder,
  ) {
    return DataTemplateColorPickerDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Color picker';
}

class DataTemplateDoubleBuilder extends DataBuilder<double, double> {
  DataTemplateDoubleBuilder([
    double parameter = 0,
  ]) : super(parameter);

  @override
  double build(BuildContext context, String field) {
    return parameter;
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<double, double> updateBuilder,
  ) {
    return DataTemplateDoubleDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Double picker';
}

class DataTemplateIntBuilder extends DataBuilder<int, int> {
  DataTemplateIntBuilder([
    int parameter = 0,
  ]) : super(parameter);

  @override
  int build(BuildContext context, String field) {
    return parameter;
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<int, int> updateBuilder,
  ) {
    return DataTemplateIntDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Integer picker';
}

class DataTemplateBoolToggleBuilder extends DataBuilder<bool, bool> {
  DataTemplateBoolToggleBuilder([
    bool parameter = false,
  ]) : super(parameter);

  @override
  bool build(BuildContext context, String field) {
    return parameter;
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<bool, bool> updateBuilder,
  ) {
    return DataTemplateBoolToggleDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Boolean toggle';
}
