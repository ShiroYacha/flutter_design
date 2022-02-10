import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:flutter_design_viewer/src/measures.dart';
import 'package:flutter_design_viewer/src/widgets/items/buttons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';

class TopAppBar extends HookConsumerWidget {
  const TopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final viewerState = ref.watch(viewerStateProvider);
    final viewerStateNotifier = ref.read(viewerStateProvider.notifier);
    return Container(
      padding: SpacingDesign.paddingAll10,
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.dividerColor,
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          const ConfigButton(),
          const Expanded(child: SizedBox.shrink()),
          const SearchButton(),
          Spacers.h20,
          GlyphButton(
            glyph: const ViewerGlyphUnion.icon(icon: Ionicons.logo_github),
            onTap: () {},
          ),
          Spacers.h10,
          GlyphButton(
            onTap: () {},
            glyph: const ViewerGlyphUnion.icon(icon: Ionicons.logo_twitter),
          ),
          Spacers.h10,
          GlyphButton(
            onTap: () {
              viewerStateNotifier.update(
                (state) => state.copyWith(
                  themeMode: state.nextThemeMode,
                ),
              );
            },
            tooltip: viewerState.themeModeTooltip,
            glyph: ViewerGlyphUnion.icon(icon: viewerState.themeModeIcon),
          ),
        ],
      ),
    );
  }
}
