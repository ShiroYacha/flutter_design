import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

part 'containers.design.dart';

@design
class SpacedRow extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  const SpacedRow({
    required this.children,
    this.spacing = 10.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: children.fold(
        [],
        (pv, e) => [
          ...pv,
          e,
          if (children.last != e) SizedBox(width: spacing),
        ],
      ),
    );
  }
}

/// A responsive wrapping row that tries to fit as much widget
/// evenly as possible based on the screen constraints.
/// It will try to spread out its children to multiple row if necessary.
@Design(viewerInitValueMap: {
  'childrenCount': 6,
})
class ResponsiveEvenRow extends StatelessWidget {
  final double widthThreshold;
  final int childrenCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  const ResponsiveEvenRow({
    required this.childrenCount,
    this.widthThreshold = 300.0,
    this.mainAxisSpacing = 10.0,
    this.crossAxisSpacing = 10.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return StaggeredGrid.count(
        axisDirection: AxisDirection.down,
        crossAxisCount: max((constraints.maxWidth / widthThreshold).floor(), 1),
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        children: List.generate(
          childrenCount,
          (index) => Container(
            color: Colors.primaries[index % Colors.primaries.length],
            height: 100,
          ),
        ),
      );
    });
  }
}

final breakpointsProvider =
    Provider<Breakpoints>((ref) => throw UnimplementedError());

class Breakpoints {
  final double mobile;
  final double tablet;
  final double desktop;
  const Breakpoints({
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });
}
