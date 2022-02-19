import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_design_viewer/src/measures.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class KeyContainer extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final double size;
  const KeyContainer({
    required this.size,
    this.label,
    this.icon,
    Key? key,
  })  : assert(label != null || icon != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: theme.dialogBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 3),
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 0.5,
          )
        ],
      ),
      width: size,
      height: size,
      child: Center(
        child: Paddings.bottom1(
          child: label != null
              ? Text(
                  label!,
                  style: theme.textTheme.button!.copyWith(
                      fontFeatures: [const FontFeature.tabularFigures()],
                      textBaseline: TextBaseline.alphabetic,
                      fontSize: label!.length >= 3 ? 10 : null),
                )
              : Icon(
                  icon,
                  size: 12,
                ),
        ),
      ),
    );
  }
}

class TitleWidgetPair extends StatelessWidget {
  final String title;
  final String? description;
  final Widget widget;
  final bool showDivider;
  const TitleWidgetPair({
    required this.title,
    this.description,
    required this.widget,
    this.showDivider = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.subtitle1),
        if (showDivider) const Divider() else Spacers.v10,
        if (description != null) ...[
          Text(description!, style: theme.textTheme.caption),
          Spacers.v10,
        ],
        widget,
      ],
    );
  }
}

/// A responsive wrapping row that tries to fit as much widget
/// evenly as possible based on the screen constraints.
/// It will try to spread out its children to multiple row if necessary.
class ResponsiveEvenRow extends StatelessWidget {
  final double widthThreshold;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final List<Widget> children;
  const ResponsiveEvenRow({
    required this.children,
    this.widthThreshold = 300,
    this.crossAxisSpacing = 10,
    this.mainAxisSpacing = 10,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return StaggeredGrid.count(
        crossAxisCount: max((constraints.maxWidth / widthThreshold).floor(), 1),
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        children: children,
      );
    });
  }
}
