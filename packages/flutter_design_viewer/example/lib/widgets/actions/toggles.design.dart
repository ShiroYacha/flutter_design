// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggles.dart';

// **************************************************************************
// DesignGenerator
// **************************************************************************

typedef _$FunctionAliasForOnChangedViaToggleButton = void Function(bool);
final generatedWidgetsActionsTogglesToggleButtonPage = ViewerDocumentPage(
  id: 'toggleButton',
  namespace: ['widgets', 'actions', 'toggles'],
  title: 'ToggleButton',
  subtitle: null,
  description: null,
  sections: [
    ViewerSectionUnion.component(
      id: 'component_anatomy',
      title: 'Anatomy',
      ctorName: 'ToggleButton',
      designLink: null,
      builder: ViewerWidgetBuilder(
        build: (context, factory) => ToggleButton(
          title: factory.build(context, 'title'),
          color: factory.build(context, 'color'),
          active: factory.build(context, 'active'),
          onChanged: factory.build(context, 'onChanged'),
        ),
        fieldMetaDataset: const [
          FieldMetaData(
            name: 'title',
            type: String,
            typeName: 'String',
            isNullable: false,
            defaultValue: null,
            defaultValueCode: null,
            viewerInitSelectorParam: DesignParamStringLorem(
              length: 10,
              min: 0,
              max: 100,
            ),
            documentation: null,
          ),
          FieldMetaData(
            name: 'color',
            type: Color,
            typeName: 'Color',
            isNullable: false,
            defaultValue: Colors.red,
            defaultValueCode: '''Colors.red''',
            documentation: null,
          ),
          FieldMetaData(
            name: 'active',
            type: bool,
            typeName: 'bool',
            isNullable: false,
            defaultValue: false,
            defaultValueCode: '''false''',
            viewerInitSelectorParam: DesignParamSubscriber(
              defaultValue: false,
              key: 'active',
            ),
            documentation: null,
          ),
          FieldMetaData(
            name: 'onChanged',
            type: _$FunctionAliasForOnChangedViaToggleButton,
            typeName: 'void Function(bool)',
            isNullable: true,
            defaultValue: null,
            defaultValueCode: '''null''',
            viewerInitSelectorParam: DesignParamPublisher(
              key: 'active',
            ),
            documentation: null,
          ),
        ],
      ),
      sourceCode: const ViewerSourceCode(
          location: 'package:viewer_example/widgets/actions/toggles.dart',
          code: '''
/// Built from the following function 
(context, factory) => ToggleButton(title: factory.build(context, 'title'),color: factory.build(context, 'color'),active: factory.build(context, 'active'),onChanged: factory.build(context, 'onChanged'),)

/// Widget
class ToggleButton extends StatelessWidget {
  final String title;
  final Color color;
  final bool active;
  final void Function(bool?)? onChanged;
  const ToggleButton(
      {required this.title,
      this.color = Colors.red,
      this.active = false,
      this.onChanged,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: Text(title, style: Theme.of(context).textTheme.headline6),
        activeColor: color,
        value: active,
        onChanged: onChanged);
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
