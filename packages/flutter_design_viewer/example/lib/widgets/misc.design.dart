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
            viewerInitSelectorParam:
                'https://www.ladbible.com/cdn-cgi/image/width=720,quality=70,format=jpeg,fit=pad,dpr=1/https%3A%2F%2Fs3-images.ladbible.com%2Fs3%2Fcontent%2Fdc3138d56184d0490ddcc02c5e8a3b7a.png',
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
      parameter:
          'https://www.ladbible.com/cdn-cgi/image/width=720,quality=70,format=jpeg,fit=pad,dpr=1/https%3A%2F%2Fs3-images.ladbible.com%2Fs3%2Fcontent%2Fdc3138d56184d0490ddcc02c5e8a3b7a.png')
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
        child: CircleAvatar(
            backgroundImage: Image.network(uri).image,
            radius: max(0, radius - 10)));
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

final generatedWidgetsMiscAvatarV2Page = ViewerDocumentPage(
  id: 'avatarV2',
  namespace: ['widgets', 'misc'],
  title: 'AvatarV2',
  subtitle: null,
  description: null,
  sections: [
    ViewerSectionUnion.component(
      id: 'anatomy',
      title: 'Anatomy',
      ctorName: 'AvatarV2',
      designLink: null,
      builder: ViewerWidgetBuilder(
        build: (context, factory) => AvatarV2(
          model: factory.build(context, 'model'),
        ),
        fieldMetaDataset: const [
          FieldMetaData(
            name: 'model',
            type: AvatarModel,
            typeName: 'AvatarModel',
            isNullable: false,
            defaultValue: null,
            defaultValueCode: 'null',
            documentation: null,
          ),
        ],
      ),
      sourceCode: const ViewerSourceCode(
          location: 'package:viewer_example/widgets/misc.dart', code: '''
/// Built from the following function 
(context, factory) => AvatarV2(model: factory.build(context, 'model'),)

/// Widget
class AvatarV2 extends StatelessWidget {
  @DesignField()
  final AvatarModel model;
  const AvatarV2({required this.model, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CircleAvatar(
        backgroundColor: theme.backgroundColor,
        radius: model.radius,
        child: CircleAvatar(backgroundImage: Image.network(model.uri).image));
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
