import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';

part 'buttons.design.dart';

@Design(
  subtitle:
      'A button is a box area or text that communicates and triggers user actions when clicked.',
  description:
      '''The current design encapsulates the [ElevatedButton](https://api.flutter.dev/flutter/material/ElevatedButton-class.html),
      [OutlinedButton](https://api.flutter.dev/flutter/material/ElevatedButton-class.html) and [TextButton](https://api.flutter.dev/flutter/material/TextButton-class.html)
      from Material design.''',
)
class Button extends StatelessWidget {
  /// The child of the button, positioned in the middle of the container.
  final Widget child;

  /// Callback when the button is pressed. If `null`, the button is disabled.
  final VoidCallback? onPressed;

  /// Default constructor
  const Button({
    required this.child,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  /// Label variant
  factory Button.label({
    @DesignField(
      parameter: DesignParamStringLorem(length: 10),
    )
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
