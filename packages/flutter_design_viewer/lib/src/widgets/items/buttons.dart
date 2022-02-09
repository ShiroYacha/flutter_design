import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/src/commands.dart';
import 'package:flutter_design_viewer/src/measures.dart';
import 'package:flutter_design_viewer/src/utils.dart';
import 'package:flutter_design_viewer/src/widgets/scaffolds/root_scaffold.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';

import 'containers.dart';
import 'images.dart';

extension WidgetMouseExtension on Widget {
  Widget get asMouseClickRegion => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: this,
      );
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
