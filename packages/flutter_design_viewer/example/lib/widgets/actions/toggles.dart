import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';

part 'toggles.design.dart';

@design
class ToggleButton extends StatelessWidget {
  @DesignField(
    parameter: DataTemplateStringLoremParameter(length: 10),
  )
  final String title;

  final Color color;

  @DesignField(
    parameter: DataTemplateSubConnectorParameter(
      key: 'active',
      defaultValue: false,
    ),
  )
  final bool active;

  @DesignField(
    parameter: DataTemplatePubConnectorParameter(
      key: 'active',
    ),
  )
  final void Function(bool?)? onChanged;

  const ToggleButton({
    required this.title,
    this.color = Colors.red,
    this.active = false,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      activeColor: color,
      value: active,
      onChanged: onChanged,
    );
  }
}
