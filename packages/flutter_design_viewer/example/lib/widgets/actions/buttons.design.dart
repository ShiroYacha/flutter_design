// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buttons.dart';

// **************************************************************************
// DesignGenerator
// **************************************************************************

typedef _$FunctionAliasForOnPressedViaButton = void Function();
typedef _$FunctionAliasForOnPressedViaButtonLabel = void Function();
final generatedWidgetsActionsButtonsButtonPage = ViewerDocumentPage(
  id: 'button',
  namespace: ['widgets', 'actions', 'buttons'],
  title: 'Button',
  subtitle: '''
A button is a box area or text that communicates and triggers user actions when clicked.
''',
  description: '''
The current design encapsulates the [ElevatedButton](https://api.flutter.dev/flutter/material/ElevatedButton-class.html),
      [OutlinedButton](https://api.flutter.dev/flutter/material/ElevatedButton-class.html) and [TextButton](https://api.flutter.dev/flutter/material/TextButton-class.html)
      from Material design.
''',
  sections: [
    ViewerSectionUnion.component(
      id: 'component_anatomy',
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
            isNullable: false,
            defaultValue: null,
            defaultValueCode: '''null''',
            viewerInitSelectorParam: DesignParamWidgetPlaceholder(
              size: Size(
                100.0,
                100.0,
              ),
            ),
            documentation:
                '''/// The child of the button, positioned in the middle of the container.''',
          ),
          FieldMetaData(
            name: 'onPressed',
            type: _$FunctionAliasForOnPressedViaButton,
            typeName: 'void Function()',
            isNullable: true,
            defaultValue: null,
            defaultValueCode: '''null''',
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
    ViewerSectionUnion.component(
      id: 'component_button_label',
      title: 'Button.label',
      ctorName: 'Button.label',
      designLink: null,
      builder: ViewerWidgetBuilder(
        build: (context, factory) => Button.label(
          label: factory.build(context, 'label'),
          onPressed: factory.build(context, 'onPressed'),
        ),
        fieldMetaDataset: const [
          FieldMetaData(
            name: 'label',
            type: String,
            typeName: 'String',
            isNullable: false,
            defaultValue: null,
            defaultValueCode: null,
            viewerInitSelectorParam: DesignParamStringLorem(
              length: 10,
            ),
            documentation: null,
          ),
          FieldMetaData(
            name: 'onPressed',
            type: _$FunctionAliasForOnPressedViaButtonLabel,
            typeName: 'void Function()',
            isNullable: true,
            defaultValue: null,
            defaultValueCode: '''null''',
            documentation:
                '''/// Callback when the button is pressed. If `null`, the button is disabled.''',
          ),
        ],
      ),
      sourceCode: const ViewerSourceCode(
          location: 'package:viewer_example/widgets/actions/buttons.dart',
          code: '''
/// Built from the following function 
(context, factory) => Button.label(label: factory.build(context, 'label'),onPressed: factory.build(context, 'onPressed'),)

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
