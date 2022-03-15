import 'package:flutter/material.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recase/recase.dart';

import '../../measures.dart';
import 'default_icons.dart';
import 'images.dart';

class ThemeViewersCollection extends HookConsumerWidget {
  static const _minWidth = 800.0;

  /// Render with a dot-patterned background (performance heavy)
  final bool renderWithBackgroundPattern;

  /// Render with a surface colored background
  final bool renderWithBackgroundColor;
  final WidgetBuilder builder;

  const ThemeViewersCollection({
    required this.builder,
    this.renderWithBackgroundPattern = true,
    this.renderWithBackgroundColor = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final themes =
        ref.watch(viewerSettingsProvider.select((e) => e.enabledThemes));
    final content = Padding(
      padding: const EdgeInsets.all(8.0),
      child: builder(context),
    );
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
                      TextSpan(
                        text: ReCase(e.key).sentenceCase,
                        style: theme.textTheme.titleSmall,
                      )
                    ],
                  ),
                ),
                Spacers.v6,
                Theme(
                  data: e.value,
                  child: renderWithBackgroundPattern
                      ? PatternedBackground(
                          foregroundOpacity: 0.1,
                          child: content,
                        )
                      : renderWithBackgroundColor
                          ? Container(
                              color: e.value.backgroundColor,
                              child: content,
                            )
                          : content,
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

class TypographyViewer extends StatelessWidget {
  const TypographyViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: {
        'Display Large': theme.textTheme.displayLarge,
        'Display Medium': theme.textTheme.displayMedium,
        'Display Small': theme.textTheme.displaySmall,
        'Headline Large': theme.textTheme.headlineLarge,
        'Headline Medium': theme.textTheme.headlineMedium,
        'Headline Small': theme.textTheme.headlineSmall,
        'Title Large': theme.textTheme.titleLarge,
        'Title Medium': theme.textTheme.titleMedium,
        'Title Small': theme.textTheme.titleSmall,
        'Label Large': theme.textTheme.labelLarge,
        'Label Medium': theme.textTheme.labelMedium,
        'Label Small': theme.textTheme.labelSmall,
        'Body Large': theme.textTheme.bodyLarge,
        'Body Medium': theme.textTheme.bodyMedium,
        'Body Small': theme.textTheme.bodySmall,
      }
          .entries
          .where((e) => e.value != null)
          .map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  e.key,
                  style: e.value,
                ),
              ))
          .toList(),
    );
  }
}

class IconViewer extends StatelessWidget {
  final List<IconData>? iconDataset;
  const IconViewer(
    this.iconDataset, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconDataset =
        (this.iconDataset ?? defaultMaterialIcons).toSet().toList();
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 60,
        childAspectRatio: 1.0,
      ),
      itemCount: iconDataset.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => PatternedBackground(
        foregroundOpacity: 0.1,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            iconDataset[index],
            size: 20,
          ),
        ),
      ),
    );
  }
}
