import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'meta.design.dart';

/// This is a first trial to test the concept of wrapping riverpod
/// consumer widgets inside static constructors to test the states.
///
/// Also this is a class actually used by the [flutter_design] library
/// (However it is not directly referenced because internal UI shouldn't be
/// exposed) which can really benefit from design level testing, e.g. screen size.
@Design(title: 'ResponsiveEvenRow', viewerInitValueMap: {
  'childrenCount': 6,
})
class ResponsiveEvenRowWrapper extends StatelessWidget {
  final double mobileBreakpoint;
  final double tabletBreakpoint;
  final double desktopBreakpoint;
  final int childrenCount;

  const ResponsiveEvenRowWrapper({
    required this.childrenCount,
    this.mobileBreakpoint = 320.0,
    this.tabletBreakpoint = 768.0,
    this.desktopBreakpoint = 1024.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        breakpointsProvider.overrideWithValue(
          Breakpoints(
            mobile: mobileBreakpoint,
            tablet: tabletBreakpoint,
            desktop: desktopBreakpoint,
          ),
        )
      ],
      child: ResponsiveEvenRow(
        children: List.generate(
          childrenCount,
          (index) => Container(
            height: 100,
            color: Colors.primaries[index % Colors.primaries.length],
          ),
        ),
      ),
    );
  }
}

/// A responsive wrapping row that tries to fit as much widget
/// evenly as possible based on the screen constraints.
/// It will try to spread out its children to multiple row if necessary.
class ResponsiveEvenRow extends HookConsumerWidget {
  final List<Widget> children;
  const ResponsiveEvenRow({
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final breakpoints = ref.watch(breakpointsProvider);
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
          children: children
              .map((e) => Expanded(
                    child: e,
                  ))
              .toList());
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
