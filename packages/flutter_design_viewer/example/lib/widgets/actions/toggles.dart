import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';

part 'toggles.design.dart';

@design
class ToggleButton extends StatelessWidget {
  final Color color;
  final String title;
  final bool active;
  final void Function(bool?)? onChanged;
  const ToggleButton({
    this.color = Colors.red,
    this.active = false,
    this.title = 'This is a Toggle Button', // TODO: remove this nonsense
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      textColor: color,
      leading: Checkbox(
        value: active,
        onChanged: onChanged,
      ),
    );
  }
}
