import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:ionicons/ionicons.dart';
import 'package:json_theme/json_theme.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:viewer_example/docs.dart';
import 'package:viewer_example/page_factory.design.dart';

import 'data_builders.dart';

void main() async {
  // Load themes using apppainter & json_theme
  WidgetsFlutterBinding.ensureInitialized();
  // Recommended to make history browsing work better in web
  setPathUrlStrategy();
  final themeDataset = await Future.wait([
    'assets/themes/appainter_theme_light.json',
    'assets/themes/appainter_theme_dark.json'
  ].map(_compileThemeDataFromJson));
  final themes = {
    'light': themeDataset[0],
    'dark': themeDataset[1],
  };
  runApp(
    DesignSystemViewerApp(
      // initialRoute: '/components/widgets/actions/toggles',
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
        // Theme page
        buildThemePageGroup(
          themes: themes,
          iconDataset: List.generate(
            0xee33 - 0xe900,
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

Future<ThemeData> _compileThemeDataFromJson(String path) async {
  final themeStr = await rootBundle.loadString(path);
  final themeJson = jsonDecode(themeStr);
  return ThemeDecoder.decodeThemeData(themeJson)!;
}
