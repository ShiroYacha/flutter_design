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
        build: (context, factory) => Button(
          child: factory.build(context, 'child'),
          onPressed: factory.build(context, 'onPressed'),
        ),
        fieldMetaDataset: const [
          FieldMetaData(
            name: 'child',
            type: Widget,
            isOptional: false,
          ),
          FieldMetaData(
            name: 'onPressed',
            type: Function,
            isOptional: true,
          ),
        ],
      ),
      sourceCode: const ViewerSourceCode(
          location: 'package:viewer_example/components/actions/buttons.dart',
          code: '''
/// Built from the following function 
(context, factory) => Button(child: factory.build(context, 'child'),onPressed: factory.build(context, 'onPressed'),)

/// Widget
class Button extends StatelessWidget {
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
