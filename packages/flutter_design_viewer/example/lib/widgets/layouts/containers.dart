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
@design
class ResponsiveEvenRow extends StatelessWidget {
  /// The width threshold to be partitioned to display the widgets in a staggered grid
  final double widthThreshold;

  /// Number of children widgets
  ///
  /// Note: the children are placeholders generated by the [childrenCount]
  @DesignField(parameter: 4)
  final int childrenCount;

  /// Spacing between items along the main axis
  final double mainAxisSpacing;

  /// Spacing between items along the cross axis
  final double crossAxisSpacing;

  const ResponsiveEvenRow({
    required this.childrenCount,
    this.widthThreshold = 300.0,
    this.mainAxisSpacing = 10.0,

    /// Spacing between items along the cross axis
    this.crossAxisSpacing = 10.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.extent(
      axisDirection: AxisDirection.down,
      maxCrossAxisExtent: widthThreshold,
      mainAxisSpacing: mainAxisSpacing,
      crossAxisSpacing: crossAxisSpacing,
      children: List.generate(
        childrenCount,
        (index) => Container(
          color: Colors.primaries[index % Colors.primaries.length],
          height: 100,
        ),
      ),
    );
  }
}

@Design(
  subtitle: '''
A `SizedBox` that responsively adapt it's `width` based on the
screen factor.''',
  description: '''
It is very common on smaller screens to stretch the content horizontally. However 
on bigger screens, it is better to center its content with a fixed max width.
''',
)
class ResponsiveSizedBox extends StatelessWidget {
  @DesignExamples(examples: [
    DesignExample(
      title: 'Example red',
      description: 'Example case with red infinite placeholder as child',
      builder: _$ResponsiveSizedBoxParamBuilder(
        child: DesignParamWidgetPlaceholder(
          color: Colors.red,
          size: Size.infinite,
        ),
      ),
    ),
    DesignExample(
      title: 'Example blue',
      description: 'Example case with blue infinite placeholder as child',
      builder: _$ResponsiveSizedBoxParamBuilder(
        child: DesignParamWidgetPlaceholder(
          color: Colors.blue,
          size: Size.infinite,
        ),
      ),
    ),
  ])
  const ResponsiveSizedBox({
    required this.child,
    this.widthWhenConstrained = 400.0,
    this.paddingWhenConstrained = const EdgeInsets.all(20),
    this.centeredWhenConstrained = true,
    this.breakpoint = 420,
    Key? key,
  }) : super(key: key);

  /// The child widget
  @DesignField(
      parameter: DesignParamWidgetPlaceholder(
    size: Size.infinite,
  ))
  final Widget child;

  /// The maximum size of the child widget when constrained
  final double widthWhenConstrained;

  /// The padding of the child widget when constrained
  final EdgeInsets paddingWhenConstrained;

  /// Indicates if the child should be wrapped in a [Center] when constrained
  final bool centeredWhenConstrained;

  /// The breakpoint from which the child widget gets constrained
  final double breakpoint;

  @override
  Widget build(BuildContext context) {
    final bool constrained = MediaQuery.of(context).size.width >= breakpoint;
    final content = Padding(
      padding: constrained ? paddingWhenConstrained : EdgeInsets.zero,
      child: SizedBox(
        width: constrained ? widthWhenConstrained : null,
        child: child,
      ),
    );
    return centeredWhenConstrained ? Center(child: content) : content;
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
