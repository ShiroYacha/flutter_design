// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'containers.dart';

// **************************************************************************
// DesignGenerator
// **************************************************************************

final generatedWidgetsLayoutsContainersSpacedRowPage = ViewerDocumentPage(
  id: 'spacedRow',
  namespace: ['widgets', 'layouts', 'containers'],
  title: 'SpacedRow',
  subtitle: null,
  description: null,
  sections: [
    ViewerSectionUnion.component(
      id: 'anatomy',
      title: 'Anatomy',
      ctorName: 'SpacedRow',
      designLink: null,
      builder: ViewerWidgetBuilder(
        build: (context, factory) => SpacedRow(
          children: factory.build(context, 'children'),
          spacing: factory.build(context, 'spacing'),
        ),
        fieldMetaDataset: const [
          FieldMetaData(
            name: 'children',
            type: List<Widget>,
            typeName: 'List<Widget>',
            isOptional: false,
            defaultValue: null,
            defaultValueCode: null,
            viewerInitValue: null,
            documentation: null,
          ),
          FieldMetaData(
            name: 'spacing',
            type: double,
            typeName: 'double',
            isOptional: true,
            defaultValue: 10.0,
            defaultValueCode: '10.0',
            viewerInitValue: null,
            documentation: null,
          ),
        ],
      ),
      sourceCode: const ViewerSourceCode(
          location: 'package:viewer_example/widgets/layouts/containers.dart',
          code: '''
/// Built from the following function 
(context, factory) => SpacedRow(children: factory.build(context, 'children'),spacing: factory.build(context, 'spacing'),)

/// Widget
class SpacedRow extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  const SpacedRow({required this.children, this.spacing = 10.0, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
        children: children.fold(
            [],
            (pv, e) =>
                [...pv, e, if (children.last != e) SizedBox(width: spacing)]));
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

final generatedWidgetsLayoutsContainersResponsiveEvenRowPage =
    ViewerDocumentPage(
  id: 'responsiveEvenRow',
  namespace: ['widgets', 'layouts', 'containers'],
  title: 'ResponsiveEvenRow',
  subtitle: null,
  description: null,
  sections: [
    ViewerSectionUnion.component(
      id: 'anatomy',
      title: 'Anatomy',
      ctorName: 'ResponsiveEvenRow',
      designLink: null,
      builder: ViewerWidgetBuilder(
        build: (context, factory) => ResponsiveEvenRow(
          childrenCount: factory.build(context, 'childrenCount'),
          widthThreshold: factory.build(context, 'widthThreshold'),
          mainAxisSpacing: factory.build(context, 'mainAxisSpacing'),
          crossAxisSpacing: factory.build(context, 'crossAxisSpacing'),
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
            name: 'widthThreshold',
            type: double,
            typeName: 'double',
            isOptional: true,
            defaultValue: 300.0,
            defaultValueCode: '300.0',
            viewerInitValue: null,
            documentation: null,
          ),
          FieldMetaData(
            name: 'mainAxisSpacing',
            type: double,
            typeName: 'double',
            isOptional: true,
            defaultValue: 10.0,
            defaultValueCode: '10.0',
            viewerInitValue: null,
            documentation: null,
          ),
          FieldMetaData(
            name: 'crossAxisSpacing',
            type: double,
            typeName: 'double',
            isOptional: true,
            defaultValue: 10.0,
            defaultValueCode: '10.0',
            viewerInitValue: null,
            documentation: null,
          ),
        ],
      ),
      sourceCode: const ViewerSourceCode(
          location: 'package:viewer_example/widgets/layouts/containers.dart',
          code: '''
/// Built from the following function 
(context, factory) => ResponsiveEvenRow(childrenCount: factory.build(context, 'childrenCount'),widthThreshold: factory.build(context, 'widthThreshold'),mainAxisSpacing: factory.build(context, 'mainAxisSpacing'),crossAxisSpacing: factory.build(context, 'crossAxisSpacing'),)

/// Widget
class ResponsiveEvenRow extends StatelessWidget {
  final double widthThreshold;
  final int childrenCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  const ResponsiveEvenRow(
      {required this.childrenCount,
      this.widthThreshold = 300.0,
      this.mainAxisSpacing = 10.0,
      this.crossAxisSpacing = 10.0,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return StaggeredGrid.count(
          axisDirection: AxisDirection.down,
          crossAxisCount:
              max((constraints.maxWidth / widthThreshold).floor(), 1),
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          children: List.generate(
              childrenCount,
              (index) => Container(
                  color: Colors.primaries[index % Colors.primaries.length],
                  height: 100)));
    });
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
