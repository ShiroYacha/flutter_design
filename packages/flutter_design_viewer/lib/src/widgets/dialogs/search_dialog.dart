import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/src/measures.dart';
import 'package:flutter_design_viewer/src/services/search_service.dart';
import 'package:flutter_design_viewer/src/widgets/items/buttons.dart';
import 'package:flutter_design_viewer/src/widgets/items/containers.dart';
import 'package:flutter_design_viewer/src/widgets/items/images.dart';
import 'package:flutter_design_viewer/src/widgets/scaffolds/root_scaffold.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:vrouter/vrouter.dart';

final currentSearchResultItemIndexProvider =
    StateProvider.autoDispose<int>((ref) => 0);

class SearchDialog extends HookConsumerWidget {
  const SearchDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const keyContainerSize = 24.0;
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final screenBreakpoint = ref.watch(screenBreakpointProvider);
    final showFullscreen = screenBreakpoint == ScreenBreakpoint.mobile ||
        mediaQuery.size.width <= 600;
    final scrollController = useScrollController();
    // Keyboard listening
    final focusNode = useFocusNode();
    final currentSearchResultItemIndexNotifier =
        ref.watch(currentSearchResultItemIndexProvider.notifier);
    // Handle text editing
    final query = useState('');
    final textEditingController = useTextEditingController(text: query.value);
    useEffect(() {
      textEditingController.addListener(() {
        query.value = textEditingController.text;
      });
    }, []);
    // Handle search
    final searchResults = ref.watch(searchProvider(query.value));
    final items = searchResults
      ..sortByCompare<SearchResultItem>((e) => e, (a, b) {
        // Context is always fixed
        final context = a.context.index.compareTo(b.context.index);
        if (context != 0) return context;
        // Sort by score
        return b.score.compareTo(a.score);
      })
      // Take top 10 results
      ..take(10);
    final contextIndexMap = {
      for (final context in SearchResultContext.values)
        context: items.indexWhere((i) => i.context == context)
    };
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: theme.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      content: KeyboardListener(
        focusNode: focusNode,
        onKeyEvent: (value) {
          // Handle keyboard events
          if (value is KeyDownEvent) {
            if (value.logicalKey == LogicalKeyboardKey.arrowUp) {
              currentSearchResultItemIndexNotifier
                  .update((state) => max(0, state - 1));
            }
            if (value.logicalKey == LogicalKeyboardKey.arrowDown) {
              currentSearchResultItemIndexNotifier
                  .update((state) => min(items.length - 1, state + 1));
            }
            if (value.logicalKey == LogicalKeyboardKey.escape) {
              Navigator.of(context).pop();
            }
            if (value.logicalKey == LogicalKeyboardKey.enter) {
              Navigator.of(context).pop();
              VRouter.of(context).to(
                  items[ref.read(currentSearchResultItemIndexProvider)].uri);
            }
          }
        },
        child: Container(
          padding: SpacingDesign.paddingAll20,
          width: 600,
          height: showFullscreen ? null : mediaQuery.size.height * 0.8,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Ionicons.search,
                          color: theme.colorScheme.secondary,
                        ),
                        border: const OutlineInputBorder(),
                        hintText: 'Search for anything ...',
                        suffixIcon: query.value.isNotEmpty
                            ? GlyphButton(
                                glyph: const ViewerGlyphUnion.icon(
                                  icon: Ionicons.close,
                                ),
                                iconOnly: true,
                                onTap: () {
                                  textEditingController.clear();
                                },
                              )
                            : null,
                      ),
                      controller: textEditingController,
                    ),
                  ),
                  if (showFullscreen) ...[
                    Spacers.h10,
                    TextButton(
                      onPressed: Navigator.of(context).pop,
                      child: const Text('Cancel'),
                    ),
                  ]
                ],
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: items
                      .mapIndexed((index, item) => SearchResultEntry(
                            index: index,
                            item: item,
                          ))
                      .fold<List<Widget>>(
                          [],
                          (previousValue, element) => [
                                ...previousValue,
                                if (contextIndexMap
                                    .containsValue(element.index)) ...[
                                  Spacers.v20,
                                  Text(
                                    toBeginningOfSentenceCase(contextIndexMap
                                        .entries
                                        .toList()[contextIndexMap.values
                                            .toList()
                                            .indexOf(element.index)]
                                        .key
                                        .name)!,
                                    style: theme.textTheme.subtitle1?.copyWith(
                                      color: theme.colorScheme.secondary,
                                    ),
                                  ),
                                  Spacers.v6,
                                ],
                                Spacers.v6,
                                element,
                              ]).toList(),
                ),
              ),
              if (!showFullscreen) ...[
                Spacers.v20,
                Row(
                  children: const [
                    KeyContainer(
                      size: keyContainerSize,
                      icon: Ionicons.return_down_back,
                    ),
                    Spacers.h10,
                    Text('to select'),
                    Spacers.h20,
                    KeyContainer(
                      size: keyContainerSize,
                      icon: Ionicons.arrow_down,
                    ),
                    Spacers.h10,
                    KeyContainer(
                      size: keyContainerSize,
                      icon: Ionicons.arrow_up,
                    ),
                    Spacers.h10,
                    Text('to navigate'),
                    Spacers.h20,
                    KeyContainer(
                      size: keyContainerSize,
                      label: 'esc',
                    ),
                    Spacers.h10,
                    Text('to close'),
                  ],
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class SearchResultEntry extends HookConsumerWidget {
  final int index;
  final SearchResultItem item;
  const SearchResultEntry({
    required this.index,
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final currentSearchResultItemIndex =
        ref.watch(currentSearchResultItemIndexProvider);
    final currentSearchResultItemIndexNotifier =
        ref.watch(currentSearchResultItemIndexProvider.notifier);
    final highlighted = currentSearchResultItemIndex == index;
    final foreground = highlighted
        ? theme.colorScheme.onPrimary
        : theme.colorScheme.onBackground;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (e) {
        currentSearchResultItemIndexNotifier.update((state) => index);
      },
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
          VRouter.of(context).to(item.uri);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:
                highlighted ? theme.primaryColor : theme.dialogBackgroundColor,
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: SpacingDesign.s16, vertical: SpacingDesign.s10),
          child: Row(
            children: [
              ThemableGlyph(
                glyph: ViewerGlyphUnion.icon(
                  icon: {
                        SearchResultItemType.page: Ionicons.document_outline,
                        SearchResultItemType.section: FeatherIcons.hash,
                        SearchResultItemType.content: Ionicons.menu_outline,
                        SearchResultItemType.recent: Ionicons.time_outline,
                        SearchResultItemType.favorite: Ionicons.star_outline,
                      }[item.type] ??
                      FeatherIcons.box,
                  size: 24,
                  color: foreground,
                ),
              ),
              Spacers.h10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: theme.textTheme.subtitle1
                          ?.copyWith(color: foreground),
                    ),
                    if (item.subtitle != null)
                      Text(
                        item.subtitle!,
                        style: theme.textTheme.caption
                            ?.copyWith(color: foreground),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 40), // Fixed list minimum hight
              if (item.context == SearchResultContext.recent)
                GlyphButton(
                  glyph: ViewerGlyphUnion.icon(
                    icon: Ionicons.star_outline,
                    color: foreground,
                  ),
                  onTap: () {},
                ),
              Spacers.h3,
              GlyphButton(
                glyph: ViewerGlyphUnion.icon(
                    icon: Ionicons.close, color: foreground),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
