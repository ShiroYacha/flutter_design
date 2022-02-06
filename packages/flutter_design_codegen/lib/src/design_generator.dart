import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:flutter_design_annotation/flutter_design_annotation.dart';
import 'package:source_gen/source_gen.dart';

class DesignGenerator extends GeneratorForAnnotation<TDesign> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    return _generateSource(element, annotation);
  }

  String _generateArgs(List<ParameterElement> params) {
    final sb = StringBuffer();
    for (var param in params.where((e) => e.isPositional)) {
      sb.write('args[\'${param.name}\'],');
    }
    for (var param in params.where((e) => e.isNamed)) {
      if (param.defaultValueCode != null) {
        sb.write(
          '${param.name}: args[\'${param.name}\'] ?? ${param.defaultValueCode},',
        );
      } else {
        sb.write('${param.name}: args[\'${param.name}\'],');
      }
    }
    return sb.toString();
  }

  String _generateCreateStatements(ClassElement classElement) {
    return !classElement.isAbstract
        ? '''
        return ${classElement.name}(tester, logger);
'''
        : '''
        throw UnsupportedError('Cannot construct abstract class');
''';
  }

  // String _generateInvokeStatements(ModelVisitor visitor) {
  //   final sb = StringBuffer();
  //   for (var method in visitor.methods.values) {
  //     final actionId =
  //         extractAnnotationStringField<action>(method.metadata, 'id');
  //     if (actionId != null) {
  //       sb.writeln('''
  //     if(actionId == '$actionId') {
  //       await page.${method.name}(${_generateArgs(method.parameters)});
  //       return;
  //     }''');
  //     }
  //   }
  //   return sb.toString();
  // }

  String _generateSource(
    Element element,
    ConstantReader annotation,
  ) {
    var visitor = ModelVisitor();
    element.visitChildren(visitor);
    final className = visitor.classType.element.name;
    final builder = annotation.read('defaultBuilder');
    final widget = annotation.read('widget');
    return '''
class ${className}CatalogBuilder {
  WidgetBuilder get defaultBuilder => ${builder.objectValue.toFunctionValue()!.displayName};
}
''';
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
