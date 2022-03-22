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

class DesignReadonlyBuilder extends DataBuilder<dynamic, dynamic> {
  String? parameterStringValue;
  DesignReadonlyBuilder(
    dynamic parameter,
    this.parameterStringValue,
  ) : super(parameter);

  @override
  dynamic build(BuildContext context, String field) {
    return parameter;
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<dynamic, dynamic> updateBuilder,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(parameterStringValue ?? 'N/A'),
    );
  }

  @override
  String get name => 'Dynamic readonly';
}

class DesignStringBuilder extends DataBuilder<String, String> {
  DesignStringBuilder([
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
    return DesignStringDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Raw text';
}

class DesignStringLoremBuilder
    extends DataBuilder<String, DesignParamStringLorem> {
  DesignStringLoremBuilder([
    DesignParamStringLorem parameter = const DesignParamStringLorem(),
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
    UpdateDataBuilder<String, DesignParamStringLorem> updateBuilder,
  ) {
    return DesignStringLoremDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Lorem ipsum';
}

class DesignWidgetPlaceholderBuilder
    extends DataBuilder<Widget, DesignParamWidgetPlaceholder> {
  DesignWidgetPlaceholderBuilder([
    DesignParamWidgetPlaceholder parameter =
        const DesignParamWidgetPlaceholder(),
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
    UpdateDataBuilder<Widget, DesignParamWidgetPlaceholder> updateBuilder,
  ) {
    return DesignWidgetPlaceholderDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Widget placeholder';
}

class DesignWidgetPlaceholderListBuilder
    extends DataBuilder<List<Widget>, DesignParamWidgetPlaceholderList> {
  DesignWidgetPlaceholderListBuilder([
    DesignParamWidgetPlaceholderList parameter =
        const DesignParamWidgetPlaceholderList(),
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
    UpdateDataBuilder<List<Widget>, DesignParamWidgetPlaceholderList>
        updateBuilder,
  ) {
    return DesignWidgetPlaceholderListDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Widget placeholder list';
}

class DesignStubFunctionBuilder extends DataBuilder<Function, Type> {
  DesignStubFunctionBuilder(Type parameter) : super(parameter);

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

class DesignPublisherBuilder
    extends DataBuilder<Function, DesignParamPublisher> {
  late UpdateDataBuilder<Function, DesignParamPublisher> _updateBuilder;

  DesignPublisherBuilder(
      [DesignParamPublisher parameter = const DesignParamPublisher()])
      : super(parameter);

  @override
  Function build(BuildContext context, String field) {
    final data = PubSubConnectedData.of(context);
    return (d) {
      data.write(parameter.key, d);
      _updateBuilder(this);
    };
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<Function, DesignParamPublisher> updateBuilder,
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
  String get name => 'Publisher';
}

class DesignSubscriberBuilder
    extends DataBuilder<dynamic, DesignParamSubscriber> {
  DesignSubscriberBuilder(
      [DesignParamSubscriber parameter = const DesignParamSubscriber()])
      : super(parameter);

  @override
  dynamic build(BuildContext context, String field) {
    final data = PubSubConnectedData.of(context);
    return data.hasValue(parameter.key)
        ? data.read(parameter.key)
        : parameter.defaultValue;
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<dynamic, DesignParamSubscriber> updateBuilder,
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
  String get name => 'Subscriber';
}

class DesignNullBuilder extends DataBuilder<void, void> {
  DesignNullBuilder() : super(null);

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

class DesignColorPickerBuilder extends DataBuilder<Color, Color> {
  DesignColorPickerBuilder([
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
    return DesignColorPickerDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Color picker';
}

class DesignDoubleBuilder extends DataBuilder<double, double> {
  DesignDoubleBuilder([
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
    return DesignDoubleDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Double picker';
}

class DesignIntBuilder extends DataBuilder<int, int> {
  DesignIntBuilder([
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
    return DesignIntDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Integer picker';
}

class DesignBoolToggleBuilder extends DataBuilder<bool, bool> {
  DesignBoolToggleBuilder([
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
    return DesignBoolToggleDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Boolean toggle';
}
