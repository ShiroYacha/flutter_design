import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:viewer_example/docs.dart';
import 'package:viewer_example/page_factory.design.dart';

import 'data_builders.dart';

void main() async {
  // Load themes using apppainter & json_theme
  WidgetsFlutterBinding.ensureInitialized();
  // Recommended to make history browsing work better in web
  setPathUrlStrategy();
  // Prepare material themes
  final themes = {
    'light': ThemeData(
      colorSchemeSeed: Colors.teal,
      brightness: Brightness.light,
    ).copyWith(useMaterial3: false),
    'dark': ThemeData(
      colorSchemeSeed: Colors.teal,
      brightness: Brightness.dark,
    ).copyWith(useMaterial3: false),
  };
  runApp(
    DesignSystemViewerApp(
      settings: ViewerSettings(
        enabledLocales: {
          'en-US': const Locale('en', 'US'),
          'de-DE': const Locale('de', 'DE'),
        },
        enabledThemes: themes,
        githubLink:
            'https://github.com/ShiroYacha/flutter_design/tree/main/packages/flutter_design_viewer/example',
        widgetDisplayHeight: 500,
      ),
      dataBuilders: {
        String: [
          // Need to use a condition here to use the data builder constructor's default value
          ([p]) => p != null && p is String
              ? MyStringDataBuilder(p)
              : MyStringDataBuilder(),
        ]
      },
      pageGroups: [
        // Your custom pages
        ...buildGroupedPageTrees(docPages),
        // Theme pages (you can also opt out of the material 3 themes)
        buildThemePageGroup(
          themes: themes,
          useMaterial3: false,
          iconDataset: List.generate(
            0xea33 - 0xe900,
            (index) => IoniconsData(index + 0xe900),
            growable: false,
          ),
        ),
        // Generated @design/@Design annotated pages
        buildComponentPageTree(componentPages: generatedComponentPages),
      ],
    ),
  );
}
