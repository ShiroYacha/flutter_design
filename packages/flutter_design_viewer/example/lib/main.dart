import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:viewer_example/docs.dart';
import 'package:viewer_example/page_factory.design.dart';

import 'data_builders.dart';

void main() {
  // Recommended to make history browsing work better in web
  setPathUrlStrategy();
  runApp(
    DesignSystemViewerApp(
      settings: ViewerSettings(
        enabledLocales: {
          'en-US': const Locale('en', 'US'),
          'de-DE': const Locale('de', 'DE'),
        },
        enabledThemes: {
          'light': ThemeData.light(),
          'dark': ThemeData.dark(),
        },
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
        // Generated @design/@Design annotated pages
        buildComponentPageTree(componentPages: generatedComponentPages),
      ],
    ),
  );
}
