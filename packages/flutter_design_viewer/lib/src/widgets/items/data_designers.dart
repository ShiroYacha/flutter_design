import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/src/models/data.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
