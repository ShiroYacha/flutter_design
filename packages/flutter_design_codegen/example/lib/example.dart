library codegen_example;

import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';

part 'example.design.dart';

Widget _buildDefaultSpecialWidget(BuildContext ctx) =>
    const SpecialWidget(child: SizedBox.shrink());

@Design(
  defaultBuilder: _buildDefaultSpecialWidget,
  widget: SpecialWidget(test: 'test!', child: SizedBox.shrink()),
)
class SpecialWidget extends StatelessWidget {
  final String? test;
  final Widget child;
  const SpecialWidget({
    required this.child,
    this.test,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
