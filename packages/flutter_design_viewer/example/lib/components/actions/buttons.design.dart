// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buttons.dart';

// **************************************************************************
// DesignGenerator
// **************************************************************************

final componentsActionsButtonsPage = ViewerDocumentPage(
  id: 'button',
  namespace: ['components', 'actions'],
  title: 'Button',
  subtitle: null,
  description: null,
  sections: [
    ViewerSectionUnion.component(
      id: 'button',
      title: 'Anatomy',
      builder: ViewerWidgetBuilder(
        build: (context, data) => Button(child: Text('test')),
      ),
      sourceCode: const ViewerSourceCode(
          location: '', code: '''class Button extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  const Button({
    required this.child,
    this.onPressed,
    Key? key,
  }) : super(
          key: key,
        );
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
'''),
    ),
  ],
);
