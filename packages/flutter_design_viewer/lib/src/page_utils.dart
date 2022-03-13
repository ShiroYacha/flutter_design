import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/src/widgets/items/theme_items.dart';

const ViewerParagraphSection _comingSoonSection = ViewerParagraphSection(
    id: 'coming_soon', title: '...', description: 'Coming soon ...');

/// Build a dedicated page group to showcase the provided themes [ThemeData]
ViewerGroupPage buildThemePageGroup({
  required Map<String, ThemeData> themes,
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
        subtitle:
            'Colors defined using the [Material color system](https://m3.material.io/styles/color/the-color-system/color-roles).',
        sections: [
          ViewerSectionUnion.paragraph(
              id: 'schemes',
              title: 'ColorScheme',
              description:
                  'Colors defined in [ColorScheme](https://api.flutter.dev/flutter/material/ColorScheme-class.html).',
              contents: <ViewerCollectionItemUnion>[
                ViewerWidgetCollectionItem(
                  widget: ThemeViewersCollection(
                    builder: (ctx) => const ColorSchemeViewer(),
                  ),
                ),
              ]),
        ],
      ),
      ViewerDocumentPage(
        id: 'typography',
        namespace: ['themes'],
        title: 'Typography',
        sections: [_comingSoonSection],
      ),
      ViewerDocumentPage(
        id: 'iconography',
        namespace: ['themes'],
        title: 'Iconography',
        sections: [_comingSoonSection],
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
            sections: [_comingSoonSection],
          ),
          ViewerDocumentPage(
            id: 'selections',
            namespace: ['themes', 'actions'],
            title: 'Selections',
            sections: [_comingSoonSection],
          ),
          ViewerDocumentPage(
            id: 'inputs',
            namespace: ['themes', 'actions'],
            title: 'Inputs',
            sections: [_comingSoonSection],
          ),
        ],
      ),
    ],
  );
}
