import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:ionicons/ionicons.dart';

void main() {
  runApp(
    DesignSystemViewerApp(
      pageGroups: [
        ViewerPageGroup(
          id: 'get_started',
          title: 'GET STARTED',
          color: Colors.teal.shade400,
          glyph: const ViewerGlyphUnion.icon(icon: Ionicons.compass_outline),
          children: const [
            ViewerDocumentationPage(
              id: 'intro',
              namespace: ['get_started'],
              title: 'Introduction',
              content: 'Lorem ipsum',
            ),
            ViewerGroupPage(
                id: 'foundations',
                namespace: ['get_started'],
                title: 'Foundations',
                children: [
                  ViewerDocumentationPage(
                    id: 'colors',
                    namespace: ['get_started', 'foundations'],
                    title: 'Colors',
                    content: 'Lorem ipsum',
                  ),
                ]),
          ],
        ),
        ViewerPageGroup(
          id: 'design',
          title: 'DESIGN',
          color: Colors.green.shade400,
          glyph: const ViewerGlyphUnion.icon(icon: Ionicons.laptop_outline),
          children: const [],
        ),
        ViewerPageGroup(
          id: 'develop',
          title: 'DEVELOP',
          color: Colors.orange.shade400,
          glyph: const ViewerGlyphUnion.icon(icon: Ionicons.code_outline),
          children: const [],
        ),
        ViewerPageGroup(
          id: 'components',
          title: 'COMPONENTS',
          color: Colors.purple.shade400,
          glyph: const ViewerGlyphUnion.icon(icon: Ionicons.grid_outline),
          children: const [],
        ),
      ],
    ),
  );
}
