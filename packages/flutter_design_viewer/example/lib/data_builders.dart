import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyStringDataBuilder extends DataBuilder<String> {
  String raw;
  MyStringDataBuilder({
    this.raw = 'Type something',
  });

  @override
  String build(BuildContext context, String field) {
    return raw;
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<String> updateBuilder,
  ) {
    return MyStringDataDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Raw text';
}

class MyStringDataDesigner extends HookConsumerWidget {
  final MyStringDataBuilder builder;
  final UpdateDataBuilder<String> updateBuilder;
  const MyStringDataDesigner({
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
            child: const Icon(FeatherIcons.rotateCcw, size: 16)),
      ),
    );
  }
}
