import 'package:flutter/material.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recase/recase.dart';

import '../../measures.dart';

class ThemeViewersCollection extends HookConsumerWidget {
  static const _minWidth = 800.0;
  final WidgetBuilder builder;

  const ThemeViewersCollection({
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final themes =
        ref.watch(viewerSettingsProvider.select((e) => e.enabledThemes));
    return StaggeredGrid.extent(
      axisDirection: AxisDirection.down,
      maxCrossAxisExtent: _minWidth,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: themes.entries
          .map(
            (e) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            backgroundColor: theme.disabledColor,
                            radius: 8,
                            child: CircleAvatar(
                              backgroundColor: e.value.scaffoldBackgroundColor,
                              radius: 6,
                            ),
                          ),
                        ),
                      ),
                      TextSpan(text: ReCase(e.key).sentenceCase)
                    ],
                  ),
                ),
                Spacers.v6,
                Theme(
                  data: e.value,
                  child: const ColorSchemeViewer(),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}

class ColorSchemeViewer extends StatelessWidget {
  const ColorSchemeViewer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            _ExpandedColorTile(
              background: theme.colorScheme.primary,
              onBackground: theme.colorScheme.onPrimary,
              label: 'Primary',
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.onPrimary,
              onBackground: theme.colorScheme.primary,
              label: 'On Primary',
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.primaryContainer,
              onBackground: theme.colorScheme.onPrimaryContainer,
              label: 'Primary container',
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.onPrimaryContainer,
              onBackground: theme.colorScheme.primaryContainer,
              label: 'On Primary container',
            ),
          ],
        ),
        Spacers.v6,
        Row(
          children: [
            _ExpandedColorTile(
              background: theme.colorScheme.secondary,
              onBackground: theme.colorScheme.onSecondary,
              label: 'Secondary',
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.onSecondary,
              onBackground: theme.colorScheme.secondary,
              label: 'On Secondary',
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.secondaryContainer,
              onBackground: theme.colorScheme.onSecondaryContainer,
              label: 'Secondary container',
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.onSecondaryContainer,
              onBackground: theme.colorScheme.secondaryContainer,
              label: 'On Secondary container',
            ),
          ],
        ),
        Spacers.v6,
        Row(
          children: [
            _ExpandedColorTile(
              background: theme.colorScheme.tertiary,
              onBackground: theme.colorScheme.onTertiary,
              label: 'Tertiary',
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.onTertiary,
              onBackground: theme.colorScheme.tertiary,
              label: 'On Tertiary',
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.tertiaryContainer,
              onBackground: theme.colorScheme.onTertiaryContainer,
              label: 'Tertiary container',
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.onTertiaryContainer,
              onBackground: theme.colorScheme.tertiaryContainer,
              label: 'On Tertiary container',
            ),
          ],
        ),
        Spacers.v6,
        Row(
          children: [
            _ExpandedColorTile(
              background: theme.colorScheme.error,
              onBackground: theme.colorScheme.onError,
              label: 'Error',
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.onError,
              onBackground: theme.colorScheme.error,
              label: 'On Error',
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.errorContainer,
              onBackground: theme.colorScheme.onErrorContainer,
              label: 'Error container',
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.onErrorContainer,
              onBackground: theme.colorScheme.errorContainer,
              label: 'On Error container',
            ),
          ],
        ),
        Spacers.v6,
        Row(
          children: [
            _ExpandedColorTile(
              background: theme.colorScheme.background,
              onBackground: theme.colorScheme.onBackground,
              label: 'Background',
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.onBackground,
              onBackground: theme.colorScheme.background,
              label: 'On Background',
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.surface,
              onBackground: theme.colorScheme.onSurface,
              label: 'Surface',
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.onSurface,
              onBackground: theme.colorScheme.surface,
              label: 'On Surface',
            ),
          ],
        ),
        Spacers.v6,
        Row(
          children: [
            _ExpandedColorTile(
              background: theme.colorScheme.surfaceVariant,
              onBackground: theme.colorScheme.onSurfaceVariant,
              label: 'Surface Variant',
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.onSurfaceVariant,
              onBackground: theme.colorScheme.surfaceVariant,
              label: 'On Surface Variant',
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.outline,
              onBackground: theme.colorScheme.onBackground,
              label: 'Outline',
              flex: 2,
            ),
          ],
        ),
      ],
    );
  }
}

class _ExpandedColorTile extends StatelessWidget {
  final String label;
  final Color background;
  final Color onBackground;
  final double height;
  final int flex;

  const _ExpandedColorTile({
    required this.label,
    required this.background,
    required this.onBackground,
    this.height = 100,
    this.flex = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.all(8),
        color: background,
        height: height,
        child: Stack(children: [
          Align(
            child: Text(
              label,
              style: TextStyle(color: onBackground),
            ),
            alignment: Alignment.topLeft,
          ),
          Align(
            child: Text(
              '#${background.value.toRadixString(16).toUpperCase()}',
              style: TextStyle(color: onBackground),
            ),
            alignment: Alignment.bottomLeft,
          ),
        ]),
      ),
    );
  }
}
