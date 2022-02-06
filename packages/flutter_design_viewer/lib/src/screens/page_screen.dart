import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/src/bars/top_app_bar.dart';
import 'package:flutter_design_viewer/src/drawers/explorer_drawer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentPageProvider =
    Provider<ViewerPageUnion>((ref) => throw UnimplementedError());

class PageScreen extends HookConsumerWidget {
  const PageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Row(
          children: [
            if (constraints.maxWidth > 960) const ExplorerDrawer(),
            Column(
              children: [
                const TopAppBar(),
              ],
            ),
          ],
        );
      }),
    );
  }
}
