// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'misc.dart';

// **************************************************************************
// DesignGenerator
// **************************************************************************

// ignore_for_file: type=lint
// ignore_for_file: unused_element

class _$AvatarParamBuilder extends ComponentParamBuilder {
  final dynamic uri;
  final dynamic radius;

  const _$AvatarParamBuilder({
    required this.uri,
    this.radius,
  }) : super();
}

final generatedWidgetsMiscAvatarPage = ViewerDocumentPage(
  id: 'avatar',
  namespace: ['widgets', 'misc'],
  title: 'Avatar',
  subtitle: null,
  description: null,
  sections: [
    ViewerSectionUnion.component(
      id: 'component_avatar',
      title: 'Avatar()',
      ctorName: 'Avatar',
      designLink: '''
https://www.figma.com/
''',
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
            isRequired: true,
            isNamed: true,
            defaultValue: null,
            defaultValueCode: '''null''',
            viewerInitSelectorParam:
                'https://images.unsplash.com/photo-1529778873920-4da4926a72c2',
            viewerInitValueCode:
                "'https://images.unsplash.com/photo-1529778873920-4da4926a72c2'",
            documentation: null,
          ),
          FieldMetaData(
            name: 'radius',
            type: double,
            typeName: 'double',
            isNullable: false,
            isRequired: false,
            isNamed: true,
            defaultValue: 30.0,
            defaultValueCode: "30.0",
            viewerInitValueCode: "30.0",
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

// ignore_for_file: type=lint
// ignore_for_file: unused_element

class _$AvatarDuoParamBuilder extends ComponentParamBuilder {
  final dynamic left;
  final dynamic right;

  const _$AvatarDuoParamBuilder({
    required this.left,
    this.right,
  }) : super();
}

final generatedWidgetsMiscAvatarDuoPage = ViewerDocumentPage(
  id: 'avatarDuo',
  namespace: ['widgets', 'misc'],
  title: 'AvatarDuo',
  subtitle: null,
  description: null,
  sections: [
    ViewerSectionUnion.component(
      id: 'component_avatar_duo',
      title: 'AvatarDuo()',
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
            isRequired: true,
            isNamed: true,
            defaultValue: null,
            defaultValueCode: "null",
            viewerInitSelectorParam: AvatarModel(
              uri:
                  'https://images.unsplash.com/photo-1529778873920-4da4926a72c2',
            ),
            viewerInitValueCode:
                '''AvatarModel(uri: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2', )''',
            documentation: null,
          ),
          FieldMetaData(
            name: 'right',
            type: AvatarModel,
            typeName: 'AvatarModel',
            isNullable: false,
            isRequired: false,
            isNamed: true,
            defaultValue: const AvatarModel(
                uri:
                    'https://cdn.omlet.co.uk/images/originals/sleeping_kitten.jpg'),
            defaultValueCode:
                "const AvatarModel(uri: 'https://cdn.omlet.co.uk/images/originals/sleeping_kitten.jpg')",
            viewerInitValueCode:
                "const AvatarModel(uri: 'https://cdn.omlet.co.uk/images/originals/sleeping_kitten.jpg')",
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
