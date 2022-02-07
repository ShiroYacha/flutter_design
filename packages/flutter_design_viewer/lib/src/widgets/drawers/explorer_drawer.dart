import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:flutter_design_viewer/src/measures.dart';
import 'package:flutter_design_viewer/src/widgets/items/brandings.dart';
import 'package:flutter_design_viewer/src/widgets/items/images.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:vrouter/vrouter.dart';

class ExplorerDrawer extends HookConsumerWidget {
  const ExplorerDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(VRouter.of(context).path);
    final theme = Theme.of(context);
    final branding = ref.watch(brandingProvider);
    final rootPages = ref.watch(rootPagesProvider);
    return Container(
      padding: SpacingDesign.paddingVertical16,
      color: theme.backgroundColor,
      width: 300,
      child: Column(
        children: [
          Paddings.horizontal16(child: branding ?? const DefaultBranding()),
          Spacers.v20(),
          ...rootPages.fold(
            [],
            (previousValue, element) => [
              ...previousValue,
              PageGroup(pageGroup: element),
              const Divider(),
            ],
          ),
        ],
      ),
    );
  }
}

class PageGroup extends HookConsumerWidget {
  final ViewerPageGroup pageGroup;
  const PageGroup({
    required this.pageGroup,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Paddings.all20(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PageGroupHeader(pageGroup: pageGroup),
          Spacers.v10(),
          ...pageGroup.children.map((e) => PageGroupNode(viewerPage: e)),
          Spacers.v10(),
        ],
      ),
    );
  }
}

class PageGroupNode extends HookConsumerWidget {
  final ViewerPageUnion viewerPage;
  const PageGroupNode({
    required this.viewerPage,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final router = VRouter.of(context);
    final isTopLevel = viewerPage.namespace.length <= 1;
    final label = SizedBox(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.0 * (viewerPage.namespace.length - 1),
          top: 8,
          bottom: 8,
        ),
        child: Text(
          viewerPage.title,
          style: theme.textTheme.subtitle1!.copyWith(
            fontWeight: isTopLevel ? FontWeight.w400 : FontWeight.w300,
            color: router.path == viewerPage.segmentsUrl
                ? theme.highlightColor
                : null,
          ),
        ),
      ),
    );
    return viewerPage.maybeMap(
      group: (group) => ExpandablePanel(
        theme: ExpandableThemeData(
          hasIcon: group.children.isNotEmpty,
          iconSize: 16,
          iconColor: theme.colorScheme.onBackground,
          iconPlacement: ExpandablePanelIconPlacement.right,
          headerAlignment: ExpandablePanelHeaderAlignment.center,
          expandIcon: Ionicons.chevron_forward_outline,
          collapseIcon: Ionicons.chevron_down_outline,
          tapBodyToCollapse: false,
          tapHeaderToExpand: true,
        ),
        header: label,
        collapsed: const SizedBox.shrink(),
        expanded: Column(
          children: group.children.fold(
            [],
            (previousValue, element) => [
              ...previousValue,
              PageGroupNode(
                viewerPage: element,
              )
            ],
          ),
        ),
      ),
      orElse: () => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: label,
          onTap: () {
            router.toSegments(viewerPage.segments);
          },
        ),
      ),
    );
  }
}

class PageGroupHeader extends StatelessWidget {
  const PageGroupHeader({
    Key? key,
    required this.pageGroup,
  }) : super(key: key);

  final ViewerPageGroup pageGroup;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        if (pageGroup.glyph != null)
          Glyph(
            glyph: pageGroup.glyph!,
            color: pageGroup.color,
          ),
        Spacers.h6(),
        Text(
          pageGroup.title,
          style: theme.textTheme.subtitle2?.copyWith(color: pageGroup.color),
        ),
      ],
    );
  }
}
