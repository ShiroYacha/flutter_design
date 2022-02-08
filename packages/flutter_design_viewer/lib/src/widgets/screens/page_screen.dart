import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/src/measures.dart';
import 'package:flutter_design_viewer/src/widgets/scaffolds/root_scaffold.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme.dart';

final currentPageProvider =
    Provider<ViewerPageUnion>((ref) => throw UnimplementedError());

class PageScreen extends HookConsumerWidget {
  const PageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final currentPage = ref.watch(currentPageProvider);
    return RootScaffold(
      child: ListView(
        children: [
          SelectableText.rich(
            TextSpan(
              text: '${currentPage.title}\n\n',
              style: theme.textTheme.headline2?.buildExtraBold(context),
              children: [
                if (currentPage.description != null)
                  TextSpan(
                    text: currentPage.description!,
                    style: theme.textTheme.headline5,
                  ),
              ],
            ),
          ),
          Spacers.v10(),
        ],
      ),
    );
  }
}
