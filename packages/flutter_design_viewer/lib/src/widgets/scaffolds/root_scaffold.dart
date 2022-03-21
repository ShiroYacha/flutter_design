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

final rootScaffoldKeyProvider =
    Provider<GlobalKey<ScaffoldState>>((ref) => GlobalKey<ScaffoldState>());

class RootScaffold extends HookConsumerWidget {
  final Widget child;
  const RootScaffold({
    required this.child,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewerSettings = ref.watch(viewerSettingsProvider);
    final explorerPinned =
        ref.watch(viewerStateProvider.select((e) => e.explorerPinned));
    final rootScaffoldKey = ref.watch(rootScaffoldKeyProvider);
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
            floatingActionButton: isDesktop && explorerPinned
                ? null
                : Paddings.bottom20(
                    child: FloatingActionButton(
                      child: const Icon(Ionicons.menu_outline),
                      onPressed: () {
                        rootScaffoldKey.currentState?.openDrawer();
                      },
                    ),
                  ),
            body: SafeArea(
              child: Row(
                children: [
                  if (isDesktop && explorerPinned) const ExplorerDrawer(),
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
          ),
        );
      },
    );
  }
}
