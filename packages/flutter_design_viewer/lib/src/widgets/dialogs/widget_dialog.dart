import 'package:flutter/material.dart';
import 'package:flutter_design_viewer/src/measures.dart';
import 'package:flutter_design_viewer/src/widgets/items/frames.dart';
import 'package:flutter_design_viewer/src/widgets/scaffolds/root_scaffold.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final componentFrameToolbarSizeProvider =
    StateProvider<Size>((ref) => Size.zero);

class WidgetDialog extends HookConsumerWidget {
  const WidgetDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final rootScaffoldKey = ref.watch(rootScaffoldKeyProvider);
    final mediaQuery = MediaQuery.of(rootScaffoldKey.currentState!.context);
    final fullHeight = mediaQuery.size.height;
    final componentFrameToolbarSize =
        ref.watch(componentFrameToolbarSizeProvider);
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: theme.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      content: SizedBox(
        width: mediaQuery.size.width,
        child: ComponentFramePanel(
          widgetDisplayHeight: fullHeight -
              componentFrameToolbarSize.height -
              mediaQuery.viewInsets.top -
              mediaQuery.viewPadding.top -
              mediaQuery.viewInsets.bottom -
              mediaQuery.viewPadding.bottom -
              SpacingDesign.s10 * 2,
        ),
      ),
    );
  }
}
