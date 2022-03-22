// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen.dart';

// **************************************************************************
// DesignGenerator
// **************************************************************************

// ignore_for_file: type=lint
final generatedScreensHomeScreenHomeScreenPage = ViewerDocumentPage(
  id: 'homeScreen',
  namespace: ['screens', 'home_screen'],
  title: 'HomeScreen',
  subtitle: null,
  description: null,
  sections: [
    ViewerSectionUnion.component(
      id: 'component_anatomy',
      title: 'Anatomy',
      ctorName: 'HomeScreen',
      designLink: null,
      builder: ViewerWidgetBuilder(
        build: (context, factory) => HomeScreen(
          body: factory.build(context, 'body'),
          appbar: factory.build(context, 'appbar'),
        ),
        fieldMetaDataset: const [
          FieldMetaData(
            name: 'body',
            type: Widget,
            typeName: 'Widget',
            isNullable: false,
            defaultValue: null,
            defaultValueCode: "null",
            viewerInitValueCode: "null",
            documentation: null,
          ),
          FieldMetaData(
            name: 'appbar',
            type: AppBar,
            typeName: 'AppBar',
            isNullable: true,
            defaultValue: null,
            defaultValueCode: "null",
            viewerInitValueCode: "null",
            documentation: null,
          ),
        ],
      ),
      sourceCode: const ViewerSourceCode(
          location: 'package:viewer_example/screens/home_screen.dart', code: '''
/// Built from the following function 
(context, factory) => HomeScreen(body: factory.build(context, 'body'),appbar: factory.build(context, 'appbar'),)

/// Widget
class HomeScreen extends StatelessWidget {
  final Widget body;
  final AppBar? appbar;
  const HomeScreen({required this.body, this.appbar, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar,
        body: body,
        floatingActionButton: FloatingActionButton(
            onPressed: () {}, child: const Icon(Ionicons.add)));
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
