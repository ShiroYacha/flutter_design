// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggles.dart';

// **************************************************************************
// DesignGenerator
// **************************************************************************

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
        ),
        fieldMetaDataset: const [
          FieldMetaData(
            name: 'color',
            type: Color,
            typeName: 'Color',
            isOptional: true,
            defaultValue: Colors.red,
            defaultValueCode: 'Colors.red',
            viewerInitValue: null,
            documentation: null,
          ),
        ],
      ),
      sourceCode: const ViewerSourceCode(
          location: 'package:viewer_example/widgets/actions/toggles.dart',
          code: '''
/// Built from the following function 
(context, factory) => ToggleButton(color: factory.build(context, 'color'),)

/// Widget
class ToggleButton extends StatelessWidget {
  final Color color;
  const ToggleButton({this.color = Colors.red, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(color: color);
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
