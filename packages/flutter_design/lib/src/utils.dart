import 'dart:math';

import 'package:recase/recase.dart';

import 'models/pages.dart';

/// Take a list of flat document pages and group & layer them into a single component tree.
/// Typically you can pass the generated [generatedComponentPages] via `flutter_design_codegen`.
ViewerGroupPage buildComponentPageTree({
  required List<ViewerDocumentPage> componentPages,

  /// Id of the component root node. This will also be converted to the node name.
  String id = 'components',

  /// See [buildGroupedPageTrees]
  bool compressLeaf = true,

  /// See [buildGroupedPageTrees]
  bool sortById = true,
}) {
  // Prepand the [id] to all namespaces of the generated component document pages
  return buildGroupedPageTrees(
    componentPages
        .map((e) => e.copyWith(namespace: [id, ...e.namespace]))
        .toList(),
    compressLeaf: compressLeaf,
    sortById: sortById,
  ).single;
}

/// Generate a list of [ViewerGroupPage] by grouping and layering document pages
/// with group pages based on the [namespace]. The returned results will be the
/// first children nodes in a tree structure.
List<ViewerGroupPage> buildGroupedPageTrees(
  List<ViewerDocumentPage> documentPages, {

  /// Indicates if a parent node with a single child leaf should be compressed into
  /// a single leaf.
  ///
  /// Example: g1/g2/p1 -> g1/g2, where now "g2" is the new document page as the [id]
  /// and [namespace] of "g2" is copied to "p1".
  bool compressLeaf = false,

  /// Indicates if the nodes should be sorted by their [id]s.
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
        !documentPages.any((e) =>
            e.id != page.id &&
            e.namespace.isNotEmpty &&
            e.namespace.last == page.namespace.last)) {
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
