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
      id: 'avatar',
      title: 'Avatar',
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
                'https://images.unsplash.com/photo-1529778873920-4da4926a72c2',
            documentation: null,
          ),
          FieldMetaData(
            name: 'radius',
            type: double,
            typeName: 'double',
            isNullable: false,
            defaultValue: 30.0,
            defaultValueCode: '''30.0''',
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

final generatedWidgetsMiscAvatarDuoPage = ViewerDocumentPage(
  id: 'avatarDuo',
  namespace: ['widgets', 'misc'],
  title: 'AvatarDuo',
  subtitle: null,
  description: null,
  sections: [
    ViewerSectionUnion.component(
      id: 'avatar_duo',
      title: 'AvatarDuo',
      ctorName: 'AvatarDuo',
      designLink: null,
      builder: ViewerWidgetBuilder(
        build: (context, factory) => AvatarDuo(
          left: factory.build(context, 'left'),
          right: factory.build(context, 'right'),
        ),
        fieldMetaDataset: const [
          FieldMetaData(
            name: 'left',
            type: AvatarModel,
            typeName: 'AvatarModel',
            isNullable: false,
            defaultValue: null,
            defaultValueCode: '''null''',
            viewerInitSelectorParam: AvatarModel(
              uri:
                  'https://images.unsplash.com/photo-1529778873920-4da4926a72c2',
              radius: 30.0,
            ),
            documentation: null,
          ),
          FieldMetaData(
            name: 'right',
            type: AvatarModel,
            typeName: 'AvatarModel',
            isNullable: false,
            defaultValue: const AvatarModel(
                uri:
                    'https://cdn.omlet.co.uk/images/originals/sleeping_kitten.jpg'),
            defaultValueCode:
                '''const AvatarModel(uri: 'https://cdn.omlet.co.uk/images/originals/sleeping_kitten.jpg')''',
            documentation: null,
          ),
        ],
      ),
      sourceCode: const ViewerSourceCode(
          location: 'package:viewer_example/widgets/misc.dart', code: '''
/// Built from the following function 
(context, factory) => AvatarDuo(left: factory.build(context, 'left'),right: factory.build(context, 'right'),)

/// Widget
class AvatarDuo extends StatelessWidget {
  final AvatarModel left;
  final AvatarModel right;
  const AvatarDuo(
      {required this.left,
      this.right = const AvatarModel(
          uri: 'https://cdn.omlet.co.uk/images/originals/sleeping_kitten.jpg'),
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _renderAvatar(context, left),
          _renderAvatar(context, right)
        ]);
  }

  CircleAvatar _renderAvatar(BuildContext context, AvatarModel model) {
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
