import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:flutter_design_viewer/src/measures.dart';
import 'package:flutter_design_viewer/src/widgets/items/page_items.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../scaffolds/root_scaffold.dart';

final currentPageProvider =
    Provider<ViewerDocumentPage>((ref) => throw UnimplementedError());

class PageScreen extends HookConsumerWidget {
  const PageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewerState = ref.watch(viewerStateProvider);
    final currentPage = ref.watch(currentPageProvider);
    final mainScrollController = ref.watch(mainScrollControllerProvider);
    return SingleChildScrollView(
      controller: mainScrollController,
      padding: SpacingDesign.paddingAll40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleDescription(
            style: TextDescriptionStyle.page(context),
            title: currentPage.title,
            description: currentPage.subtitle,
          ),
          Spacers.v20,
          TableOfContents(sections: currentPage.sections),
          Spacers.v20,
          TitleDescription(
            style: TextDescriptionStyle.paragraph(context),
            description: currentPage.description,
          ),
          Spacers.v20,
          ...currentPage.sections.map(
            (e) => Container(
              key:
                  ValueKey('${currentPage.id}_${e.id}_${viewerState.hashCode}'),
              child: e.map(
                paragraph: (paragraph) =>
                    ParagraphSection(paragraph: paragraph),
                component: (component) =>
                    ComponentSection(component: component),
                apiDocs: (apiDocs) => ApiDocsSection(
                  apiDocs: apiDocs,
                  components: currentPage.sections
                      .whereType<ViewerComponentSection>()
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
