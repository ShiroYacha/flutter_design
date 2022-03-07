import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:flutter_design_viewer/src/measures.dart';
import 'package:flutter_design_viewer/src/widgets/items/buttons.dart';
import 'package:flutter_design_viewer/src/widgets/scaffolds/root_scaffold.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:vrouter/vrouter.dart';

class ExplorerDrawer extends HookConsumerWidget {
  const ExplorerDrawer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final branding = ref.watch(brandingProvider);
    final rootPages = ref.watch(pageGroupsProvider);
    return Container(
      padding: SpacingDesign.paddingVertical16,
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        border: Border.all(
          color: theme.dividerColor,
          width: 0.5,
        ),
      ),
      width: 300,
      child: ListView(
        key: const PageStorageKey<String>('ExplorerListView'),
        controller: useScrollController(),
        children: [
          GestureDetector(
            onTap: () {
              VRouter.of(context).to('/');
            },
            child: Paddings.horizontal16(
              child: branding,
            ),
          ).asMouseClickRegion,
          Spacers.v20,
          ...rootPages.fold(
            [],
            (previousValue, element) => [
              ...previousValue,
              PageGroup(groupPage: element),
              const Divider(),
            ],
          ),
        ],
      ),
    );
  }
}

final collapsedGroupUrisProvider = StateProvider.autoDispose((ref) => []);

class PageGroup extends HookConsumerWidget {
  final ViewerGroupPage groupPage;
  const PageGroup({
    required this.groupPage,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Paddings.all20(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PageGroupHeader(groupPage: groupPage),
          Spacers.v10,
          ...groupPage.children.map((e) => PageGroupNode(viewerPage: e)),
          Spacers.v10,
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
    final rootScaffoldKey = ref.watch(rootScaffoldKeyProvider);
    final isSelected = router.path == viewerPage.uri;
    final label = SizedBox(
      width: double.infinity,
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
            color: isSelected ? theme.highlightColor : null,
          ),
        ),
      ),
    );
    final expandExplorerNodesByDefault = ref.watch(viewerStateProvider
        .select((value) => value.expandExplorerNodesByDefault));
    final collapsedGroupUris = ref.watch(collapsedGroupUrisProvider);
    final collapsedGroupUrisNotifier =
        ref.watch(collapsedGroupUrisProvider.notifier);
    return viewerPage.maybeMap(
        group: (group) {
          final controller = ExpandableController(
            initialExpanded: (expandExplorerNodesByDefault &&
                    !collapsedGroupUris.contains(group.uri)) ||
                group.uri == router.path,
          );
          controller.addListener(() {
            if (!controller.expanded) {
              collapsedGroupUrisNotifier.state.add(group.uri);
            } else {
              collapsedGroupUrisNotifier.state.remove(group.uri);
            }
          });
          return ExpandablePanel(
            key: Key(group.id),
            controller: controller,
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
                (previousValue, element) =>
                    [...previousValue, PageGroupNode(viewerPage: element)],
              ),
            ),
          );
        },
        orElse: () => LinkableClickableContainer(
              uri: Uri().resolve('#${viewerPage.uri}'),
              onTap: () {
                if (rootScaffoldKey.currentState?.isDrawerOpen == true) {
                  rootScaffoldKey.currentState!.openEndDrawer();
                }
                router.toSegments(viewerPage.segments);
              },
              child: label,
            ));
  }
}

class PageGroupHeader extends StatelessWidget {
  const PageGroupHeader({
    Key? key,
    required this.groupPage,
  }) : super(key: key);

  final ViewerGroupPage groupPage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      groupPage.namespace.isEmpty
          ? groupPage.title.toUpperCase()
          : groupPage.title,
      style: theme.textTheme.subtitle2?.copyWith(color: theme.hintColor),
    );
  }
}
