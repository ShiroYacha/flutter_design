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

const _designFieldChecker = TypeChecker.fromRuntime(DesignField);
const _designExamplesChecker = TypeChecker.fromRuntime(DesignExamples);

/// Generate [ViewerDocumentPage] from @TDesign annotated classes.
class DesignGenerator extends GeneratorForAnnotation<Design> {
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
    // Generate sources for all public constructors, including factory constructors
    final sb = StringBuffer();
    final typedefSourceCodes = <String>[];
    final paramBuilderSourceCodes = <String>[];
    final componentSourceCodes = <String>[];
    // Render ignore statements
    // TODO: only write if it's the first build of the file
    sb.write(
      '''
// ignore_for_file: type=lint
// ignore_for_file: unused_element
''',
    );
    for (final ctor in visitor.classType.element.constructors) {
      final componentSourceModel =
          await _compileComponentSectionSourceCodeModel(
        reader: annotation,
        ctor: ctor,
        resolver: buildStep.resolver,
        clazz: clazz,
        element: element,
        annotation: annotation,
      );
      typedefSourceCodes.add(componentSourceModel.typedefSourceCode);
      componentSourceCodes.add(componentSourceModel.componentSourceCode);
      paramBuilderSourceCodes.add(componentSourceModel.paramBuilderSourceCode);
    }
    // Render typedef for function types
    sb.writeAll(typedefSourceCodes);
    sb.writeln();
    // Render param builders for each constructor
    sb.writeAll(paramBuilderSourceCodes);
    sb.writeln();
    // Render page source
    sb.write(
      '''
final ${buildClassPageFieldName(element)} = ViewerDocumentPage(
  id: '${className.camelCase}',
  namespace: [${namespace.map((e) => "'$e'").join(',')}],
  title: ${_readNullableAnnotationStringValue(annotation, 'title') ?? "'$className'"},
  subtitle: ${_readNullableAnnotationStringValue(annotation, 'subtitle')},
  description: ${_readNullableAnnotationStringValue(annotation, 'description')},
  sections: [
    ${componentSourceCodes.join('\n')}
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

  Future<_ComponentSourceCodeModel> _compileComponentSectionSourceCodeModel({
    required ConstantReader reader,
    required Resolver resolver,
    required Element element,
    required ClassElement clazz,
    required ConstructorElement ctor,
    required ConstantReader annotation,
  }) async {
    // Construct viewer widget builder source
    final buildCode = _compileBuilderSourceCode(
      resolver: resolver,
      ctor: ctor,
      annotation: annotation,
    );

    // Construct typedef map for function types
    final fieldTypedefCodeMap = _compileFunctionTypedefSourceCodeMap(
      resolver: resolver,
      clazz: clazz,
      ctor: ctor,
      parameters: ctor.parameters,
    );

    // Construct field metadata code
    final fieldMetaDatasetModel = _compileFieldMetaDatasetModel(
      clazz: clazz,
      parameters: ctor.parameters,
      fieldTypedefCodeMap: fieldTypedefCodeMap,
      annotation: annotation,
    );

    // Construct full component section source code
    final id = ReCase(ctor.displayName).snakeCase;
    final title = '${ctor.displayName}()';

    /// Construct fields for param builder
    final paramBuilderName =
        '_\$${ReCase(ctor.displayName.replaceAll('.', '_')).pascalCase}ParamBuilder';

    /// Construct examples code
    final examplesCode = _compileExamplesCode(
      clazz: clazz,
      resolver: resolver,
      annotation: annotation,
      ctor: ctor,
      fieldTypedefCodeMap: fieldTypedefCodeMap,
    );

    /// Assemble
    return _ComponentSourceCodeModel(
      typedefSourceCode:
          fieldTypedefCodeMap.values.map((e) => '${e.code}\n').join(),
      componentSourceCode: '''
ViewerSectionUnion.component(
      id: 'component_$id',
      title: '$title',
      ctorName: '${ctor.displayName}',
      designLink: ${_readNullableAnnotationStringValue(annotation, 'designLink')},
      builder: ViewerWidgetBuilder(
        build: $buildCode,
        fieldMetaDataset: const [
${fieldMetaDatasetModel.map((e) => e.sourceCode).join()}
],
      ),
      $examplesCode
      sourceCode: const ViewerSourceCode(
        location: '${element.librarySource!.uri}',
        code: \'\'\'
/// Built from the following function 
$buildCode

/// Widget
${await _extractSourceFromElement(
        resolver: resolver,
        element: element,
      )}
\'\'\'
      ),
    ),
''',
      paramBuilderSourceCode: '''
class $paramBuilderName extends ComponentParamBuilder{
  ${fieldMetaDatasetModel.map((e) => 'final dynamic ${e.name};').join('\n')}
  
  const $paramBuilderName({
${fieldMetaDatasetModel.map((e) => '${e.isRequired ? 'required' : ''} this.${e.name},').join('\n')}
  }) : super();
}
''',
    );
  }

  String _compileExamplesCode({
    required ClassElement clazz,
    required Resolver resolver,
    required ConstructorElement ctor,
    required ConstantReader annotation,
    required Map<ParameterElement, _FunctionTypeDef> fieldTypedefCodeMap,
  }) {
    final sb = StringBuffer();

    // Construct viewer widget builder source
    final buildCode = _compileBuilderSourceCode(
      resolver: resolver,
      ctor: ctor,
      annotation: annotation,
    );

    // Check if a design examples field annotation is provided on the constructor
    // if not fallback to the class field declaration
    final designExamplesReader = _designExamplesChecker.hasAnnotationOf(ctor)
        ? _designExamplesChecker.firstAnnotationOf(ctor)
        : null;
    final examples =
        designExamplesReader?.getField('examples')?.toListValue() ??
            <DartObject>[];
    final exampleCodes = <String>[];
    for (final example in examples) {
      final index = examples.indexOf(example);
      final builder = example.getField('builder');
      final revivable =
          builder?.isNull == false ? ConstantReader(builder).revive() : null;
      // Construct field metadata code
      final fieldMetaDatasetModel = _compileFieldMetaDatasetModel(
        clazz: clazz,
        parameters: ctor.parameters,
        fieldTypedefCodeMap: fieldTypedefCodeMap,
        annotation: annotation,
        positionalParameterObjects: revivable?.positionalArguments ?? [],
        namedParameterObjects: revivable?.namedArguments ?? {},
      );

      exampleCodes.add(
        '''
ViewerComponentExample(
      id: '${ctor.displayName.toLowerCase()}_${index}_example',
      title: '${example.getField('title')?.toStringValue() ?? 'Example $index'}',
      description: '${example.getField('description')?.toStringValue()}',
      builder: ViewerWidgetBuilder(
        build: $buildCode,
        fieldMetaDataset: const [
        ${fieldMetaDatasetModel.map((e) => e.sourceCode).join()}
        ],
      ),
    ),
''',
      );
    }
    if (exampleCodes.isNotEmpty) {
      sb.write('examples: [');
      sb.writeAll(exampleCodes);
      sb.write('],');
    }

    /// Assemble
    return sb.toString();
  }

  Future<String> _extractSourceFromElement({
    required Resolver resolver,
    required Element element,
  }) async {
    final buffer = StringBuffer();
    (await resolver.astNodeFor(element))!
        .accept(ToSourceIgnoringDesignAnnotationsVisitor(buffer));
    return _formatCode(buffer.toString());
  }

  String _formatCode(String code) {
    return DartFormatter().format(
      code
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
    return "'''\n${reader.stringValue}\n'''";
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

  String _compileBuilderSourceCode({
    required Resolver resolver,
    required ConstructorElement ctor,
    required ConstantReader annotation,
  }) {
    final params = ctor.parameters;
    final sb = StringBuffer('(context, factory) => ${ctor.displayName}(');
    for (final e in params.where((e) => e.name != 'key')) {
      if (e.isNamed) {
        sb.write("${e.name}: factory.build(context, '${e.name}'),");
      } else {
        sb.write("factory.build(context, '${e.name}'),");
      }
    }
    sb.write(')');
    return sb.toString();
  }

  Map<ParameterElement, _FunctionTypeDef> _compileFunctionTypedefSourceCodeMap({
    required Resolver resolver,
    required ClassElement clazz,
    required ConstructorElement ctor,
    required List<ParameterElement> parameters,
  }) {
    final map = <ParameterElement, _FunctionTypeDef>{};
    for (final e in parameters.where((e) => e.type is FunctionType)) {
      final typeCode = _getParameterDisplayString(e);
      final alias =
          '_\$FunctionAliasFor${ReCase(e.name).pascalCase}Via${ReCase(ctor.displayName).pascalCase}';
      map[e] = _FunctionTypeDef(
        alias: alias,
        typeCode: typeCode,
        code: 'typedef $alias = $typeCode;',
      );
    }
    return map;
  }

  List<_FieldMetaDataModel> _compileFieldMetaDatasetModel({
    ClassElement? clazz,
    required List<ParameterElement> parameters,
    required Map<ParameterElement, _FunctionTypeDef> fieldTypedefCodeMap,
    required ConstantReader annotation,
    Map<String, DartObject> namedParameterObjects = const {},
    List<DartObject> positionalParameterObjects = const [],
  }) {
    final models = <_FieldMetaDataModel>[];
    final nonKeyParams = parameters.where((e) => e.name != 'key').toList();
    for (final e in nonKeyParams) {
      final index = nonKeyParams.indexOf(e);
      // Compute basic meta data
      final type = fieldTypedefCodeMap.containsKey(e)
          ? fieldTypedefCodeMap[e]!.alias
          : _getParameterDisplayString(e);
      final typeName = fieldTypedefCodeMap.containsKey(e)
          ? fieldTypedefCodeMap[e]!.typeCode
          : _getParameterDisplayString(e);
      final fieldDocumentation =
          clazz != null ? _extractFieldDocumentation(clazz, e.name) : null;
      // Check if a design field annotation is provided on the constructor
      // if not fallback to the class field declaration
      final p = clazz?.fields.firstWhereOrNull((f) => f.name == e.name);
      final designFieldReader = _designFieldChecker.hasAnnotationOf(e)
          ? _designFieldChecker.firstAnnotationOf(e)
          : p != null
              ? _designFieldChecker.hasAnnotationOf(p)
                  ? _designFieldChecker.firstAnnotationOf(p)
                  : null
              : null;
      // Compute default value code
      final defaultValueCode = !e.type.isDartCoreString
          ? '"${e.defaultValueCode}"'
          : "'''${e.defaultValueCode}'''";
      // Compile initial data builder selector code
      var parameter = designFieldReader?.getField('parameter');
      if (e.isPositional &&
          positionalParameterObjects.isNotEmpty &&
          positionalParameterObjects.length > index) {
        parameter = positionalParameterObjects[index];
      } else if (e.isNamed && namedParameterObjects.containsKey(e.name)) {
        parameter = namedParameterObjects[e.name];
      }
      final initialSelectorParam = _compileObjectSourceCode(parameter);
      // Compile model
      models.add(
        _FieldMetaDataModel(
          name: e.name,
          type: type,
          typeName: typeName,
          isRequired: e.isRequiredNamed || e.isRequiredPositional,
          isNullable: e.isNullable,
          isNamed: e.isNamed,
          defaultValue: e.defaultValueCode,
          defaultValueCode: defaultValueCode,
          initialSelectorParamCode: initialSelectorParam,
          viewerInitValueCode: initialSelectorParam.isNotEmpty == true
              ? initialSelectorParam.startsWith("'") &&
                      initialSelectorParam.endsWith("'")
                  ? '"$initialSelectorParam"'
                  : "'''$initialSelectorParam'''"
              : defaultValueCode,
          documentation:
              fieldDocumentation != null ? "'''$fieldDocumentation'''" : null,
        ),
      );
    }
    return models;
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
        final revivable = ConstantReader(object).revive();
        var hasClosure = true;
        if (revivable.accessor.isEmpty) {
          // Use the default constructor
          sb.write(
            '${removeGeneratedCodePrefixSymbols(visitor.classType.element.name)}(',
          );
        } else if (revivable.accessor.contains('.')) {
          // Use the getter
          sb.write(revivable.accessor);
          hasClosure = false;
        } else {
          // Use the factory constructor
          sb.write(
            '${removeGeneratedCodePrefixSymbols(visitor.classType.element.name)}.${revivable.accessor}(',
          );
        }

        for (final pa in revivable.positionalArguments) {
          sb.write('${_compileObjectSourceCode(pa)}, ');
        }
        for (final na in revivable.namedArguments.entries) {
          sb.write('${na.key}: ${_compileObjectSourceCode(na.value)}, ');
        }
        if (hasClosure) {
          sb.write(')');
        }
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

class _ComponentSourceCodeModel {
  final String typedefSourceCode;
  final String paramBuilderSourceCode;
  final String componentSourceCode;
  const _ComponentSourceCodeModel({
    required this.typedefSourceCode,
    required this.paramBuilderSourceCode,
    required this.componentSourceCode,
  });
}

class _FieldMetaDataModel {
  final String name;
  final String type;
  final String typeName;
  final bool isNullable;
  final bool isRequired;
  final bool isNamed;
  final String? defaultValue;
  final String defaultValueCode;
  final String? initialSelectorParamCode;
  final String viewerInitValueCode;
  final String? documentation;
  const _FieldMetaDataModel({
    required this.name,
    required this.type,
    required this.typeName,
    required this.isNullable,
    required this.isRequired,
    required this.isNamed,
    required this.defaultValue,
    required this.defaultValueCode,
    required this.initialSelectorParamCode,
    required this.viewerInitValueCode,
    required this.documentation,
  });

  String get sourceCode => '''
FieldMetaData(
  name: '$name',
  type: $type,
  typeName: '$typeName',
  isNullable: $isNullable,
  isRequired: $isRequired,
  isNamed: $isNamed,
  defaultValue: $defaultValue,
  defaultValueCode: $defaultValueCode,
  ${initialSelectorParamCode?.isNotEmpty == true ? 'viewerInitSelectorParam: $initialSelectorParamCode,' : ''}
  viewerInitValueCode: $viewerInitValueCode,
  documentation: $documentation,
),
''';
}
