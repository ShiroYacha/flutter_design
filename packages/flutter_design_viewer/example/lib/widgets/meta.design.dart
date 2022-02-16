// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// DesignGenerator
// **************************************************************************

final widgetsMetaPage = ViewerDocumentPage(
  id: 'responsiveEvenRowWrapper',
  namespace: ['widgets', 'meta'],
  title: '''ResponsiveEvenRow''',
  subtitle: null,
  description: null,
  sections: [
    ViewerSectionUnion.component(
      id: 'anatomy',
      title: 'Anatomy',
      ctorName: 'ResponsiveEvenRowWrapper',
      designLink: null,
      builder: ViewerWidgetBuilder(
        build: (context, factory) => ResponsiveEvenRowWrapper(
          childrenCount: factory.build(context, 'childrenCount'),
          mobileBreakpoint: factory.build(context, 'mobileBreakpoint'),
          tabletBreakpoint: factory.build(context, 'tabletBreakpoint'),
          desktopBreakpoint: factory.build(context, 'desktopBreakpoint'),
        ),
        fieldMetaDataset: const [
          FieldMetaData(
            name: 'childrenCount',
            type: int,
            typeName: 'int',
            isOptional: false,
            defaultValue: null,
            defaultValueCode: null,
            viewerInitValue: 6,
            documentation: null,
          ),
          FieldMetaData(
            name: 'mobileBreakpoint',
            type: double,
            typeName: 'double',
            isOptional: true,
            defaultValue: 320.0,
            defaultValueCode: '320.0',
            viewerInitValue: null,
            documentation: null,
          ),
          FieldMetaData(
            name: 'tabletBreakpoint',
            type: double,
            typeName: 'double',
            isOptional: true,
            defaultValue: 768.0,
            defaultValueCode: '768.0',
            viewerInitValue: null,
            documentation: null,
          ),
          FieldMetaData(
            name: 'desktopBreakpoint',
            type: double,
            typeName: 'double',
            isOptional: true,
            defaultValue: 1024.0,
            defaultValueCode: '1024.0',
            viewerInitValue: null,
            documentation: null,
          ),
        ],
      ),
      sourceCode: const ViewerSourceCode(
          location: 'package:viewer_example/widgets/meta.dart', code: '''
/// Built from the following function 
(context, factory) => ResponsiveEvenRowWrapper(childrenCount: factory.build(context, 'childrenCount'),mobileBreakpoint: factory.build(context, 'mobileBreakpoint'),tabletBreakpoint: factory.build(context, 'tabletBreakpoint'),desktopBreakpoint: factory.build(context, 'desktopBreakpoint'),)

/// Widget
class ResponsiveEvenRowWrapper extends StatelessWidget {
  final double mobileBreakpoint;
  final double tabletBreakpoint;
  final double desktopBreakpoint;
  final int childrenCount;
  const ResponsiveEvenRowWrapper({
    required this.childrenCount,
    this.mobileBreakpoint = 320.0,
    this.tabletBreakpoint = 768.0,
    this.desktopBreakpoint = 1024.0,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        overrides: [
          breakpointsProvider.overrideWithValue(Breakpoints(
              mobile: mobileBreakpoint,
              tablet: tabletBreakpoint,
              desktop: desktopBreakpoint))
        ],
        child: ResponsiveEvenRow(
            children: List.generate(
                childrenCount,
                (index) => Container(
                    height: 100,
                    color:
                        Colors.primaries[index % Colors.primaries.length]))));
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
