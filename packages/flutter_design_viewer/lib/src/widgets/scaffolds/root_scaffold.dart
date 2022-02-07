import 'package:flutter/material.dart';
import 'package:flutter_design_viewer/src/viewer_app.dart';
import 'package:flutter_design_viewer/src/widgets/bars/top_app_bar.dart';
import 'package:flutter_design_viewer/src/widgets/drawers/explorer_drawer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RootScaffold extends HookConsumerWidget {
  final Widget child;
  const RootScaffold({
    required this.child,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewerSettings = ref.watch(viewerSettingsProvider);
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Row(
          children: [
            if (constraints.maxWidth > viewerSettings.breakpoints.desktop)
              const ExplorerDrawer(),
            Expanded(
              child: Column(
                children: [
                  const TopAppBar(),
                  Expanded(
                    child: child,
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
