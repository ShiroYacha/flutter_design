import 'package:flutter/material.dart';
import 'package:flutter_design_viewer/src/widgets/items/frames.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WidgetDialog extends HookConsumerWidget {
  const WidgetDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final fullHeight = mediaQuery.size.height;
    // TODO: handle wrap size on smaller screens
    const spacing = 120;
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: theme.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      content: SizedBox(
        width: mediaQuery.size.width,
        height: fullHeight + spacing,
        child: ComponentFramePanel(
          key: UniqueKey(),
          widgetDisplayHeight: fullHeight - spacing,
        ),
      ),
    );
  }
}
