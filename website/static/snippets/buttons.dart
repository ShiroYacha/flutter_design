import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';

part 'buttons.design.dart';

@design // <- Add this single annotation
class Button extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const Button({
    required this.child,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: child,
      onPressed: onPressed,
    );
  }
}
