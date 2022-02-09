import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/src/measures.dart';
import 'package:flutter_design_viewer/src/widgets/items/page_items.dart';
import 'package:flutter_design_viewer/src/widgets/scaffolds/root_scaffold.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentPageProvider =
    Provider<ViewerDocumentPage>((ref) => throw UnimplementedError());

class PageScreen extends HookConsumerWidget {
  const PageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(currentPageProvider);
    return RootScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            style: SectionHeaderStyle.page(context),
            title: currentPage.title,
            description: currentPage.description,
          ),
          Spacers.v20,
          TableOfContents(sections: currentPage.sections),
          ...currentPage.sections.map(
            (e) => e.map(
              paragraph: (paragraph) => ParagraphSection(
                paragraph: paragraph,
              ),
              primaryComponent: (primaryComponent) => Container(),
              apiDocs: (apiDocs) => Container(),
            ),
          ),
        ],
      ),
    );
  }
}
