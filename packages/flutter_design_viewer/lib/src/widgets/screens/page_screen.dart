import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:flutter_design_viewer/src/measures.dart';
import 'package:flutter_design_viewer/src/widgets/items/page_items.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentPageProvider =
    Provider<ViewerDocumentPage>((ref) => throw UnimplementedError());

class PageScreen extends HookConsumerWidget {
  const PageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewerState = ref.watch(viewerStateProvider);
    final currentPage = ref.watch(currentPageProvider);
    return SingleChildScrollView(
      controller: useScrollController(),
      padding: SpacingDesign.paddingAll40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextDescription(
            style: TextDescriptionStyle.page(context),
            title: currentPage.title,
            description: currentPage.description,
          ),
          Spacers.v20,
          TableOfContents(sections: currentPage.sections),
          ...currentPage.sections.map(
            (e) => Container(
              key:
                  ValueKey('${currentPage.id}_${e.id}_${viewerState.hashCode}'),
              child: e.map(
                paragraph: (paragraph) =>
                    ParagraphSection(paragraph: paragraph),
                component: (component) =>
                    ComponentSection(component: component),
                examples: (examples) => Container(),
                apiDocs: (apiDocs) => Container(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
