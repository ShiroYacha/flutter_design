import 'dart:async';

import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:collection/collection.dart';
import 'package:dart_style/dart_style.dart';
import 'package:flutter_design_annotation/flutter_design_annotation.dart';
import 'package:flutter_design_codegen/src/ast.dart';
import 'package:flutter_design_codegen/src/utils.dart';
import 'package:recase/recase.dart';
import 'package:source_gen/source_gen.dart';

const _designFieldChecker = TypeChecker.fromRuntime(TDesignField);

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
    // TODO: include factory constructors & user defined methods
    final ctor = visitor.classType.element.constructors.first;
    // Construct viewer widget builder source
    final buildCodepair = await _compileBuilderSourceCode(
      resolver: buildStep.resolver,
      visitor: visitor,
      annotation: annotation,
    );
    // Construct typedef map for function types
    final fieldTypedefCodeMap = _compileFunctionTypedefSourceCodeMap(
      resolver: buildStep.resolver,
      clazz: clazz,
      parameters: ctor.parameters,
    );
    // Construct field metadata code
    final fieldMetaDatasetCode = _compileFieldMetaDatasetSourceCode(
      clazz: clazz,
      parameters: ctor.parameters,
      fieldTypedefCodeMap: fieldTypedefCodeMap,
      annotation: annotation,
    );
    final sb = StringBuffer();
    // Prepare typedef for function types
    sb.write(fieldTypedefCodeMap.values.map((e) => '${e.code}\n').join());
    // Assemble page source
    sb.write(
      '''
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
''',
    );
    return sb.toString();
  }

  Future<String> _extractSourceFromElement({
    required Resolver resolver,
    required Element element,
  }) async {
    final buffer = StringBuffer();
    (await resolver.astNodeFor(element))!
        .accept(ToSourceIgnoringDesignAnnotationsVisitor(buffer));
    return DartFormatter().format(
      buffer
          .toString()
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

  /// TODO: improve this
  String? _readLiteralAnnotationValue(DartObject? object) {
    try {
      final label = object.toString();
      return label.substring(label.indexOf('(') + 1, label.indexOf(')'));
    } catch (e) {
      // Do nothing
    }
    return null;
  }

  Future<List<String>> _compileBuilderSourceCode({
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

  Map<ParameterElement, _FunctionTypeDef> _compileFunctionTypedefSourceCodeMap({
    required Resolver resolver,
    required ClassElement clazz,
    required List<ParameterElement> parameters,
  }) {
    final map = <ParameterElement, _FunctionTypeDef>{};
    for (final e in parameters.where((e) => e.type is FunctionType)) {
      final typeCode = _getParameterDisplayString(e);
      final alias = '_\$FunctionAliasFor${ReCase(e.name).pascalCase}';
      map[e] = _FunctionTypeDef(
        alias: alias,
        typeCode: typeCode,
        code: 'typedef $alias = $typeCode;',
      );
    }
    return map;
  }

  String _compileFieldMetaDatasetSourceCode({
    required ClassElement clazz,
    required List<ParameterElement> parameters,
    required Map<ParameterElement, _FunctionTypeDef> fieldTypedefCodeMap,
    required ConstantReader annotation,
  }) {
    final sb = StringBuffer('const [');
    for (final e in parameters.where((e) => e.name != 'key')) {
      // Compute basic meta data
      final type = fieldTypedefCodeMap.containsKey(e)
          ? fieldTypedefCodeMap[e]!.alias
          : _getParameterDisplayString(e);
      final typeName = fieldTypedefCodeMap.containsKey(e)
          ? fieldTypedefCodeMap[e]!.typeCode
          : _getParameterDisplayString(e);
      final fieldDocumentation = _extractFieldDocumentation(clazz, e.name);
      // Check if a design field annotation is provided on the constructor
      // if not fallback to the class field declaration
      final p = clazz.fields.firstWhereOrNull((f) => f.name == e.name);
      final designFieldReader = _designFieldChecker.hasAnnotationOfExact(e)
          ? _designFieldChecker.firstAnnotationOfExact(e)
          : p != null
              ? _designFieldChecker.hasAnnotationOfExact(p)
                  ? _designFieldChecker.firstAnnotationOfExact(p)
                  : null
              : null;
      // Compile initial data builder selector code
      final initialSelectorParam =
          _compileObjectSourceCode(designFieldReader?.getField('parameter'));
      final initialSelectorParamCode = initialSelectorParam.isNotEmpty == true
          ? 'viewerInitSelectorParam: $initialSelectorParam,'
          : '';
      // Compile source
      sb.write(
        '''
FieldMetaData(
  name: '${e.name}',
  type: $type,
  typeName: '$typeName',
  isNullable: ${e.isNullable},
  defaultValue: ${e.defaultValueCode},
  defaultValueCode: ${!e.type.isDartCoreString ? "'''${e.defaultValueCode}'''" : e.defaultValueCode},
  $initialSelectorParamCode
  documentation: ${fieldDocumentation != null ? "'''$fieldDocumentation'''" : null},
),''',
      );
    }
    sb.write(']');
    return sb.toString();
  }

  String _compileObjectSourceCode(DartObject? object) {
    final sb = StringBuffer();
    final objectTypeElement = object?.type?.element;
    if (objectTypeElement != null) {
      final visitor = ModelVisitor();
      objectTypeElement.visitChildren(visitor);
      // Compile base types
      if (visitor.classType.isBaseType) {
        sb.write(_readLiteralAnnotationValue(object));
      }
      // Compile object type, ignore null element types, e.g. null, functions, etc.
      else if (visitor.classType.element.name != 'Null') {
        sb.write(
          '${removeGeneratedCodePrefixSymbols(visitor.classType.element.name)}(',
        );
        final parameters =
            visitor.classType.constructors.firstOrNull?.parameters ?? [];
        for (final field in parameters) {
          final value = object!.getField(field.name);
          final literalValue = _compileObjectSourceCode(value);
          if (value != null) {
            if (field.isPositional) {
              sb.write('$literalValue,');
            } else if (field.isNamed) {
              sb.write('${field.name}: $literalValue,');
            } else {
              throw UnsupportedError('Unsupported field: $field');
            }
          }
        }
        sb.write(')');
      }
    }
    return sb.toString();
  }

  String _getParameterDisplayString(
    ParameterElement e, {
    bool checkNullability = false,
  }) {
    return e.type.getDisplayString(
      // TODO: find a better way to do this...
      withNullability: checkNullability && e.isNullable,
    );
  }

  String? _extractFieldDocumentation(ClassElement clazz, String fieldName) {
    return clazz.fields
        .firstWhereOrNull((e) => e.name == fieldName)
        ?.documentationComment
        ?.replaceAll('^///', '');
  }

  String removeGeneratedCodePrefixSymbols(String className) {
    // TODO: find a way to address workaround on generated classes,
    // e.g. freezed -> currently removing all '_', '$'
    return className.replaceAll(RegExp(r'^[_$]*'), '');
  }
}

extension ParameterElementExtension on ParameterElement {
  // TODO: find a better way as this might not work all the time
  bool get isNullable => isOptional && !hasDefaultValue;
}

extension DartTypeExtension on DartType {
  bool get isBaseType =>
      isDartCoreBool ||
      isDartCoreString ||
      isDartCoreDouble ||
      isDartCoreInt ||
      isDartCoreMap ||
      isDartCoreList ||
      isDartCoreSet ||
      isDartCoreIterable;
}

class _FunctionTypeDef {
  final String alias;
  final String typeCode;
  final String code;
  const _FunctionTypeDef({
    required this.alias,
    required this.typeCode,
    required this.code,
  });
}
