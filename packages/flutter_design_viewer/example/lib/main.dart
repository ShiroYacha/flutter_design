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
            ViewerDocumentPage(
              id: 'intro',
              namespace: ['get_started'],
              title: 'Introduction',
              description:
                  'Wanda is Wonderflow\'s open-source design system built for products and digital experiences.',
              tags: ['guideline'],
              sections: [
                ViewerSectionUnion.paragraph(
                  id: 'overview',
                  title: 'Overview',
                  description: '''
A Design System is the single source of truth which groups all the elements that will allow teams to build digital products.
\n
We, as diverse humans, have our own unique way to think about problems and we walk different roads to find solutions. Usually, that is celebrated, but when cooperating to build products, that could lead to an uncoordinated user experience. Wanda aims to provide a solid guidance for designers and developers, to reduce the risks of divergence.
                    ''',
                ),
                ViewerSectionUnion.paragraph(
                  id: 'overview2',
                  title: 'Overview2',
                  description: '''
A Design System is the single source of truth which groups all the elements that will allow teams to build digital products.
\n
We, as diverse humans, have our own unique way to think about problems and we walk different roads to find solutions. Usually, that is celebrated, but when cooperating to build products, that could lead to an uncoordinated user experience. Wanda aims to provide a solid guidance for designers and developers, to reduce the risks of divergence.
                    ''',
                ),
              ],
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
            ViewerDocumentPage(
              id: 'brand',
              namespace: ['design'],
              title: 'Brand',
              description: 'Wonderflow\'s digital identity',
            ),
            ViewerGroupPage(
              id: 'foundations',
              namespace: ['design'],
              title: 'Foundations',
              children: [
                ViewerDocumentPage(
                  id: 'colors',
                  namespace: ['design', 'foundations'],
                  title: 'Colors',
                ),
                ViewerDocumentPage(
                  id: 'typography',
                  namespace: ['design', 'foundations'],
                  title: 'Typography',
                ),
                ViewerDocumentPage(
                  id: 'elevations',
                  namespace: ['design', 'foundations'],
                  title: 'Elevations',
                ),
              ],
            ),
            ViewerDocumentPage(
              id: 'iconography',
              namespace: ['design'],
              title: 'Iconography',
            ),
            ViewerDocumentPage(
              id: 'themes',
              namespace: ['design'],
              title: 'Themes',
            ),
            ViewerGroupPage(
              id: 'recipes',
              namespace: ['design'],
              title: 'Recipes',
              children: [
                ViewerDocumentPage(
                  id: 'buttons',
                  namespace: ['design', 'recipes'],
                  title: 'Buttons',
                ),
                ViewerDocumentPage(
                  id: 'dropdown',
                  namespace: ['design', 'recipes'],
                  title: 'Dropdown',
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
            ViewerDocumentPage(
              id: 'button',
              namespace: ['components'],
              title: 'Button',
              description:
                  'A button is a box area or text that communicates and triggers user actions when clicked.',
            ),
          ],
        ),
      ],
    ),
  );
}
