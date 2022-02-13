import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart';
import 'package:flutter_design_annotation/flutter_design_annotation.dart';
import 'package:recase/recase.dart';
import 'package:source_gen/source_gen.dart';

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

    // Assemble source
    return '''
final ${ReCase('${folderNamespaces.join('_')}_$fileName').camelCase}Page = ViewerDocumentPage(
  id: '${className.camelCase}',
  namespace: [${namespace.map((e) => '\'$e\'').join(',')}],
  title: '${className}',
  subtitle: ${_readNullableAnnotation(annotation, 'subtitle')},
  description: ${_readNullableAnnotation(annotation, 'description')},
  sections: [
    ViewerSectionUnion.component(
      id: '${className.camelCase}',
      title: 'Anatomy',
      builder: ViewerWidgetBuilder(
        build: (context, data) => $className(child: Text('test')),
      ),
      sourceCode: const ViewerSourceCode(
        location: '',
        code: \'\'\'${await _extractSourceFromElement(
      resolver: buildStep.resolver,
      element: element,
      className: className,
    )}\'\'\'
      ),
    ),
  ],
);
''';
  }

  Future<String> _extractSourceFromElement({
    required Resolver resolver,
    required Element element,
    required String className,
  }) async {
    final code = (await resolver.astNodeFor(
      element,
      resolve: false,
    ))
        .toString();
    return DartFormatter().format(code
        // TODO: find a better approach, e.g. impl. visitor
        // Skip all annotations
        .substring(element is ClassElement ? code.indexOf('class') : 0)
        // Add commas to all probable places
        .replaceAll(');', ',);')
        .replaceAll('})', ',})'));
  }

  dynamic _readNullableAnnotation<T>(ConstantReader annotation, String field) {
    final reader = annotation.read(field);
    if (reader.isNull) return null;
    if (T is String) {
      return '${reader.stringValue}';
    }
    return reader;
  }
}

class ModelVisitor extends SimpleElementVisitor {
  late InterfaceType classType;
  late ClassElement classElement;
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
