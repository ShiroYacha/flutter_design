// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buttons.dart';

// **************************************************************************
// DesignGenerator
// **************************************************************************

final generatedWidgetsActionsButtonsButtonPage = ViewerDocumentPage(
  id: 'button',
  namespace: ['widgets', 'actions', 'buttons'],
  title: 'Button',
  subtitle:
      '''A button is a box area or text that communicates and triggers user actions when clicked.''',
  description:
      '''The current design encapsulates the [ElevatedButton](https://api.flutter.dev/flutter/material/ElevatedButton-class.html),
      [OutlinedButton](https://api.flutter.dev/flutter/material/ElevatedButton-class.html) and [TextButton](https://api.flutter.dev/flutter/material/TextButton-class.html)
      from Material design.''',
  sections: [
    ViewerSectionUnion.component(
      id: 'anatomy',
      title: 'Anatomy',
      ctorName: 'Button',
      designLink: null,
      builder: ViewerWidgetBuilder(
        build: (context, factory) => Button(
          child: factory.build(context, 'child'),
          onPressed: factory.build(context, 'onPressed'),
        ),
        fieldMetaDataset: const [
          FieldMetaData(
            name: 'child',
            type: Widget,
            typeName: 'Widget',
            isOptional: false,
            defaultValue: null,
            defaultValueCode: null,
            viewerInitValue: null,
            documentation:
                '''/// The child of the button, positioned in the middle of the container.''',
          ),
          FieldMetaData(
            name: 'onPressed',
            type: Function,
            typeName: 'Function',
            isOptional: true,
            defaultValue: null,
            defaultValueCode: null,
            viewerInitValue: null,
            documentation:
                '''/// Callback when the button is pressed. If `null`, the button is disabled.''',
          ),
        ],
      ),
      sourceCode: const ViewerSourceCode(
          location: 'package:viewer_example/widgets/actions/buttons.dart',
          code: '''
/// Built from the following function 
(context, factory) => Button(child: factory.build(context, 'child'),onPressed: factory.build(context, 'onPressed'),)

/// Widget
class Button extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  const Button({required this.child, this.onPressed, Key? key})
      : super(key: key);
  factory Button.label(
          {required String label, VoidCallback? onPressed, Key? key}) =>
      Button(child: Text(label), onPressed: onPressed, key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(child: child, onPressed: onPressed);
  }
}

'''),
    ),
    const ViewerSectionUnion.apiDocs(
      id: 'apiDocs',
      title: 'API reference',
    ),
  ],
);
