// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggles.dart';

// **************************************************************************
// DesignGenerator
// **************************************************************************

typedef $FunctionAliasForOnChanged = void Function(bool);
final generatedWidgetsActionsTogglesToggleButtonPage = ViewerDocumentPage(
  id: 'toggleButton',
  namespace: ['widgets', 'actions', 'toggles'],
  title: 'ToggleButton',
  subtitle: null,
  description: null,
  sections: [
    ViewerSectionUnion.component(
      id: 'anatomy',
      title: 'Anatomy',
      ctorName: 'ToggleButton',
      designLink: null,
      builder: ViewerWidgetBuilder(
        build: (context, factory) => ToggleButton(
          color: factory.build(context, 'color'),
          active: factory.build(context, 'active'),
          title: factory.build(context, 'title'),
          onChanged: factory.build(context, 'onChanged'),
        ),
        fieldMetaDataset: const [
          FieldMetaData(
            name: 'color',
            type: Color,
            typeName: 'Color',
            isNullable: false,
            defaultValue: Colors.red,
            defaultValueCode: 'Colors.red',
            documentation: null,
          ),
          FieldMetaData(
            name: 'active',
            type: bool,
            typeName: 'bool',
            isNullable: false,
            defaultValue: false,
            defaultValueCode: 'false',
            documentation: null,
          ),
          FieldMetaData(
            name: 'title',
            type: String,
            typeName: 'String',
            isNullable: false,
            defaultValue: 'This is a Toggle Button',
            defaultValueCode: 'This is a Toggle Button',
            documentation: null,
          ),
          FieldMetaData(
            name: 'onChanged',
            type: $FunctionAliasForOnChanged,
            typeName: 'void Function(bool)',
            isNullable: true,
            defaultValue: null,
            defaultValueCode: 'null',
            documentation: null,
          ),
        ],
      ),
      sourceCode: const ViewerSourceCode(
          location: 'package:viewer_example/widgets/actions/toggles.dart',
          code: '''
/// Built from the following function 
(context, factory) => ToggleButton(color: factory.build(context, 'color'),active: factory.build(context, 'active'),title: factory.build(context, 'title'),onChanged: factory.build(context, 'onChanged'),)

/// Widget
class ToggleButton extends StatelessWidget {
  final Color color;
  final String title;
  final bool active;
  final void Function(bool?)? onChanged;
  const ToggleButton(
      {this.color = Colors.red,
      this.active = false,
      this.title = 'This is a Toggle Button',
      this.onChanged,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        textColor: color,
        leading: Checkbox(value: active, onChanged: onChanged));
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
