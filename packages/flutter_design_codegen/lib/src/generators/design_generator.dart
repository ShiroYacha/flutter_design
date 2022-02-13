import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart';
import 'package:flutter_design_annotation/flutter_design_annotation.dart';
import 'package:recase/recase.dart';
import 'package:source_gen/source_gen.dart';

// TODO: refactor this properly
class DesignGenerator extends GeneratorForAnnotation<TDesign> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    return _generateSource(buildStep, element, annotation);
  }

  Future<String> _generateSource(
    BuildStep buildStep,
    Element element,
    ConstantReader annotation,
  ) async {
    final visitor = ModelVisitor();
    element.visitChildren(visitor);
    // Parse class meta data
    final clazz = visitor.classType.element;
    final className = clazz.name;
    final libPath = clazz.source.fullName
        .substring(clazz.source.fullName.indexOf('/lib/') + 5);
    final fileName = clazz.source.shortName.replaceAll('.dart', '');
    final folderPath = libPath.replaceAll('/${clazz.source.shortName}', '');
    final folderNamespaces =
        folderPath.contains('/') ? folderPath.split('/') : [];
    final namespace = annotation.read('namespace').isList
        ? annotation.read('namespace').listValue
        : folderNamespaces;
    // Construct viewer widget builder source
    final buildCodepair = await _buildBuildBuffer(
      resolver: buildStep.resolver,
      visitor: visitor,
      annotation: annotation,
    );
    final fieldMetaDatasetCode = _buildFieldMetaDatasetBuffer(
      resolver: buildStep.resolver,
      visitor: visitor,
      annotation: annotation,
    );
    // Assemble source
    return '''
final ${ReCase('${folderNamespaces.join('_')}_$fileName').camelCase}Page = ViewerDocumentPage(
  id: '${className.camelCase}',
  namespace: [${namespace.map((e) => "'$e'").join(',')}],
  title: '$className',
  subtitle: ${_readNullableAnnotation(annotation, 'subtitle')},
  description: ${_readNullableAnnotation(annotation, 'description')},
  sections: [
    ViewerSectionUnion.component(
      id: '${className.camelCase}',
      title: 'Anatomy',
      builder: ViewerWidgetBuilder(
        build: ${buildCodepair[0]},
        fieldMetaDataset: $fieldMetaDatasetCode,
      ),
      sourceCode: const ViewerSourceCode(
        location: '${element.librarySource?.uri}',
        code: \'\'\'
/// Built from the following function 
${buildCodepair[1]}

/// Widget
${await _extractSourceFromElement(
      resolver: buildStep.resolver,
      element: element,
    )}
\'\'\'
      ),
    ),
  ],
);
''';
  }

  Future<String> _extractSourceFromElement({
    required Resolver resolver,
    required Element element,
  }) async {
    final code = (await resolver.astNodeFor(element)).toString();
    return DartFormatter().format(
      code
          // TODO: find a better approach, e.g. impl. visitor
          // Skip all annotations
          .substring(element is ClassElement ? code.indexOf('class') : 0)
          // Add commas to all probable places
          .replaceAll(');', ',);')
          .replaceAll('})', ',})'),
    );
  }

  // TODO: improve this..
  dynamic _readNullableAnnotation<T>(ConstantReader annotation, String field) {
    final reader = annotation.read(field);
    if (reader.isNull) return null;
    if (T is String) {
      return reader.stringValue;
    }
    return reader;
  }

  Future<List<String>> _buildBuildBuffer({
    required Resolver resolver,
    required ModelVisitor visitor,
    required ConstantReader annotation,
  }) async {
    final defaultBuilderField = annotation.read('defaultBuilder');
    if (!defaultBuilderField.isNull) {
      // Defer to the user defined builder
      return [
        defaultBuilderField.objectValue.toFunctionValue()!.name,
        await _extractSourceFromElement(
          resolver: resolver,
          element: defaultBuilderField.objectValue.toFunctionValue()!,
        ),
      ];
    }
    final clazz = visitor.classType.element;
    final params = visitor.classType.element.constructors.first.parameters;
    final sb = StringBuffer('(context, factory) => ${clazz.name}(');
    for (final e in params.where((e) => e.name != 'key')) {
      if (e.isNamed) {
        sb.write("${e.name}: factory.build(context, '${e.name}'),");
      } else {
        sb.write("factory.build(context, '${e.name}'),");
      }
    }
    sb.write(')');
    return [sb.toString(), sb.toString()];
  }

  String _buildFieldMetaDatasetBuffer({
    required Resolver resolver,
    required ModelVisitor visitor,
    required ConstantReader annotation,
  }) {
    final sb = StringBuffer('const [');
    // TODO: either disable the user defined defaultBuilder or expand
    // this to include analysis of user provided function
    for (final e in visitor.classType.element.constructors.first.parameters
        .where((e) => e.name != 'key')) {
      // TODO: figure out how to deal with function signature...
      sb.write(
        '''
FieldMetaData(
  name: '${e.name}',
  type: ${e.type.element != null ? e.type.getDisplayString(withNullability: false) : 'Function'},
  isOptional: ${e.isOptional},
),''',
      );
    }
    sb.write(']');
    return sb.toString();
  }
}

class ModelVisitor extends SimpleElementVisitor {
  late InterfaceType classType;
  Map<String, FieldElement> fields = {};
  Map<String, MethodElement> methods = {};

  @override
  void visitConstructorElement(ConstructorElement element) {
    classType = element.returnType;
  }

  @override
  void visitMethodElement(MethodElement element) {
    methods[element.name] = element;
  }

  @override
  void visitFieldElement(FieldElement element) {
    fields[element.name] = element;
  }
}

extension StringParsingExtension on String {
  String prependLineReturnOn(String replacer) => replaceAll(
        replacer,
        '\n$replacer',
      );
  String prependLineReturnOnAll(Iterable<String> replacers) => replacers.fold(
        this,
        (pe, e) => pe.prependLineReturnOn(e),
      );
}
