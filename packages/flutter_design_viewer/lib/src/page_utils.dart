import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/src/widgets/items/theme_items.dart';

const ViewerParagraphSection _comingSoonSection = ViewerParagraphSection(
    id: 'coming_soon', title: '...', description: 'Coming soon ...');

/// Build a dedicated page group to showcase the provided themes [ThemeData]
ViewerGroupPage buildThemePageGroup({
  /// Provided map of [ThemeData]
  required Map<String, ThemeData> themes,

  /// Prove the list of all font icons are used in your design system. If not provided
  /// a set of default [Icons] will be shown.
  List<IconData>? iconDataset,

  /// Indicates if Material 3 theming should be applied. It's default to [false] for
  /// now as Material 3 isn't officially fully supported yet. Note that not all widgets are landed
  /// at the time of writing so we might gradually support more Material 3 widgets over time.
  ///
  ///
  /// This flag  will have both explicit and implicit effects on the theme
  /// visualizers:
  ///
  ///   * Explicit effects: the visualizer will explicitly render Material 3 elements,
  /// e.g. for color schemes the Material 3 uses some different
  /// tokens such as [primaryContainer] instead of [primaryVariant]; for typography,
  /// Material 3 uses [displayLarge], [displayMedium], [displaySmall], etc. as oppose
  /// to [headline1], [headline2], etc. for widgets, Material 3 might contain a different
  /// set of widgets so they will be shown separately.
  ///
  ///   * Implicit effects: there are some widgets that are common between Material 3
  /// and Material 2, e.g. FABs. However, they have different visuals and they are implicitely
  /// configured (e.g. using [useMaterial3] flag on the [ThemeData]). At the time of writing,
  /// many new Material 3 widget themes and styling have not landed on the stable branch.
  /// Hence, even configured to use Material 3, you might not see the difference if
  /// the feature hasn't been landed on your Flutter SDK version.
  ///
  /// See more:
  ///   * https://github.com/flutter/flutter/issues/91605
  bool useMaterial3 = false,
}) {
  return ViewerGroupPage(
    id: 'themes',
    namespace: [],
    title: 'Themes',
    children: [
      ViewerDocumentPage(
        id: 'colors',
        namespace: ['themes'],
        title: 'Colors',
        subtitle: useMaterial3
            ? 'Colors defined using the [Material 3 color system](https://m3.material.io/styles/color/the-color-system/color-roles).'
            : 'Colors defined using the [Material 2 color system](https://material.io/design/color/the-color-system.html#color-usage-and-palettes).',
        sections: [
          ViewerSectionUnion.paragraph(
              id: 'schemes',
              title: 'ColorScheme',
              description:
                  'Colors defined in [ColorScheme](https://api.flutter.dev/flutter/material/ColorScheme-class.html).',
              contents: <ViewerCollectionItemUnion>[
                ViewerWidgetCollectionItem(
                  widget: ThemeViewersCollection(
                    renderWithBackgroundPattern: false,
                    builder: (ctx) =>
                        ColorSchemeViewer(useMaterial3: useMaterial3),
                  ),
                ),
              ]),
        ],
      ),
      ViewerDocumentPage(
        id: 'typography',
        namespace: ['themes'],
        title: 'Typography',
        subtitle: useMaterial3
            ? 'Typography defined using the [Material 3 typography system](https://m3.material.io/styles/typography/overview).'
            : 'Typography defined using the [Material 2 typography system](https://material.io/design/typography/the-type-system.html#type-scale).',
        sections: [
          ViewerSectionUnion.paragraph(
            id: 'textThemes',
            title: 'Text themes',
            description:
                'Text themes defined in [ThemeData.textTheme](https://api.flutter.dev/flutter/material/ThemeData-class.html).',
            contents: <ViewerCollectionItemUnion>[
              ViewerWidgetCollectionItem(
                widget: ThemeViewersCollection(
                  builder: (ctx) =>
                      TypographyViewer(useMaterial3: useMaterial3),
                ),
              ),
            ],
          ),
        ],
      ),
      ViewerDocumentPage(
        id: 'iconography',
        namespace: ['themes'],
        title: 'Iconography',
        sections: [
          ViewerSectionUnion.paragraph(
            id: 'icons',
            title: 'Icons',
            description: iconDataset != null
                ? 'Provided set of icons using the default icon theme.'
                : '''
Set of default [MaterialIcons](https://api.flutter.dev/flutter/material/Icons-class.html) using the default icon theme.
You can provide your own set of icons using the `iconDataset` field on method `buildThemePageGroup`.
''',
            contents: <ViewerCollectionItemUnion>[
              ViewerWidgetCollectionItem(
                widget: ThemeViewersCollection(
                  renderWithBackgroundPattern: false,
                  renderWithBackgroundColor: true,
                  builder: (ctx) => IconViewer(iconDataset),
                ),
              ),
            ],
          ),
        ],
      ),
      ViewerGroupPage(
        id: 'actions',
        namespace: ['themes'],
        title: 'Actions',
        children: [
          ViewerDocumentPage(
            id: 'buttons',
            namespace: ['themes', 'actions'],
            title: 'Buttons',
            subtitle: '',
            sections: [
              ViewerSectionUnion.paragraph(
                id: 'button_themes',
                title: 'Button themes',
                description: '''
Standard buttons rendered using the provided theme data, including:
- [ElevatedButton](https://api.flutter.dev/flutter/material/ElevatedButton-class.html) using [ElevatedButtonThemeData](https://api.flutter.dev/flutter/material/ElevatedButtonThemeData-class.html)
- [OutlinedButton](https://api.flutter.dev/flutter/material/OutlinedButton-class.html) using [OutlinedButtonThemeData](https://api.flutter.dev/flutter/material/OutlinedButtonThemeData-class.html)
- [TextButton](https://api.flutter.dev/flutter/material/TextButton-class.html) using [TextButtonThemeData](https://api.flutter.dev/flutter/material/TextButtonThemeData-class.html)
- [FloatingActionButton](https://api.flutter.dev/flutter/material/FloatingActionButton-class.html) using [FloatingActionButtonThemeData](https://api.flutter.dev/flutter/material/FloatingActionButtonThemeData-class.html)
''',
                contents: <ViewerCollectionItemUnion>[
                  ViewerWidgetCollectionItem(
                    widget: ThemeViewersCollection(
                      builder: (ctx) => const ButtonStyleViewer(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          ViewerDocumentPage(
            id: 'selections',
            namespace: ['themes', 'actions'],
            title: 'Selections',
            sections: [
              ViewerSectionUnion.paragraph(
                id: 'selectors',
                title: 'Selector themes',
                description: '''
Standard selectors rendered using the provided theme data, including:
- [Switch](https://api.flutter.dev/flutter/material/Switch-class.html) using [SwitchThemeData](https://api.flutter.dev/flutter/material/SwitchThemeData-class.html)
- [Checkbox](https://api.flutter.dev/flutter/material/Checkbox-class.html) using [CheckboxThemeData](https://api.flutter.dev/flutter/material/CheckboxThemeData-class.html)
- [Radio](https://api.flutter.dev/flutter/material/Radio-class.html) using [RadioThemeData](https://api.flutter.dev/flutter/material/RadioThemeData-class.html)

Note that all selectors are rendered using the ListTile composition class, e.g. [SwitchListTile](https://api.flutter.dev/flutter/material/SwitchListTile-class.html).
''',
                contents: <ViewerCollectionItemUnion>[
                  ViewerWidgetCollectionItem(
                    widget: ThemeViewersCollection(
                      builder: (ctx) => const SelectorsStyleViewer(),
                    ),
                  ),
                  const ViewerTextCollectionItem(
                    description: '''
Here are the adaptive variants of the selectors, using namely the `.adaptive` factory constructor if available. 
It takes the [TargetPlatform](https://api.flutter.dev/flutter/foundation/TargetPlatform.html) of the ambient `ThemeData`.
''',
                  ),
                  ViewerWidgetCollectionItem(
                    widget: ThemeViewersCollection(
                      builder: (ctx) => const SelectorsAdaptiveStyleViewer(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // ViewerDocumentPage(
          //   id: 'inputs',
          //   namespace: ['themes', 'actions'],
          //   title: 'Inputs',
          //   sections: [_comingSoonSection],
          // ),
        ],
      ),
    ],
  );
}
