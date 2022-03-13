import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../flutter_design_viewer.dart';
import '../../measures.dart';
import '../items/buttons.dart';

class TopAppBar extends HookConsumerWidget {
  const TopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final themeModeTooltip =
        ref.watch(viewerStateProvider.select((e) => e.themeModeTooltip));
    final themeModeIcon =
        ref.watch(viewerStateProvider.select((e) => e.themeModeIcon));
    final githubLink =
        ref.watch(viewerSettingsProvider.select((e) => e.githubLink));
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
          if (githubLink != null)
            ThemableIconButton(
              onTap: () async {
                if (await canLaunch(githubLink)) {
                  launch(githubLink);
                }
              },
              icon: Ionicons.logo_github,
            ),
          Spacers.h10,
          ThemableIconButton(
            onTap: () {
              viewerStateNotifier.update(
                (state) => state.copyWith(
                  themeMode: state.nextThemeMode,
                ),
              );
            },
            tooltip: themeModeTooltip,
            icon: themeModeIcon,
          ),
        ],
      ),
    );
  }
}
