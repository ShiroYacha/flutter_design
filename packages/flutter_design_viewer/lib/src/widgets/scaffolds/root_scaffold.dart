import 'package:flutter/material.dart';
import 'package:flutter_design_viewer/src/viewer_app.dart';
import 'package:flutter_design_viewer/src/widgets/bars/top_app_bar.dart';
import 'package:flutter_design_viewer/src/widgets/drawers/explorer_drawer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';

import '../../measures.dart';

enum ScreenBreakpoint {
  mobile,
  tablet,
  desktop,
}

final screenBreakpointProvider =
    Provider<ScreenBreakpoint>((ref) => ScreenBreakpoint.desktop);

final rootScaffoldKeyProvider = Provider.autoDispose<GlobalKey<ScaffoldState>>(
    (ref) => throw UnimplementedError());

class RootScaffold extends HookConsumerWidget {
  final rootScaffoldKey = GlobalKey<ScaffoldState>();
  final Widget child;
  RootScaffold({
    required this.child,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewerSettings = ref.watch(viewerSettingsProvider);
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop =
            constraints.maxWidth > viewerSettings.breakpoints.desktop;
        final screenBreakpoint = isDesktop
            ? ScreenBreakpoint.desktop
            : constraints.maxWidth > viewerSettings.breakpoints.tablet
                ? ScreenBreakpoint.tablet
                : ScreenBreakpoint.mobile;
        return ProviderScope(
          overrides: [
            screenBreakpointProvider.overrideWithValue(screenBreakpoint),
            rootScaffoldKeyProvider.overrideWithValue(rootScaffoldKey)
          ],
          child: Scaffold(
            key: rootScaffoldKey,
            drawer: const ExplorerDrawer(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startDocked,
            floatingActionButton: isDesktop
                ? null
                : Paddings.bottom20(
                    child: FloatingActionButton(
                      child: const Icon(Ionicons.menu_outline),
                      onPressed: () {
                        rootScaffoldKey.currentState?.openDrawer();
                      },
                    ),
                  ),
            body: Row(
              children: [
                if (isDesktop) const ExplorerDrawer(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TopAppBar(),
                      Expanded(
                        child: child,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
