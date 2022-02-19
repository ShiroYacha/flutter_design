import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:flutter_design_viewer/src/measures.dart';
import 'package:flutter_design_viewer/src/widgets/items/buttons.dart';
import 'package:flutter_design_viewer/src/widgets/items/containers.dart';
import 'package:flutter_design_viewer/src/widgets/items/controls.dart';
import 'package:flutter_design_viewer/src/widgets/items/images.dart';
import 'package:flutter_design_viewer/src/widgets/scaffolds/root_scaffold.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';

class SettingsDialog extends HookConsumerWidget {
  const SettingsDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final screenBreakpoint = ref.watch(screenBreakpointProvider);
    final showFullscreen = screenBreakpoint == ScreenBreakpoint.mobile ||
        mediaQuery.size.width <= 600;

    final viewerState = ref.watch(viewerStateProvider);
    final viewerStateNotifier = ref.watch(viewerStateProvider.notifier);
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: theme.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(showFullscreen ? 0 : 16.0),
      ),
      content: SizedBox(
        width: 600,
        height: showFullscreen
            ? mediaQuery.size.height
            : mediaQuery.size.height * 0.8,
        child: SingleChildScrollView(
          child: Padding(
            padding: SpacingDesign.paddingAll20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const ThemableGlyph(
                      glyph: ViewerGlyphUnion.icon(
                        icon: Ionicons.settings_outline,
                        size: 24,
                      ),
                    ),
                    Spacers.h10,
                    Text(
                      'Global settings',
                      style: theme.textTheme.headline5,
                    ),
                    const Expanded(child: SizedBox.shrink()),
                    if (showFullscreen)
                      GlyphButton(
                        glyph: const ViewerGlyphUnion.icon(
                          icon: Ionicons.close,
                          size: 24,
                        ),
                        onTap: Navigator.of(context).pop,
                      )
                  ],
                ),
                Spacers.v20,
                TitleWidgetPair(
                  title: 'Default view mode',
                  description:
                      'Change the default view mode of all widget viewers globally.',
                  widget: SelectableViewModeGroup(
                    value: viewerState.viewMode,
                    onValueChanged: (v) => viewerStateNotifier.update(
                      (state) => state.copyWith(viewMode: v),
                    ),
                  ),
                ),
                Spacers.v20,
                TitleWidgetPair(
                  title: 'Default display mode',
                  description:
                      'Change the default display mode of all widget viewers globally.',
                  widget: SelectableDisplayModeGroup(
                    value: viewerState.displayMode,
                    onValueChanged: (v) => viewerStateNotifier.update(
                      (state) => state.copyWith(displayMode: v),
                    ),
                  ),
                ),
                Spacers.v20,
                TitleWidgetPair(
                  title: 'Default theme',
                  description:
                      'Change the default theme of all widget viewers globally, excl. "Theme" view mode.',
                  widget: SelectableThemeGroup(
                    value: viewerState.targetThemeId,
                    onValueChanged: (v) => viewerStateNotifier.update(
                      (state) => state.copyWith(targetThemeId: v),
                    ),
                  ),
                ),
                Spacers.v20,
                TitleWidgetPair(
                  title: 'Default device',
                  description:
                      'Change the default device of all widget viewers globally, excl. "Device" view mode.',
                  widget: SelectableDeviceGroup(
                    value: viewerState.targetDeviceId,
                    onValueChanged: (v) => viewerStateNotifier.update(
                      (state) => state.copyWith(targetDeviceId: v),
                    ),
                  ),
                ),
                Spacers.v20,
                TitleWidgetPair(
                  title: 'Default devices',
                  description:
                      'Change the default devices of all widget viewers globally in "Device" view mode.',
                  widget: SelectableDevicesGroup(
                    value: viewerState.targetDeviceIds,
                    onValueChanged: (v) => viewerStateNotifier.update(
                      (state) => state.copyWith(targetDeviceIds: v),
                    ),
                  ),
                ),
                Spacers.v10,
                CheckableStatement(
                  value: viewerState.showDataBuilderByDefault,
                  title: 'Show data builder by default',
                  subtitle:
                      'If selected, the data builder will be shown by default and might hide the code viewer.',
                  onValueChanged: (v) => viewerStateNotifier.update(
                    (state) => state.copyWith(showDataBuilderByDefault: v),
                  ),
                ),
                Spacers.v10,
                CheckableStatement(
                  value: viewerState.expandExplorerNodesByDefault,
                  title: 'Expand explorer nodes by default',
                  subtitle:
                      'If selected, all nodes will be expanded initially unless you collapse them.',
                  onValueChanged: (v) => viewerStateNotifier.update(
                    (state) => state.copyWith(expandExplorerNodesByDefault: v),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
