import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:ionicons/ionicons.dart';

void main() {
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
      pageGroups: const [
        ViewerPageGroup(
          id: 'get_started',
          title: 'GET STARTED',
          glyph: ViewerGlyphUnion.icon(
            icon: Ionicons.compass_outline,
            size: 14,
          ),
          children: [
            ViewerDocumentationPage(
              id: 'intro',
              namespace: ['get_started'],
              title: 'Introduction',
              description:
                  'Wanda is Wonderflow\'s open-source design system built for products and digital experiences.',
              content: 'Lorem ipsum',
            ),
          ],
        ),
        ViewerPageGroup(
          id: 'design',
          title: 'DESIGN',
          glyph: ViewerGlyphUnion.icon(
            icon: Ionicons.laptop_outline,
            size: 14,
          ),
          children: [
            ViewerDocumentationPage(
              id: 'brand',
              namespace: ['design'],
              title: 'Brand',
              description: 'Wonderflow\'s digital identity',
              content: 'Lorem ipsum',
            ),
            ViewerGroupPage(
              id: 'foundations',
              namespace: ['design'],
              title: 'Foundations',
              children: [
                ViewerDocumentationPage(
                  id: 'colors',
                  namespace: ['design', 'foundations'],
                  title: 'Colors',
                  content: 'Lorem ipsum',
                ),
                ViewerDocumentationPage(
                  id: 'typography',
                  namespace: ['design', 'foundations'],
                  title: 'Typography',
                  content: 'Lorem ipsum',
                ),
                ViewerDocumentationPage(
                  id: 'elevations',
                  namespace: ['design', 'foundations'],
                  title: 'Elevations',
                  content: 'Lorem ipsum',
                ),
              ],
            ),
            ViewerDocumentationPage(
              id: 'iconography',
              namespace: ['design'],
              title: 'Iconography',
              content: 'Lorem ipsum',
            ),
            ViewerDocumentationPage(
              id: 'themes',
              namespace: ['design'],
              title: 'Themes',
              content: 'Lorem ipsum',
            ),
            ViewerGroupPage(
              id: 'recipes',
              namespace: ['design'],
              title: 'Recipes',
              children: [
                ViewerDocumentationPage(
                  id: 'buttons',
                  namespace: ['design', 'recipes'],
                  title: 'Buttons',
                  content: 'Lorem ipsum',
                ),
                ViewerDocumentationPage(
                  id: 'dropdown',
                  namespace: ['design', 'recipes'],
                  title: 'Dropdown',
                  content: 'Lorem ipsum',
                ),
              ],
            ),
          ],
        ),
        ViewerPageGroup(
          id: 'develop',
          title: 'DEVELOP',
          glyph: ViewerGlyphUnion.icon(
            icon: Ionicons.code_outline,
            size: 14,
          ),
          children: [],
        ),
        ViewerPageGroup(
          id: 'components',
          title: 'COMPONENTS',
          glyph: ViewerGlyphUnion.icon(
            icon: Ionicons.grid_outline,
            size: 14,
          ),
          children: [
            ViewerCatalogPage(
                id: 'button',
                namespace: ['components'],
                title: 'Button',
                description:
                    'A button is a box area or text that communicates and triggers user actions when clicked.',
                catalogBuilderId: 'button_catalog'),
          ],
        ),
      ],
    ),
  );
}
