import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/src/models/data_factory.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../measures.dart';
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
          header: Paddings.vertical10(
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
                  const TextSpan(
                    text: ' Tap to change color',
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
          height: 200,
          value: builder.size,
          color: builder.color,
          valueChanged: (v) => updateBuilder(builder..size = v),
        ),
      ],
    );
  }
}
