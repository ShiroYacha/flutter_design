// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buttons.dart';

// **************************************************************************
// DesignGenerator
// **************************************************************************

final generatedWidgetsActionsButtonsButtonPage = ViewerDocumentPage(
  id: 'button',
  namespace: ['widgets', 'actions', 'buttons'],
  title: 'Button',
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
            documentation: null,
          ),
          FieldMetaData(
            name: 'onPressed',
            type: Function,
            typeName: 'Function',
            isOptional: true,
            defaultValue: null,
            defaultValueCode: null,
            viewerInitValue: null,
            documentation: null,
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
