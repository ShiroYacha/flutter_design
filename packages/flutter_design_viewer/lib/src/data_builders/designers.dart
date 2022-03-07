import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/src/widgets/items/buttons.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../measures.dart';
import '../theme.dart';
import '../widgets/items/containers.dart';
import '../widgets/items/controls.dart';
import 'builders.dart';

class DesignStringLoremDesigner extends HookConsumerWidget {
  final DesignStringLoremBuilder builder;
  final UpdateDataBuilder<String, DesignParamStringLorem> updateBuilder;
  const DesignStringLoremDesigner({
    required this.builder,
    required this.updateBuilder,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Slider(
      min: builder.parameter.min.toDouble(),
      max: builder.parameter.max.toDouble(),
      value: builder.parameter.length.toDouble(),
      onChanged: (v) {
        updateBuilder(
            builder..parameter = builder.parameter.copyWith(length: v.floor()));
      },
    );
  }
}

class DesignStringDesigner extends HookConsumerWidget {
  final DesignStringBuilder builder;
  final UpdateDataBuilder<String, String> updateBuilder;
  const DesignStringDesigner({
    required this.builder,
    required this.updateBuilder,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initValue = useState(builder.parameter);
    final textEditingController = useTextEditingController(
      text: builder.parameter,
    );
    useEffect(() {
      textEditingController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: textEditingController.value.text.length,
      );
      textEditingController.addListener(() {
        updateBuilder(builder..parameter = textEditingController.value.text);
      });
    }, []);
    return TextField(
      autofocus: true,
      focusNode: useFocusNode(),
      controller: textEditingController,
      showCursor: true,
      decoration: InputDecoration(
        hintText: 'Type something',
        suffixIcon: GestureDetector(
                onTap: () => textEditingController.text = initValue.value,
                child: const Icon(FeatherIcons.rotateCcw, size: 16))
            .asMouseClickRegion,
      ),
    );
  }
}

class DesignWidgetPlaceholderDesigner extends HookConsumerWidget {
  final DesignWidgetPlaceholderBuilder builder;
  final UpdateDataBuilder<Widget, DesignParamWidgetPlaceholder> updateBuilder;
  const DesignWidgetPlaceholderDesigner({
    required this.builder,
    required this.updateBuilder,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final controller = useMemoized(() => ExpandableController(), []);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpandablePanel(
          controller: controller,
          theme: const ExpandableThemeData(
            iconPadding: EdgeInsets.zero,
            hasIcon: false,
          ),
          header: Paddings.top10(
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Container(
                      decoration: BoxDecoration(
                        color: builder.parameter.color,
                        borderRadius: BorderRadius.circular(
                          6,
                        ),
                      ),
                      width: 20,
                      height: 20,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  TextSpan(
                    text: ' Tap to change color,',
                    style: TextStyle(color: theme.colorScheme.onBackground),
                  ),
                ],
              ),
            ),
          ),
          collapsed: const SizedBox.shrink(),
          expanded: BlockPicker(
            pickerColor: builder.parameter.color,
            onColorChanged: (v) {
              updateBuilder(
                  builder..parameter = builder.parameter.copyWith(color: v));
              controller.toggle();
            },
            layoutBuilder: (context, colors, render) => Wrap(
              children: [for (Color color in colors) render(color)],
            ),
          ),
        ),
        Spacers.v10,
        SizerControl(
          height: 250,
          value: builder.parameter.size,
          color: builder.parameter.color,
          onValueChanged: (v) => updateBuilder(
              builder..parameter = builder.parameter.copyWith(size: v)),
        ),
      ],
    );
  }
}

class DesignWidgetPlaceholderListDesigner extends HookConsumerWidget {
  final DesignWidgetPlaceholderListBuilder builder;
  final UpdateDataBuilder<List<Widget>, DesignParamWidgetPlaceholderList>
      updateBuilder;
  const DesignWidgetPlaceholderListDesigner({
    required this.builder,
    required this.updateBuilder,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntDesigner(
            value: builder.parameter.count,
            onValueChanged: (v) {
              updateBuilder(
                  builder..parameter = builder.parameter.copyWith(count: v));
            }),
        Spacers.v10,
        SizerControl(
          height: 250,
          value: builder.parameter.size,
          color: theme.primaryColor,
          onValueChanged: (v) => updateBuilder(
              builder..parameter = builder.parameter.copyWith(size: v)),
        ),
      ],
    );
  }
}

class DesignColorPickerDesigner extends HookConsumerWidget {
  final DesignColorPickerBuilder builder;
  final UpdateDataBuilder<Color, Color> updateBuilder;
  const DesignColorPickerDesigner({
    required this.builder,
    required this.updateBuilder,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final controller = useMemoized(() => ExpandableController(), []);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpandablePanel(
          controller: controller,
          theme: const ExpandableThemeData(
            iconPadding: EdgeInsets.zero,
            hasIcon: false,
          ),
          header: Paddings.top10(
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Container(
                      decoration: BoxDecoration(
                        color: builder.parameter,
                        borderRadius: BorderRadius.circular(
                          6,
                        ),
                      ),
                      width: 20,
                      height: 20,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  TextSpan(
                    text: ' Tap to change color,',
                    style: TextStyle(color: theme.colorScheme.onBackground),
                  ),
                ],
              ),
            ),
          ),
          collapsed: const SizedBox.shrink(),
          expanded: BlockPicker(
            pickerColor: builder.parameter,
            onColorChanged: (v) {
              updateBuilder(builder..parameter = v);
              controller.toggle();
            },
            layoutBuilder: (context, colors, render) => Wrap(
              children: [for (Color color in colors) render(color)],
            ),
          ),
        ),
      ],
    );
  }
}

class DesignDoubleDesigner extends HookConsumerWidget {
  final DesignDoubleBuilder builder;
  final UpdateDataBuilder<double, double> updateBuilder;
  const DesignDoubleDesigner({
    required this.builder,
    required this.updateBuilder,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DoubleDesigner(
      value: builder.parameter,
      onValueChanged: (v) {
        updateBuilder(builder..parameter = v);
      },
    );
  }
}

class DesignIntDesigner extends HookConsumerWidget {
  final DesignIntBuilder builder;
  final UpdateDataBuilder<int, int> updateBuilder;
  const DesignIntDesigner({
    required this.builder,
    required this.updateBuilder,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IntDesigner(
      value: builder.parameter,
      onValueChanged: (v) {
        updateBuilder(builder..parameter = v);
      },
    );
  }
}

class IntDesigner extends HookWidget {
  final int value;
  final void Function(int) onValueChanged;
  const IntDesigner({
    required this.value,
    required this.onValueChanged,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final initValue = useState(value);
    final textEditingController = useTextEditingController(
      text: value.toString(),
    );
    useEffect(() {
      textEditingController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: textEditingController.value.text.length,
      );
      textEditingController.addListener(() {
        onValueChanged(int.tryParse(textEditingController.value.text) ?? 0);
      });
    }, []);
    return ResponsiveEvenRow(
      children: [
        TextField(
          autofocus: true,
          focusNode: useFocusNode(),
          controller: textEditingController,
          showCursor: true,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'(^-?\d*)'))
          ],
          decoration: buildTextFieldDecoration(context).copyWith(
            suffixIcon: GestureDetector(
                    onTap: () =>
                        textEditingController.text = initValue.value.toString(),
                    child: const Icon(FeatherIcons.rotateCcw, size: 16))
                .asMouseClickRegion,
          ),
        ),
        RangeAdjustableSlider(
          max: initValue.value * 10,
          min: 0,
          allowsDecimal: false,
          value: double.tryParse(textEditingController.text) ?? 0.0,
          onChanged: (v) {
            textEditingController.text = v.floor().toString();
          },
        ),
      ],
    );
  }
}

class DoubleDesigner extends HookWidget {
  final double value;
  final void Function(double) onValueChanged;
  const DoubleDesigner({
    required this.value,
    required this.onValueChanged,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final initValue = useState(value);
    final textEditingController = useTextEditingController(
      text: value.toString(),
    );
    useEffect(() {
      textEditingController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: textEditingController.value.text.length,
      );
      textEditingController.addListener(() {
        onValueChanged(
            double.tryParse(textEditingController.value.text) ?? 0.0);
      });
    }, []);
    return ResponsiveEvenRow(
      children: [
        TextField(
          autofocus: true,
          focusNode: useFocusNode(),
          controller: textEditingController,
          showCursor: true,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'(^-?\d*\.?\d*)'))
          ],
          decoration: buildTextFieldDecoration(context).copyWith(
            suffixIcon: GestureDetector(
                    onTap: () =>
                        textEditingController.text = initValue.value.toString(),
                    child: const Icon(FeatherIcons.rotateCcw, size: 16))
                .asMouseClickRegion,
          ),
        ),
        RangeAdjustableSlider(
          max: initValue.value * 10,
          min: 0,
          allowsDecimal: false,
          value: double.tryParse(textEditingController.text) ?? 0.0,
          onChanged: (v) {
            textEditingController.text = v.toString();
          },
        ),
      ],
    );
  }
}

class DesignBoolToggleDesigner extends HookConsumerWidget {
  final DesignBoolToggleBuilder builder;
  final UpdateDataBuilder<bool, bool> updateBuilder;
  const DesignBoolToggleDesigner({
    required this.builder,
    required this.updateBuilder,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
      value: builder.parameter,
      title: const Text('Tap to toggle'),
      onChanged: (v) {
        updateBuilder(builder..parameter = v);
      },
    );
  }
}
