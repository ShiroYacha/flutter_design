// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'containers.dart';

// **************************************************************************
// DesignGenerator
// **************************************************************************

// ignore_for_file: type=lint
// ignore_for_file: unused_element

class _$SpacedRowParamBuilder extends ComponentParamBuilder {
  final dynamic children;
  final dynamic spacing;

  const _$SpacedRowParamBuilder({
    required this.children,
    this.spacing,
  }) : super();
}

final generatedWidgetsLayoutsContainersSpacedRowPage = ViewerDocumentPage(
  id: 'spacedRow',
  namespace: ['widgets', 'layouts', 'containers'],
  title: 'SpacedRow',
  subtitle: null,
  description: null,
  sections: [
    ViewerSectionUnion.component(
      id: 'component_spaced_row',
      title: 'SpacedRow()',
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
            isNullable: false,
            isRequired: true,
            isNamed: true,
            defaultValue: null,
            defaultValueCode: "null",
            viewerInitValueCode: "null",
            documentation: null,
          ),
          FieldMetaData(
            name: 'spacing',
            type: double,
            typeName: 'double',
            isNullable: false,
            isRequired: false,
            isNamed: true,
            defaultValue: 10.0,
            defaultValueCode: "10.0",
            viewerInitValueCode: "10.0",
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

// ignore_for_file: type=lint
// ignore_for_file: unused_element

class _$ResponsiveEvenRowParamBuilder extends ComponentParamBuilder {
  final dynamic childrenCount;
  final dynamic widthThreshold;
  final dynamic mainAxisSpacing;
  final dynamic crossAxisSpacing;

  const _$ResponsiveEvenRowParamBuilder({
    required this.childrenCount,
    this.widthThreshold,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
  }) : super();
}

final generatedWidgetsLayoutsContainersResponsiveEvenRowPage =
    ViewerDocumentPage(
  id: 'responsiveEvenRow',
  namespace: ['widgets', 'layouts', 'containers'],
  title: 'ResponsiveEvenRow',
  subtitle: null,
  description: null,
  sections: [
    ViewerSectionUnion.component(
      id: 'component_responsive_even_row',
      title: 'ResponsiveEvenRow()',
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
            isNullable: false,
            isRequired: true,
            isNamed: true,
            defaultValue: null,
            defaultValueCode: "null",
            viewerInitSelectorParam: 4,
            viewerInitValueCode: '''4''',
            documentation: '''/// Number of children widgets
///
/// Note: the children are placeholders generated by the [childrenCount]''',
          ),
          FieldMetaData(
            name: 'widthThreshold',
            type: double,
            typeName: 'double',
            isNullable: false,
            isRequired: false,
            isNamed: true,
            defaultValue: 300.0,
            defaultValueCode: "300.0",
            viewerInitValueCode: "300.0",
            documentation:
                '''/// The width threshold to be partitioned to display the widgets in a staggered grid''',
          ),
          FieldMetaData(
            name: 'mainAxisSpacing',
            type: double,
            typeName: 'double',
            isNullable: false,
            isRequired: false,
            isNamed: true,
            defaultValue: 10.0,
            defaultValueCode: "10.0",
            viewerInitValueCode: "10.0",
            documentation: '''/// Spacing between items along the main axis''',
          ),
          FieldMetaData(
            name: 'crossAxisSpacing',
            type: double,
            typeName: 'double',
            isNullable: false,
            isRequired: false,
            isNamed: true,
            defaultValue: 10.0,
            defaultValueCode: "10.0",
            viewerInitValueCode: "10.0",
            documentation: '''/// Spacing between items along the cross axis''',
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
    return StaggeredGrid.extent(
        axisDirection: AxisDirection.down,
        maxCrossAxisExtent: widthThreshold,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        children: List.generate(
            childrenCount,
            (index) => Container(
                color: Colors.primaries[index % Colors.primaries.length],
                height: 100)));
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

class _$ResponsiveSizedBoxParamBuilder extends ComponentParamBuilder {
  final dynamic child;
  final dynamic widthWhenConstrained;
  final dynamic paddingWhenConstrained;
  final dynamic centeredWhenConstrained;
  final dynamic breakpoint;

  const _$ResponsiveSizedBoxParamBuilder({
    required this.child,
    this.widthWhenConstrained,
    this.paddingWhenConstrained,
    this.centeredWhenConstrained,
    this.breakpoint,
  }) : super();
}

final generatedWidgetsLayoutsContainersResponsiveSizedBoxPage =
    ViewerDocumentPage(
  id: 'responsiveSizedBox',
  namespace: ['widgets', 'layouts', 'containers'],
  title: 'ResponsiveSizedBox',
  subtitle: '''
A `SizedBox` that responsively adapt it's `width` based on the
screen factor.
''',
  description: '''
It is very common on smaller screens to stretch the content horizontally. However 
on bigger screens, it is better to center its content with a fixed max width.

''',
  sections: [
    ViewerSectionUnion.component(
      id: 'component_responsive_sized_box',
      title: 'ResponsiveSizedBox()',
      ctorName: 'ResponsiveSizedBox',
      designLink: null,
      builder: ViewerWidgetBuilder(
        build: (context, factory) => ResponsiveSizedBox(
          child: factory.build(context, 'child'),
          widthWhenConstrained: factory.build(context, 'widthWhenConstrained'),
          paddingWhenConstrained:
              factory.build(context, 'paddingWhenConstrained'),
          centeredWhenConstrained:
              factory.build(context, 'centeredWhenConstrained'),
          breakpoint: factory.build(context, 'breakpoint'),
        ),
        fieldMetaDataset: const [
          FieldMetaData(
            name: 'child',
            type: Widget,
            typeName: 'Widget',
            isNullable: false,
            isRequired: true,
            isNamed: true,
            defaultValue: null,
            defaultValueCode: "null",
            viewerInitSelectorParam: DesignParamWidgetPlaceholder(
              size: Size.infinite,
            ),
            viewerInitValueCode:
                '''DesignParamWidgetPlaceholder(size: Size.infinite, )''',
            documentation: '''/// The child widget''',
          ),
          FieldMetaData(
            name: 'widthWhenConstrained',
            type: double,
            typeName: 'double',
            isNullable: false,
            isRequired: false,
            isNamed: true,
            defaultValue: 400.0,
            defaultValueCode: "400.0",
            viewerInitValueCode: "400.0",
            documentation:
                '''/// The maximum size of the child widget when constrained''',
          ),
          FieldMetaData(
            name: 'paddingWhenConstrained',
            type: EdgeInsets,
            typeName: 'EdgeInsets',
            isNullable: false,
            isRequired: false,
            isNamed: true,
            defaultValue: const EdgeInsets.all(20),
            defaultValueCode: "const EdgeInsets.all(20)",
            viewerInitValueCode: "const EdgeInsets.all(20)",
            documentation:
                '''/// The padding of the child widget when constrained''',
          ),
          FieldMetaData(
            name: 'centeredWhenConstrained',
            type: bool,
            typeName: 'bool',
            isNullable: false,
            isRequired: false,
            isNamed: true,
            defaultValue: true,
            defaultValueCode: "true",
            viewerInitValueCode: "true",
            documentation:
                '''/// Indicates if the child should be wrapped in a [Center] when constrained''',
          ),
          FieldMetaData(
            name: 'breakpoint',
            type: double,
            typeName: 'double',
            isNullable: false,
            isRequired: false,
            isNamed: true,
            defaultValue: 420,
            defaultValueCode: "420",
            viewerInitValueCode: "420",
            documentation:
                '''/// The breakpoint from which the child widget gets constrained''',
          ),
        ],
      ),
      examples: [
        ViewerComponentExample(
          id: 'responsivesizedbox_0_example',
          title: 'Example red',
          description: 'Example case with red infinite placeholder as child',
          builder: ViewerWidgetBuilder(
            build: (context, factory) => ResponsiveSizedBox(
              child: factory.build(context, 'child'),
              widthWhenConstrained:
                  factory.build(context, 'widthWhenConstrained'),
              paddingWhenConstrained:
                  factory.build(context, 'paddingWhenConstrained'),
              centeredWhenConstrained:
                  factory.build(context, 'centeredWhenConstrained'),
              breakpoint: factory.build(context, 'breakpoint'),
            ),
            fieldMetaDataset: const [
              FieldMetaData(
                name: 'child',
                type: Widget,
                typeName: 'Widget',
                isNullable: false,
                isRequired: true,
                isNamed: true,
                defaultValue: null,
                defaultValueCode: "null",
                viewerInitSelectorParam: DesignParamWidgetPlaceholder(
                  size: Size.infinite,
                ),
                viewerInitValueCode:
                    '''DesignParamWidgetPlaceholder(size: Size.infinite, )''',
                documentation: '''/// The child widget''',
              ),
              FieldMetaData(
                name: 'widthWhenConstrained',
                type: double,
                typeName: 'double',
                isNullable: false,
                isRequired: false,
                isNamed: true,
                defaultValue: 400.0,
                defaultValueCode: "400.0",
                viewerInitValueCode: "400.0",
                documentation:
                    '''/// The maximum size of the child widget when constrained''',
              ),
              FieldMetaData(
                name: 'paddingWhenConstrained',
                type: EdgeInsets,
                typeName: 'EdgeInsets',
                isNullable: false,
                isRequired: false,
                isNamed: true,
                defaultValue: const EdgeInsets.all(20),
                defaultValueCode: "const EdgeInsets.all(20)",
                viewerInitValueCode: "const EdgeInsets.all(20)",
                documentation:
                    '''/// The padding of the child widget when constrained''',
              ),
              FieldMetaData(
                name: 'centeredWhenConstrained',
                type: bool,
                typeName: 'bool',
                isNullable: false,
                isRequired: false,
                isNamed: true,
                defaultValue: true,
                defaultValueCode: "true",
                viewerInitValueCode: "true",
                documentation:
                    '''/// Indicates if the child should be wrapped in a [Center] when constrained''',
              ),
              FieldMetaData(
                name: 'breakpoint',
                type: double,
                typeName: 'double',
                isNullable: false,
                isRequired: false,
                isNamed: true,
                defaultValue: 420,
                defaultValueCode: "420",
                viewerInitValueCode: "420",
                documentation:
                    '''/// The breakpoint from which the child widget gets constrained''',
              ),
            ],
          ),
        ),
        ViewerComponentExample(
          id: 'responsivesizedbox_1_example',
          title: 'Example blue',
          description: 'Example case with blue infinite placeholder as child',
          builder: ViewerWidgetBuilder(
            build: (context, factory) => ResponsiveSizedBox(
              child: factory.build(context, 'child'),
              widthWhenConstrained:
                  factory.build(context, 'widthWhenConstrained'),
              paddingWhenConstrained:
                  factory.build(context, 'paddingWhenConstrained'),
              centeredWhenConstrained:
                  factory.build(context, 'centeredWhenConstrained'),
              breakpoint: factory.build(context, 'breakpoint'),
            ),
            fieldMetaDataset: const [
              FieldMetaData(
                name: 'child',
                type: Widget,
                typeName: 'Widget',
                isNullable: false,
                isRequired: true,
                isNamed: true,
                defaultValue: null,
                defaultValueCode: "null",
                viewerInitSelectorParam: DesignParamWidgetPlaceholder(
                  size: Size.infinite,
                ),
                viewerInitValueCode:
                    '''DesignParamWidgetPlaceholder(size: Size.infinite, )''',
                documentation: '''/// The child widget''',
              ),
              FieldMetaData(
                name: 'widthWhenConstrained',
                type: double,
                typeName: 'double',
                isNullable: false,
                isRequired: false,
                isNamed: true,
                defaultValue: 400.0,
                defaultValueCode: "400.0",
                viewerInitValueCode: "400.0",
                documentation:
                    '''/// The maximum size of the child widget when constrained''',
              ),
              FieldMetaData(
                name: 'paddingWhenConstrained',
                type: EdgeInsets,
                typeName: 'EdgeInsets',
                isNullable: false,
                isRequired: false,
                isNamed: true,
                defaultValue: const EdgeInsets.all(20),
                defaultValueCode: "const EdgeInsets.all(20)",
                viewerInitValueCode: "const EdgeInsets.all(20)",
                documentation:
                    '''/// The padding of the child widget when constrained''',
              ),
              FieldMetaData(
                name: 'centeredWhenConstrained',
                type: bool,
                typeName: 'bool',
                isNullable: false,
                isRequired: false,
                isNamed: true,
                defaultValue: true,
                defaultValueCode: "true",
                viewerInitValueCode: "true",
                documentation:
                    '''/// Indicates if the child should be wrapped in a [Center] when constrained''',
              ),
              FieldMetaData(
                name: 'breakpoint',
                type: double,
                typeName: 'double',
                isNullable: false,
                isRequired: false,
                isNamed: true,
                defaultValue: 420,
                defaultValueCode: "420",
                viewerInitValueCode: "420",
                documentation:
                    '''/// The breakpoint from which the child widget gets constrained''',
              ),
            ],
          ),
        ),
      ],
      sourceCode: const ViewerSourceCode(
          location: 'package:viewer_example/widgets/layouts/containers.dart',
          code: '''
/// Built from the following function 
(context, factory) => ResponsiveSizedBox(child: factory.build(context, 'child'),widthWhenConstrained: factory.build(context, 'widthWhenConstrained'),paddingWhenConstrained: factory.build(context, 'paddingWhenConstrained'),centeredWhenConstrained: factory.build(context, 'centeredWhenConstrained'),breakpoint: factory.build(context, 'breakpoint'),)

/// Widget
class ResponsiveSizedBox extends StatelessWidget {
  const ResponsiveSizedBox(
      {required this.child,
      this.widthWhenConstrained = 400.0,
      this.paddingWhenConstrained = const EdgeInsets.all(20),
      this.centeredWhenConstrained = true,
      this.breakpoint = 420,
      Key? key})
      : super(key: key);
  final Widget child;
  final double widthWhenConstrained;
  final EdgeInsets paddingWhenConstrained;
  final bool centeredWhenConstrained;
  final double breakpoint;
  @override
  Widget build(BuildContext context) {
    final bool constrained = MediaQuery.of(context).size.width >= breakpoint;
    final content = Padding(
        padding: constrained ? paddingWhenConstrained : EdgeInsets.zero,
        child: SizedBox(
            width: constrained ? widthWhenConstrained : null, child: child));
    return centeredWhenConstrained ? Center(child: content) : content;
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
