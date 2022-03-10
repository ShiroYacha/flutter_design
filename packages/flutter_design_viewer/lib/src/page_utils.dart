import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';

const ViewerParagraphSection _comingSoonSection = ViewerParagraphSection(
    id: 'coming_soon', title: '...', description: 'Coming soon ...');

/// Build a dedicated page group to showcase the provided themes [ThemeData]
ViewerGroupPage buildThemePageGroup({
  required Map<String, ThemeData> themes,
}) {
  return const ViewerGroupPage(
    id: 'themes',
    namespace: [],
    title: 'Themes',
    children: [
      ViewerDocumentPage(
        id: 'colors',
        namespace: ['themes'],
        title: 'Colors',
        sections: [_comingSoonSection],
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
