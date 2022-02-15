import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:viewer_example/docs.dart';
import 'package:viewer_example/page_factory.design.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    DesignSystemViewerApp(
      settings: ViewerSettings(
        enabledLocales: {
          'en-US': const Locale('en', 'US'),
        },
        enabledThemes: {
          'light': ThemeData.light(),
          'dark': ThemeData.dark(),
        },
      ),
      pageGroups: [
        ...buildGroupedPageTrees(docPages),
        buildComponentPageTree(componentPages: generatedComponentPages),
      ],
    ),
  );
}
