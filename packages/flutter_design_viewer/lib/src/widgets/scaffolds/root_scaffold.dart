import 'package:flutter/material.dart';
import 'package:flutter_design_viewer/src/viewer_app.dart';
import 'package:flutter_design_viewer/src/widgets/bars/top_app_bar.dart';
import 'package:flutter_design_viewer/src/widgets/drawers/explorer_drawer.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';

import '../../measures.dart';

final explorerDrawerControllerProvider =
    Provider((ref) => ZoomDrawerController());

enum ScreenBreakpoint {
  mobile,
  tablet,
  desktop,
}

final screenBreakpointProvider =
    Provider<ScreenBreakpoint>((ref) => ScreenBreakpoint.desktop);

class RootScaffold extends HookConsumerWidget {
  final Widget child;
  const RootScaffold({
    required this.child,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewerSettings = ref.watch(viewerSettingsProvider);
    final explorerDrawerController =
        ref.watch(explorerDrawerControllerProvider);
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop =
            constraints.maxWidth > viewerSettings.breakpoints.desktop;
        final screenBreakpoint = isDesktop
            ? ScreenBreakpoint.desktop
            : constraints.maxWidth > viewerSettings.breakpoints.tablet
                ? ScreenBreakpoint.tablet
                : ScreenBreakpoint.mobile;
        final scaffold = Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.startDocked,
          floatingActionButton: isDesktop
              ? null
              : Paddings.bottom20(
                  child: FloatingActionButton(
                    child: const Icon(Ionicons.menu_outline),
                    onPressed: () {
                      explorerDrawerController.open?.call();
                    },
                  ),
                ),
          body: Row(
            children: [
              if (isDesktop) const ExplorerDrawer(),
              Expanded(
                child: Column(
                  children: [
                    const TopAppBar(),
                    Expanded(
                      child: Paddings.all40(child: child),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
        return ProviderScope(
          overrides: [
            screenBreakpointProvider.overrideWithValue(screenBreakpoint)
          ],
          child: isDesktop
              ? scaffold
              : ZoomDrawer(
                  controller: explorerDrawerController,
                  angle: 0,
                  style: DrawerStyle.Style4,
                  mainScreenScale: 0,
                  mainScreenTapClose: true,
                  menuScreen: const ExplorerDrawer(),
                  mainScreen: scaffold,
                ),
        );
      },
    );
  }
}
