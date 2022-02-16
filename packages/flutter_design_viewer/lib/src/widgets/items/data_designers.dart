import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/src/models/data.dart';
import 'package:flutter_design_viewer/src/widgets/items/buttons.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../measures.dart';
import '../../theme.dart';
import 'controls.dart';

class DataTemplateStringLoremDesigner extends HookConsumerWidget {
  final DataTemplateStringLoremBuilder builder;
  final UpdateDataBuilder<String> updateBuilder;
  const DataTemplateStringLoremDesigner({
    required this.builder,
    required this.updateBuilder,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Slider(
      min: builder.min.toDouble(),
      max: builder.max.toDouble(),
      value: builder.length.toDouble(),
      onChanged: (v) {
        updateBuilder(builder..length = v.floor());
      },
    );
  }
}

class DataTemplateStringRawDesigner extends HookConsumerWidget {
  final DataTemplateStringRawBuilder builder;
  final UpdateDataBuilder<String> updateBuilder;
  const DataTemplateStringRawDesigner({
    required this.builder,
    required this.updateBuilder,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initValue = useState(builder.raw);
    final textEditingController = useTextEditingController(
      text: builder.raw,
    );
    useEffect(() {
      textEditingController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: textEditingController.value.text.length,
      );
      textEditingController.addListener(() {
        updateBuilder(builder..raw = textEditingController.value.text);
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

class DataTemplateWidgetPlaceholderDesigner extends HookConsumerWidget {
  final DataTemplateWidgetPlaceholderBuilder builder;
  final UpdateDataBuilder<Widget> updateBuilder;
  const DataTemplateWidgetPlaceholderDesigner({
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
                        color: builder.color,
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
            pickerColor: builder.color,
            onColorChanged: (v) {
              updateBuilder(builder..color = v);
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
          value: builder.size,
          color: builder.color,
          valueChanged: (v) => updateBuilder(builder..size = v),
        ),
      ],
    );
  }
}

class DataTemplateColorPickerDesigner extends HookConsumerWidget {
  final DataTemplateColorPickerBuilder builder;
  final UpdateDataBuilder<Color> updateBuilder;
  const DataTemplateColorPickerDesigner({
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
                        color: builder.color,
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
            pickerColor: builder.color,
            onColorChanged: (v) {
              updateBuilder(builder..color = v);
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

/// TODO: Merge this with the int designer
class DataTemplateDoubleDesigner extends HookConsumerWidget {
  final DataTemplateDoubleBuilder builder;
  final UpdateDataBuilder<double> updateBuilder;
  const DataTemplateDoubleDesigner({
    required this.builder,
    required this.updateBuilder,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initValue = useState(builder.value);
    final textEditingController = useTextEditingController(
      text: builder.value.toString(),
    );
    useEffect(() {
      textEditingController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: textEditingController.value.text.length,
      );
      textEditingController.addListener(() {
        updateBuilder(builder
          ..value = double.tryParse(textEditingController.value.text) ?? 0.0);
      });
    }, []);
    return Row(
      children: [
        Expanded(
          child: TextField(
            autofocus: true,
            focusNode: useFocusNode(),
            controller: textEditingController,
            showCursor: true,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'(^-?\d*\.?\d*)'))
            ],
            decoration: buildTextFieldDecoration(context).copyWith(
              suffixIcon: GestureDetector(
                      onTap: () => textEditingController.text =
                          initValue.value.toString(),
                      child: const Icon(FeatherIcons.rotateCcw, size: 16))
                  .asMouseClickRegion,
            ),
          ),
        ),
        Spacers.h10,
        Expanded(
          child: RangeAdjustableSlider(
            max: initValue.value * 10.0,
            min: 0,
            value: double.tryParse(textEditingController.text) ?? 0.0,
            onChanged: (v) {
              textEditingController.text = v.toString();
            },
          ),
        ),
      ],
    );
  }
}

class DataTemplateIntDesigner extends HookConsumerWidget {
  final DataTemplateIntBuilder builder;
  final UpdateDataBuilder<int> updateBuilder;
  const DataTemplateIntDesigner({
    required this.builder,
    required this.updateBuilder,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initValue = useState(builder.value);
    final textEditingController = useTextEditingController(
      text: builder.value.toString(),
    );
    useEffect(() {
      textEditingController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: textEditingController.value.text.length,
      );
      textEditingController.addListener(() {
        updateBuilder(builder
          ..value = int.tryParse(textEditingController.value.text) ?? 0);
      });
    }, []);
    return Row(
      children: [
        Expanded(
          child: TextField(
            autofocus: true,
            focusNode: useFocusNode(),
            controller: textEditingController,
            showCursor: true,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'(^-?\d*)'))
            ],
            decoration: buildTextFieldDecoration(context).copyWith(
              suffixIcon: GestureDetector(
                      onTap: () => textEditingController.text =
                          initValue.value.toString(),
                      child: const Icon(FeatherIcons.rotateCcw, size: 16))
                  .asMouseClickRegion,
            ),
          ),
        ),
        Spacers.h10,
        Expanded(
          child: RangeAdjustableSlider(
            max: initValue.value * 10,
            min: 0,
            allowsDecimal: false,
            value: double.tryParse(textEditingController.text) ?? 0.0,
            onChanged: (v) {
              textEditingController.text = v.floor().toString();
            },
          ),
        ),
      ],
    );
  }
}
