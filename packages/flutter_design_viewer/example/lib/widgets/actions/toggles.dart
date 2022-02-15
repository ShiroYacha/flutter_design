import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';

part 'toggles.design.dart';

@design
class ToggleButton extends StatelessWidget {
  final Color color;
  const ToggleButton({
    this.color = Colors.red,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
