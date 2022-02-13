import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';

part 'buttons.design.dart';

@Design(
  title: 'Button',
)
class Button extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const Button({
    required this.child,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  factory Button.label({
    required String label,
    VoidCallback? onPressed,
    Key? key,
  }) =>
      Button(
        child: Text(label),
        onPressed: onPressed,
        key: key,
      );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: child,
      onPressed: onPressed,
    );
  }
}
