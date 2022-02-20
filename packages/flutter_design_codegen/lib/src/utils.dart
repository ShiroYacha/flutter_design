import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:recase/recase.dart';

bool hasAnnotation<T>(
  List<ElementAnnotation> metadata,
) {
  return acceptAnnotationStringField<T, bool>(metadata, (v) => true) == true;
}

String? extractAnnotationStringField<T>(
  List<ElementAnnotation> metadata,
  String field,
) {
  return acceptAnnotationStringField(
    metadata,
    (v) => v.getField(field)!.toStringValue(),
  );
}

TResult? acceptAnnotationStringField<TAnnotation, TResult>(
  List<ElementAnnotation> metadata,
  TResult? Function(DartObject) visitor,
) {
  for (final md in metadata) {
    final value = md.computeConstantValue()!;
    if (!value.isNull && value.type?.element is ClassElement) {}
    if (value.isNull ||
        value.type?.element is! ClassElement ||
        // TODO: find a better way to check super type
        !TAnnotation.toString()
            .startsWith((value.type!.element! as ClassElement).name)) {
      continue;
    }
    return visitor(value);
  }
  return null;
}

String buildClassPageFieldName(ClassElement element) =>
    'generated${ReCase(extractClassElementFolderNamespace(element, includeClassName: true).join('_')).pascalCase}Page';

List<String> extractClassElementFolderNamespace(
  ClassElement element, {
  bool includeClassName = false,
}) {
  // Retrieve class meta data
  final visitor = ModelVisitor();
  element.visitChildren(visitor);
  // Parse class meta data
  final clazz = visitor.classType.element;
  final libPath = clazz.source.fullName
      .substring(clazz.source.fullName.indexOf('/lib/') + 5);
  final folderPath = libPath.replaceAll('/${clazz.source.shortName}', '');
  final namespace =
      folderPath.contains('/') ? folderPath.split('/') : <String>[folderPath];
  namespace.add(clazz.source.shortName.replaceAll('.dart', ''));
  if (includeClassName) {
    namespace.add(clazz.displayName);
  }
  return namespace;
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
