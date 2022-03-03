// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'misc.dart';

// **************************************************************************
// DesignGenerator
// **************************************************************************

final generatedWidgetsMiscAvatarPage = ViewerDocumentPage(
  id: 'avatar',
  namespace: ['widgets', 'misc'],
  title: 'Avatar',
  subtitle: null,
  description: null,
  sections: [
    ViewerSectionUnion.component(
      id: 'anatomy',
      title: 'Anatomy',
      ctorName: 'Avatar',
      designLink: '''https://www.figma.com/''',
      builder: ViewerWidgetBuilder(
        build: (context, factory) => Avatar(
          uri: factory.build(context, 'uri'),
          radius: factory.build(context, 'radius'),
        ),
        fieldMetaDataset: const [
          FieldMetaData(
            name: 'uri',
            type: String,
            typeName: 'String',
            isNullable: false,
            defaultValue: null,
            defaultValueCode: null,
            viewerInitValue: 'https://example.com',
            viewerInitSelectorParam: DataTemplateStringLoremParameter(
              length: 15,
              min: 0,
              max: 100,
            ),
            documentation: null,
          ),
          FieldMetaData(
            name: 'radius',
            type: double,
            typeName: 'double',
            isNullable: false,
            defaultValue: 30.0,
            defaultValueCode: '30.0',
            documentation: null,
          ),
        ],
      ),
      sourceCode: const ViewerSourceCode(
          location: 'package:viewer_example/widgets/misc.dart', code: '''
/// Built from the following function 
(context, factory) => Avatar(uri: factory.build(context, 'uri'),radius: factory.build(context, 'radius'),)

/// Widget
class Avatar extends StatelessWidget {
  @DesignField(
      initialValue: 'https://example.com',
      parameter: DataTemplateStringLoremParameter(length: 15))
  final String uri;
  final double radius;
  const Avatar({required this.uri, this.radius = 30.0, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CircleAvatar(
        backgroundColor: theme.backgroundColor,
        radius: radius,
        child: CircleAvatar(backgroundImage: Image.network(uri).image));
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
