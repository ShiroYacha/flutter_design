// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggles.dart';

// **************************************************************************
// DesignGenerator
// **************************************************************************

// ignore_for_file: type=lint
// ignore_for_file: unused_element
typedef _$FunctionAliasForOnChangedViaToggleButton = void Function(bool);

class _$ToggleButtonParamBuilder extends ComponentParamBuilder {
  final dynamic title;
  final dynamic color;
  final dynamic active;
  final dynamic onChanged;

  const _$ToggleButtonParamBuilder({
    required this.title,
    this.color,
    this.active,
    this.onChanged,
  }) : super();
}

final generatedWidgetsActionsTogglesToggleButtonPage = ViewerDocumentPage(
  id: 'toggleButton',
  namespace: ['widgets', 'actions', 'toggles'],
  title: 'ToggleButton',
  subtitle: null,
  description: null,
  sections: [
    ViewerSectionUnion.component(
      id: 'component_toggle_button',
      title: 'ToggleButton()',
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
            isRequired: true,
            isNamed: true,
            defaultValue: null,
            defaultValueCode: '''null''',
            viewerInitSelectorParam: DesignParamStringLorem(
              length: 10,
            ),
            viewerInitValueCode: '''DesignParamStringLorem(length: 10, )''',
            documentation: null,
          ),
          FieldMetaData(
            name: 'color',
            type: Color,
            typeName: 'Color',
            isNullable: false,
            isRequired: false,
            isNamed: true,
            defaultValue: Colors.red,
            defaultValueCode: "Colors.red",
            viewerInitValueCode: "Colors.red",
            documentation: null,
          ),
          FieldMetaData(
            name: 'active',
            type: bool,
            typeName: 'bool',
            isNullable: false,
            isRequired: false,
            isNamed: true,
            defaultValue: false,
            defaultValueCode: "false",
            viewerInitSelectorParam: DesignParamSubscriber(
              key: 'active',
              defaultValue: false,
            ),
            viewerInitValueCode:
                '''DesignParamSubscriber(key: 'active', defaultValue: false, )''',
            documentation: null,
          ),
          FieldMetaData(
            name: 'onChanged',
            type: _$FunctionAliasForOnChangedViaToggleButton,
            typeName: 'void Function(bool)',
            isNullable: true,
            isRequired: false,
            isNamed: true,
            defaultValue: null,
            defaultValueCode: "null",
            viewerInitSelectorParam: DesignParamPublisher(
              key: 'active',
            ),
            viewerInitValueCode: '''DesignParamPublisher(key: 'active', )''',
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
