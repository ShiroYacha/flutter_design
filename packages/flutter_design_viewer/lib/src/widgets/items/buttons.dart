import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/src/commands.dart';
import 'package:flutter_design_viewer/src/measures.dart';
import 'package:flutter_design_viewer/src/utils.dart';
import 'package:flutter_design_viewer/src/widgets/dialogs/settings_dialog.dart';
import 'package:flutter_design_viewer/src/widgets/scaffolds/root_scaffold.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/link.dart';

import 'containers.dart';
import 'images.dart';

extension WidgetMouseExtension on Widget {
  Widget get asMouseClickRegion => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: this,
      );
}

typedef DataWidgetBuilder<T, U> = Widget Function(BuildContext, T, [U]);
typedef DataSelectionChanged<T> = void Function(T);

class LinkableClickableContainer extends StatelessWidget {
  final Uri? uri;
  final VoidCallback? onTap;
  final Widget child;
  final String? tooltip;
  const LinkableClickableContainer({
    required this.uri,
    required this.onTap,
    required this.child,
    this.tooltip,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: child,
      onTap: onTap,
    ).asMouseClickRegion;
    final widget = kIsWeb
        ? Link(
            uri: uri,
            builder: (context, future) => content,
          ).asMouseClickRegion
        : content;
    return tooltip != null ? Tooltip(message: tooltip, child: widget) : widget;
  }
}

class SelectableContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Color? color;
  const SelectableContainer({
    required this.child,
    this.padding = SpacingDesign.paddingAll10,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: color ?? theme.backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: padding,
      child: child,
    );
  }
}

class SelectableGlyphGroup<T> extends HookConsumerWidget {
  final Iterable<T> items;
  final DataWidgetBuilder<T, bool> builder;
  final T? selectedItem;
  final DataSelectionChanged<T> selectionChanged;
  const SelectableGlyphGroup({
    required this.items,
    required this.builder,
    this.selectedItem,
    required this.selectionChanged,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return SelectableContainer(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        runSpacing: 10,
        children: items.fold<List<Widget>>(
          [],
          (pv, e) => [
            ...pv,
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  selectionChanged(e);
                },
                child: builder(context, e, selectedItem == e),
              ),
            ),
            if (items.last != e)
              Container(color: theme.dividerColor, width: 1, height: 10),
          ],
        ),
      ),
    );
  }
}

class MultiSelectableGlyphGroup<T> extends HookConsumerWidget {
  final Iterable<T> items;
  final DataWidgetBuilder<T, bool> builder;
  final Iterable<T> selectedItems;
  final DataSelectionChanged<Iterable<T>> selectionChanged;
  const MultiSelectableGlyphGroup({
    required this.items,
    required this.builder,
    this.selectedItems = const [],
    required this.selectionChanged,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return SelectableContainer(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        runSpacing: 10,
        children: items.fold<List<Widget>>(
          [],
          (pv, e) => [
            ...pv,
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  final selection = List.of(selectedItems);
                  if (selection.contains(e)) {
                    selection.remove(e);
                  } else {
                    selection.add(e);
                  }
                  selectionChanged(selection);
                },
                child: builder(context, e, selectedItems.contains(e)),
              ),
            ),
            if (items.last != e)
              Container(color: theme.dividerColor, width: 1, height: 10),
          ],
        ),
      ),
    );
  }
}

class ConfigButton extends HookConsumerWidget {
  const ConfigButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GlyphButton(
        tooltip: 'Global settings',
        glyph: const ViewerGlyphUnion.icon(
          icon: Ionicons.settings_outline,
        ),
        onTap: () async {
          final theme = Theme.of(context);
          await showDialog(
            context: context,
            barrierDismissible: true,
            barrierColor: theme.dialogBackgroundColor.withOpacity(0.5),
            builder: (context) {
              return const SettingsDialog();
            },
          );
        },
      ),
    );
  }
}

class SearchButton extends HookConsumerWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const keyContainerSize = 24.0;
    final theme = Theme.of(context);
    final hover = useState(false);
    final screenBreakpoint = ref.watch(screenBreakpointProvider);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (e) {
        hover.value = true;
      },
      onExit: (e) {
        hover.value = false;
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Actions.handler<SearchIntent>(
            context,
            const SearchIntent(),
          )?.call();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: hover.value
                  ? theme.dividerColor.withOpacity(0.5)
                  : Colors.transparent,
            ),
          ),
          padding: SpacingDesign.paddingAll6,
          child: Row(
            children: [
              const Icon(Ionicons.search, size: 16),
              Spacers.h6,
              Text(
                'Search',
                style: theme.textTheme.subtitle1,
              ),
              if (screenBreakpoint != ScreenBreakpoint.mobile) ...[
                Spacers.h6,
                buildIf({
                      () => [TargetPlatform.macOS, TargetPlatform.iOS]
                              .contains(defaultTargetPlatform):
                          () => const KeyContainer(
                                icon: FeatherIcons.command,
                                size: keyContainerSize,
                              ),
                    }) ??
                    const KeyContainer(label: 'Ctrl', size: keyContainerSize),
                Spacers.h3,
                const KeyContainer(label: 'K', size: keyContainerSize),
              ] else
                const SizedBox(
                  height: keyContainerSize,
                )
            ],
          ),
        ),
      ),
    );
  }
}

class GlyphButton extends StatelessWidget {
  final ViewerGlyphUnion glyph;
  final GestureTapCallback? onTap;
  final String? tooltip;
  final EdgeInsets padding;
  final bool iconOnly;
  const GlyphButton({
    required this.glyph,
    this.onTap,
    this.tooltip,
    this.padding = SpacingDesign.paddingAll6,
    this.iconOnly = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final glyphWidget = ThemableGlyph(glyph: glyph);
    final child = tooltip != null
        ? Tooltip(
            message: tooltip,
            child: glyphWidget,
          )
        : glyphWidget;

    return Ink(
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: iconOnly
          ? MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: onTap,
                child: child,
              ),
            )
          : InkWell(
              onTap: onTap,
              customBorder: const CircleBorder(),
              child: Padding(
                padding: padding,
                child: child,
              ),
            ),
    );
  }
}
