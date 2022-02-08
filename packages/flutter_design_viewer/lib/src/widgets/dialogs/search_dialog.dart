import 'package:flutter/material.dart';
import 'package:flutter_design_viewer/src/measures.dart';
import 'package:flutter_design_viewer/src/widgets/items/containers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';

class SearchDialog extends HookConsumerWidget {
  const SearchDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const keyContainerSize = 24.0;
    final theme = Theme.of(context);
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: Container(
        color: theme.backgroundColor,
        padding: SpacingDesign.paddingAll20,
        width: 800,
        height: 600,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Ionicons.search,
                  color: theme.colorScheme.secondary,
                ),
              ),
            ),
            Spacers.v20(),
            Expanded(
              child: ListView(
                children: Colors.primaries
                    .map((e) => Container(color: e, height: 100))
                    .toList(),
              ),
            ),
            Spacers.v20(),
            Row(
              children: const [
                KeyContainer(
                  size: keyContainerSize,
                  icon: Ionicons.return_down_back,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
