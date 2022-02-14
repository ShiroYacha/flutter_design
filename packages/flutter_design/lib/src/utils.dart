import 'dart:math';

import 'package:recase/recase.dart';

import 'models/pages.dart';

ViewerGroupPage buildComponentPageTree({
  required List<ViewerDocumentPage> componentPages,
  String id = 'components',
}) {
  // Prepand the [id] to all namespaces of the generated component document pages
  return buildGroupedPageTrees(
    componentPages
        .map((e) => e.copyWith(namespace: [id, ...e.namespace]))
        .toList(),
    compressLeaf: true,
    sortById: true,
  ).single;
}

// TODO: improve algo
List<ViewerGroupPage> buildGroupedPageTrees(
  List<ViewerDocumentPage> documentPages, {
  bool compressLeaf = false,
  bool sortById = false,
}) {
  String namespaceToId(Iterable<String> namespace) => namespace.join(',');
  List<String> idToNamespace(String id) => id.split(',');
  int sortPageById(ViewerPageUnion a, ViewerPageUnion b) =>
      a.id.compareTo(b.id);
  // Demote a parent namespace group if it only contains a single child.
  // e.g. a/b/p1 -> a/b, where now "b" is the new document page
  final compressedDocumentPages = <ViewerDocumentPage>[];
  for (final page in documentPages) {
    if (page.namespace.isNotEmpty &&
        documentPages.any((e) =>
            e.namespace.isNotEmpty &&
            e.namespace.last != page.namespace.last)) {
      final parentId = page.namespace.last;
      compressedDocumentPages.add(
        page.copyWith(
          id: parentId,
          namespace: page.namespace.take(page.namespace.length - 1).toList(),
        ),
      );
    } else {
      compressedDocumentPages.add(page);
    }
  }
  // Sort pages from bottom-up and group them based on the depth
  Map<int, List<ViewerPageUnion>> pageMap = {};
  for (final page in compressLeaf ? compressedDocumentPages : documentPages) {
    final pages = pageMap[page.namespace.length];
    pageMap[page.namespace.length] = [
      if (pages != null) ...pages,
      page,
    ];
    if (sortById) {
      pageMap[page.namespace.length]!.sort(sortPageById);
    }
  }
  while (pageMap.keys.any((e) => e > 0)) {
    final maxKey = pageMap.keys.fold<int>(0, (pv, e) => max(pv, e));
    // Here the parent key is the full namespace segment (to avoid same id albeit in different roots)
    // e.g. ['a', 'b', 'c'] -> parent = 'a,b' & child = 'c'
    final parentMap = <String, List<ViewerPageUnion>>{};
    // Gather all parent and children map
    for (final page in pageMap[maxKey]!) {
      final parentId = namespaceToId(page.namespace);
      final children = parentMap[parentId];
      parentMap[parentId] = [
        if (children != null) ...children,
        page,
      ];
    }
    // Remove page from page map (as they will be merged into parent)
    pageMap.remove(maxKey);
    // Construct parents and put them back into page map
    for (final id in parentMap.keys) {
      final segments = idToNamespace(id);
      final children = parentMap[id]!;
      final parent = ViewerGroupPage(
        id: segments.last,
        namespace: segments.take(segments.length - 1).toList(),
        title: ReCase(segments.last).sentenceCase,
        children: children,
      );
      final pages = pageMap[parent.namespace.length];
      pageMap[parent.namespace.length] = [
        if (pages != null) ...pages,
        parent,
      ];
      if (sortById) {
        pageMap[parent.namespace.length]!.sort(sortPageById);
      }
    }
  }
  return pageMap[0]?.cast<ViewerGroupPage>().toList() ?? [];
}
