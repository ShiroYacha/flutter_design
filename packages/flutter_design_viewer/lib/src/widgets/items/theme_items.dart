// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recase/recase.dart';

import '../../measures.dart';
import 'default_icons.dart';
import 'images.dart';

final sharedThemeStateProvider =
    StateProvider<Map<String, dynamic>>((ref) => {});

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
    return ProviderScope(
      overrides: [
        sharedThemeStateProvider.overrideWithValue(StateController({})),
      ],
      child: StaggeredGrid.extent(
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
                                backgroundColor:
                                    e.value.scaffoldBackgroundColor,
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
                            foregroundOpacity: 0.05,
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
      ),
    );
  }
}

class ColorSchemeViewer extends StatelessWidget {
  final bool useMaterial3;
  const ColorSchemeViewer({
    required this.useMaterial3,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return useMaterial3
        ? _buildMaterial3ColorScheme(theme)
        : _buildMaterial2ColorScheme(theme);
  }

  Widget _buildMaterial2ColorScheme(ThemeData theme) {
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
              background: theme.colorScheme.primaryVariant,
              onBackground: theme.colorScheme.onPrimary,
              label: 'Primary variant',
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.onPrimary,
              onBackground: theme.colorScheme.primary,
              label: 'On Primary',
            ),
          ],
        ),
        Spacers.v6,
        Row(
          children: [
            _ExpandedColorTile(
              background: theme.colorScheme.secondary,
              onBackground: theme.colorScheme.onPrimary,
              label: 'Secondary',
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.secondaryVariant,
              onBackground: theme.colorScheme.onSecondary,
              label: 'Secondary variant',
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.onSecondary,
              onBackground: theme.colorScheme.secondary,
              label: 'On Secondary',
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
              flex: 2,
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.onBackground,
              onBackground: theme.colorScheme.background,
              label: 'On Background',
            ),
          ],
        ),
        Spacers.v6,
        Row(
          children: [
            _ExpandedColorTile(
              background: theme.colorScheme.surface,
              onBackground: theme.colorScheme.onSurface,
              label: 'Surface',
              flex: 2,
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
              background: theme.colorScheme.error,
              onBackground: theme.colorScheme.onError,
              label: 'Error',
              flex: 2,
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.onError,
              onBackground: theme.colorScheme.error,
              label: 'On Error',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMaterial3ColorScheme(ThemeData theme) {
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
        Spacers.v6,
        Row(
          children: [
            _ExpandedColorTile(
              background: theme.colorScheme.inverseSurface,
              onBackground: theme.colorScheme.onInverseSurface,
              label: 'Inverse Surface',
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.onInverseSurface,
              onBackground: theme.colorScheme.inverseSurface,
              label: 'On Inverse Surface',
            ),
            _ExpandedColorTile(
              background: theme.colorScheme.inversePrimary,
              onBackground: theme.colorScheme.primary,
              label: 'Inverse Primary',
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
  final bool useMaterial3;
  const TypographyViewer({
    this.useMaterial3 = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: (useMaterial3
              ? {
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
              : {
                  'Headline 1': theme.textTheme.headline1,
                  'Headline 2': theme.textTheme.headline2,
                  'Headline 3': theme.textTheme.headline3,
                  'Headline 4': theme.textTheme.headline4,
                  'Headline 5': theme.textTheme.headline5,
                  'Headline 6': theme.textTheme.headline6,
                  'Subtitle 1': theme.textTheme.subtitle1,
                  'Subtitle 2': theme.textTheme.subtitle2,
                  'Body text 1': theme.textTheme.bodyText1,
                  'Body text 2': theme.textTheme.bodyText2,
                  'Button': theme.textTheme.button,
                  'Caption': theme.textTheme.caption,
                  'Overline': theme.textTheme.overline,
                })
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

class ButtonStyleViewer extends StatelessWidget {
  static const String _buttonText = 'Button text';
  static const IconData _fabIcon = Icons.add;

  const ButtonStyleViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                child: const Text(_buttonText),
                onPressed: () {},
              ),
            ),
            Spacers.h16,
            const Expanded(
              child: ElevatedButton(
                child: Text(_buttonText),
                onPressed: null,
              ),
            ),
          ],
        ),
        Spacers.v16,
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                icon: const Icon(_fabIcon),
                label: const Text(_buttonText),
                onPressed: () {},
              ),
            ),
            Spacers.h16,
            Expanded(
              child: ElevatedButton.icon(
                icon: const Icon(_fabIcon),
                label: const Text(_buttonText),
                onPressed: null,
              ),
            ),
          ],
        ),
        Spacers.v16,
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                child: const Text(_buttonText),
                onPressed: () {},
              ),
            ),
            Spacers.h16,
            const Expanded(
              child: OutlinedButton(
                child: Text(_buttonText),
                onPressed: null,
              ),
            ),
          ],
        ),
        Spacers.v16,
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                icon: const Icon(_fabIcon),
                label: const Text(_buttonText),
                onPressed: () {},
              ),
            ),
            Spacers.h16,
            Expanded(
              child: OutlinedButton.icon(
                icon: const Icon(_fabIcon),
                label: const Text(_buttonText),
                onPressed: null,
              ),
            ),
          ],
        ),
        Spacers.v16,
        Row(
          children: [
            Expanded(
              child: TextButton(
                child: const Text(_buttonText),
                onPressed: () {},
              ),
            ),
            Spacers.h16,
            const Expanded(
              child: TextButton(
                child: Text(_buttonText),
                onPressed: null,
              ),
            ),
          ],
        ),
        Spacers.v16,
        Row(
          children: [
            Expanded(
              child: TextButton.icon(
                icon: const Icon(_fabIcon),
                label: const Text(_buttonText),
                onPressed: () {},
              ),
            ),
            Spacers.h16,
            Expanded(
              child: TextButton.icon(
                icon: const Icon(_fabIcon),
                label: const Text(_buttonText),
                onPressed: null,
              ),
            ),
          ],
        ),
        Spacers.v16,
        Row(
          children: [
            Expanded(
              child: IconButton(
                icon: const Icon(_fabIcon),
                onPressed: () {},
              ),
            ),
            Spacers.h16,
            const Expanded(
              child: IconButton(
                icon: Icon(_fabIcon),
                onPressed: null,
              ),
            ),
          ],
        ),
        Spacers.v16,
        Row(
          children: [
            Expanded(
              child: FloatingActionButton(
                child: const Icon(_fabIcon),
                onPressed: () {},
              ),
            ),
            const Expanded(
              child: FloatingActionButton(
                child: Icon(_fabIcon),
                onPressed: null,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SelectorsStyleViewer extends HookConsumerWidget {
  static const String _switchKey = 'switch';
  static const String _checkboxKey = 'checkbox';
  static const String _checkboxTristateKey = 'checkboxTristate';
  static const String _radioKey = 'radio';

  const SelectorsStyleViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sharedThemeState = ref.watch(sharedThemeStateProvider);
    final sharedThemeStateNotifier =
        ref.watch(sharedThemeStateProvider.notifier);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SwitchListTile(
                title: const Text('Switch'),
                subtitle: const Text('Normal'),
                value: sharedThemeState[_switchKey] ?? false,
                onChanged: (v) {
                  sharedThemeStateNotifier.state = Map.of({
                    ...sharedThemeState,
                    _switchKey: v,
                  });
                },
              ),
            ),
            Spacers.h16,
            Expanded(
              child: SwitchListTile(
                title: const Text('Switch'),
                subtitle: const Text('Normal'),
                value: sharedThemeState[_switchKey] ?? false,
                onChanged: null,
              ),
            ),
          ],
        ),
        Spacers.v16,
        Row(
          children: [
            Expanded(
              child: CheckboxListTile(
                title: const Text('Checkbox'),
                subtitle: const Text('Normal'),
                value: sharedThemeState[_checkboxKey] ?? false,
                onChanged: (v) {
                  sharedThemeStateNotifier.state = Map.of({
                    ...sharedThemeState,
                    _checkboxKey: v,
                  });
                },
              ),
            ),
            Spacers.h16,
            Expanded(
              child: CheckboxListTile(
                title: const Text('Checkbox'),
                subtitle: const Text('Normal'),
                value: sharedThemeState[_checkboxKey] ?? false,
                onChanged: null,
              ),
            ),
          ],
        ),
        Spacers.v16,
        Row(
          children: [
            Expanded(
              child: CheckboxListTile(
                title: const Text('Checkbox'),
                subtitle: const Text('Tristate'),
                value: sharedThemeState[_checkboxTristateKey],
                tristate: true,
                onChanged: (v) {
                  sharedThemeStateNotifier.state = Map.of({
                    ...sharedThemeState,
                    _checkboxTristateKey: v,
                  });
                },
              ),
            ),
            Spacers.h16,
            Expanded(
              child: CheckboxListTile(
                title: const Text('Checkbox'),
                subtitle: const Text('Tristate'),
                value: sharedThemeState[_checkboxTristateKey],
                tristate: true,
                onChanged: null,
              ),
            ),
          ],
        ),
        Spacers.v16,
        Row(
          children: [
            Expanded(
              child: RadioListTile<int>(
                value: 1,
                groupValue: sharedThemeState[_radioKey] ?? 1,
                title: const Text('Radio'),
                subtitle: const Text('Value 1'),
                onChanged: (v) {
                  sharedThemeStateNotifier.state = Map.of({
                    ...sharedThemeState,
                    _radioKey: v,
                  });
                },
              ),
            ),
            Spacers.h16,
            Expanded(
              child: RadioListTile<int>(
                value: 1,
                groupValue: sharedThemeState[_radioKey] ?? 1,
                title: const Text('Radio'),
                subtitle: const Text('Value 1'),
                onChanged: null,
              ),
            ),
          ],
        ),
        Spacers.v16,
        Row(
          children: [
            Expanded(
              child: RadioListTile<int>(
                value: 2,
                groupValue: sharedThemeState[_radioKey] ?? 1,
                title: const Text('Radio'),
                subtitle: const Text('Value 2'),
                onChanged: (v) {
                  sharedThemeStateNotifier.state = Map.of({
                    ...sharedThemeState,
                    _radioKey: v,
                  });
                },
              ),
            ),
            Spacers.h16,
            Expanded(
              child: RadioListTile<int>(
                value: 2,
                groupValue: sharedThemeState[_radioKey] ?? 1,
                title: const Text('Radio'),
                subtitle: const Text('Value 2'),
                onChanged: null,
              ),
            ),
          ],
        ),
        Spacers.v16,
      ],
    );
  }
}

class SelectorsAdaptiveStyleViewer extends HookConsumerWidget {
  static const String _switchKey = 'switchAdaptive';

  const SelectorsAdaptiveStyleViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sharedThemeState = ref.watch(sharedThemeStateProvider);
    final sharedThemeStateNotifier =
        ref.watch(sharedThemeStateProvider.notifier);
    return Column(
      children: TargetPlatform.values.fold([], (pe, v) {
        return [
          ...pe,
          Theme(
            data: Theme.of(context).copyWith(platform: v),
            child: Row(
              children: [
                Expanded(
                  child: SwitchListTile.adaptive(
                    title: const Text('Switch'),
                    subtitle: Text('Platform: ${v.name}'),
                    value: sharedThemeState[_switchKey] ?? false,
                    onChanged: (v) {
                      sharedThemeStateNotifier.state = Map.of({
                        ...sharedThemeState,
                        _switchKey: v,
                      });
                    },
                  ),
                ),
                Spacers.h16,
                Expanded(
                  child: SwitchListTile.adaptive(
                    title: const Text('Switch'),
                    subtitle: Text('Platform: ${v.name}'),
                    value: sharedThemeState[_switchKey] ?? false,
                    onChanged: null,
                  ),
                ),
              ],
            ),
          ),
          Spacers.v16,
        ];
      }),
    );
  }
}
