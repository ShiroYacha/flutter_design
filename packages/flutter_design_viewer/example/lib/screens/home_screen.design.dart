// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen.dart';

// **************************************************************************
// DesignGenerator
// **************************************************************************

final screensHomeScreenPage = ViewerDocumentPage(
  id: 'homeScreen',
  namespace: ['screens', 'home_screen'],
  title: 'HomeScreen',
  subtitle: null,
  description: null,
  sections: [
    ViewerSectionUnion.component(
      id: 'homeScreen',
      title: 'Anatomy',
      builder: ViewerWidgetBuilder(
        build: (context, factory) => HomeScreen(
          body: factory.build(context, 'body'),
        ),
        fieldMetaDataset: const [
          FieldMetaData(
            name: 'body',
            type: Widget,
            isOptional: false,
          ),
        ],
      ),
      sourceCode: const ViewerSourceCode(
          location: 'package:viewer_example/screens/home_screen.dart', code: '''
/// Built from the following function 
(context, factory) => HomeScreen(body: factory.build(context, 'body'),)

/// Widget
class HomeScreen extends StatelessWidget {
  final Widget body;
  const HomeScreen({
    required this.body,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: body,
        floatingActionButton: FloatingActionButton(
            onPressed: () {}, child: const Icon(Ionicons.add)));
  }
}

'''),
    ),
  ],
);
