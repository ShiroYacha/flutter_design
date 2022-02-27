import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:collection/collection.dart';
import 'package:dart_style/dart_style.dart';
import 'package:flutter_design_annotation/flutter_design_annotation.dart';
import 'package:flutter_design_codegen/src/utils.dart';
import 'package:recase/recase.dart';
import 'package:source_gen/source_gen.dart';

/// Generate [ViewerDocumentPage] from @TDesign annotated classes.
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
    final folderNamespaces =
        extractClassElementFolderNamespace(element as ClassElement);
    final namespace = folderNamespaces;
    // Construct viewer widget builder source
    final buildCodepair = await _extractBuilderSourceCode(
      resolver: buildStep.resolver,
      visitor: visitor,
      annotation: annotation,
    );
    final fieldMetaDatasetCode = _extractFieldMetaDataset(
      resolver: buildStep.resolver,
      clazz: clazz,
      parameters: visitor.classType.element.constructors.first.parameters,
      annotation: annotation,
    );
    // Assemble source
    return '''
final ${buildClassPageFieldName(element)} = ViewerDocumentPage(
  id: '${className.camelCase}',
  namespace: [${namespace.map((e) => "'$e'").join(',')}],
  title: ${_readNullableAnnotationStringValue(annotation, 'title') ?? "'$className'"},
  subtitle: ${_readNullableAnnotationStringValue(annotation, 'subtitle')},
  description: ${_readNullableAnnotationStringValue(annotation, 'description')},
  sections: [
    ViewerSectionUnion.component(
      id: 'anatomy',
      title: 'Anatomy',
      ctorName: '$className',
      designLink: ${_readNullableAnnotationStringValue(annotation, 'designLink')},
      builder: ViewerWidgetBuilder(
        build: ${buildCodepair[0]},
        fieldMetaDataset: $fieldMetaDatasetCode,
      ),
      sourceCode: const ViewerSourceCode(
        location: '${element.librarySource.uri}',
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
    ${annotation.read('showApiDocs').boolValue ? '''
    const ViewerSectionUnion.apiDocs(
      id: 'apiDocs',
      title: 'API reference',
    ),
''' : ''}
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
          .substring(
            element is ClassElement
                ? code.contains('@design')
                    ? code.indexOf('@design class') + 7
                    : code.indexOf(') class') + 2
                : 0,
          )
          // Add commas to all probable places
          .replaceAll('[^(]);', ',);')
          .replaceAll('[^;]})', ',})'),
    );
  }

  String? _readNullableAnnotationStringValue(
    ConstantReader annotation,
    String field,
  ) {
    final reader = annotation.read(field);
    if (reader.isNull) return null;
    return "'''${reader.stringValue}'''";
  }

  dynamic _readNullableAnnotationMapValue(
    ConstantReader annotation,
    String field,
    String key,
    DartType type,
  ) {
    final reader = annotation.read(field);
    if (reader.isNull || !reader.isMap) return null;
    final map = reader.mapValue;
    for (final e in map.entries) {
      if (e.key?.toStringValue() == key) {
        if (type.isDartCoreString) {
          return "r'${e.value!.toStringValue()}'";
        }
        if (type.isDartCoreDouble) {
          return e.value!.toDoubleValue();
        }
        if (type.isDartCoreInt) {
          return e.value!.toIntValue();
        }
        if (type.isDartCoreBool) {
          return e.value!.toBoolValue();
        }
        if (type.isDartCoreList) {
          return e.value!.toListValue();
        }
        if (type.isDartCoreMap) {
          return e.value!.toMapValue();
        }
        if (type.isDartCoreSet) {
          return e.value!.toSetValue();
        }
        if (type.isDartCoreSymbol) {
          return e.value!.toSymbolValue();
        }
        throw UnsupportedError('Dynamic type not supported!');
      }
    }
    return null;
  }

  Future<List<String>> _extractBuilderSourceCode({
    required Resolver resolver,
    required ModelVisitor visitor,
    required ConstantReader annotation,
  }) async {
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

  String _extractFieldMetaDataset({
    required Resolver resolver,
    required ClassElement clazz,
    required List<ParameterElement> parameters,
    required ConstantReader annotation,
  }) {
    final sb = StringBuffer('const [');
    for (final e in parameters.where((e) => e.name != 'key')) {
      // TODO: figure out how to deal with function signature...
      final type = e.type.element != null
          ? e.type.getDisplayString(withNullability: false)
          : 'Function';
      final fieldDocumentation = _extractFieldDocumentation(clazz, e.name);
      sb.write(
        '''
FieldMetaData(
  name: '${e.name}',
  type: $type,
  typeName: '$type',
  isOptional: ${e.isOptional},
  defaultValue: ${e.defaultValueCode},
  defaultValueCode: ${e.defaultValueCode != null ? "'${e.defaultValueCode}'" : null},
  viewerInitValue: ${_readNullableAnnotationMapValue(annotation, 'viewerInitValueMap', e.name, e.type)},
  documentation: ${fieldDocumentation != null ? "'''$fieldDocumentation'''" : null},
),''',
      );
    }
    sb.write(']');
    return sb.toString();
  }

  String? _extractFieldDocumentation(ClassElement clazz, String fieldName) {
    return clazz.fields
        .firstWhereOrNull((e) => e.name == fieldName)
        ?.documentationComment?.replaceAll(r'^///', '');
  }
}
