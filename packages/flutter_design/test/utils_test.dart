// Import the test package and Counter class
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('buildPageGroupsTree', () {
    test('empty', () {
      final nodes = buildGroupedPageTrees([]);
      expect(nodes.length, 0);
    });
    test('only documents, simple structure', () {
      final nodes = buildGroupedPageTrees(_generateDocumentPages([
        'f/p4',
        'a/b/p1',
        'a/b/c/p2',
        'a/d/e/p3',
      ]));
      // TODO: impl better traverse tests
      expect(nodes.length, 2);
      expect(nodes[0].id, 'a');
      expect(nodes[0].children.length, 2);
      expect(nodes[1].id, 'f');
      expect(nodes[1].children.length, 1);
    });
  });
}

List<ViewerDocumentPage> _generateDocumentPages(List<String> paths) {
  return paths.map((e) {
    final segments = e.split('/');
    return ViewerDocumentPage(
      id: segments.last,
      namespace: segments.take(segments.length - 1).toList(),
      title: e,
    );
  }).toList();
}
