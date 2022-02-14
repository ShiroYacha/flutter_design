import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:recase/recase.dart';
import 'package:source_gen/source_gen.dart';

import 'generators/design_generator.dart';

bool hasAnnotation<T>(
  List<ElementAnnotation> metadata,
) {
  return acceptAnnotationStringField(metadata, (v) => true) == true;
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
    if (value.isNull ||
        value.type!.getDisplayString(withNullability: false) !=
            TAnnotation.toString()) {
      continue;
    }
    return visitor(value);
  }
  return null;
}

String buildClassPageFieldName(ClassElement element) =>
    '${ReCase(extractClassElementFolderNamespace(element).join('_')).camelCase}Page';

List<String> extractClassElementFolderNamespace(ClassElement element) {
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
  return namespace;
}

Never throwUnsupported(FieldElement element, String message) =>
    throw InvalidGenerationSourceError(
      'Error with `@JsonKey` on the `${element.name}` field. $message',
      element: element,
    );

/// Returns a literal value for [dartObject] if possible, otherwise throws
/// an [InvalidGenerationSourceError] using [typeInformation] to describe
/// the unsupported type.
Object? literalForObject(
  FieldElement element,
  String fieldName,
  DartObject dartObject,
  Iterable<String> typeInformation,
) {
  if (dartObject.isNull) {
    return null;
  }

  final reader = ConstantReader(dartObject);

  String? badType;
  if (reader.isSymbol) {
    badType = 'Symbol';
  } else if (reader.isType) {
    badType = 'Type';
  } else if (dartObject.type is FunctionType) {
    // TODO: Support calling function for the default value?
    badType = 'Function';
  } else if (!reader.isLiteral) {
    badType = dartObject.type!.element!.name;
  }

  if (badType != null) {
    badType = typeInformation.followedBy([badType]).join(' > ');
    throwUnsupported(
      element,
      '`$fieldName` is `$badType`, it must be a literal.',
    );
  }

  if (reader.isDouble || reader.isInt || reader.isString || reader.isBool) {
    return reader.literalValue;
  }

  if (reader.isList) {
    return [
      for (var e in reader.listValue)
        literalForObject(element, fieldName, e, [
          ...typeInformation,
          'List',
        ])
    ];
  }

  if (reader.isSet) {
    return {
      for (var e in reader.setValue)
        literalForObject(element, fieldName, e, [
          ...typeInformation,
          'Set',
        ])
    };
  }

  if (reader.isMap) {
    final mapTypeInformation = [
      ...typeInformation,
      'Map',
    ];
    return reader.mapValue.map(
      (k, v) => MapEntry(
        literalForObject(element, fieldName, k!, mapTypeInformation),
        literalForObject(element, fieldName, v!, mapTypeInformation),
      ),
    );
  }

  badType = typeInformation.followedBy(['$dartObject']).join(' > ');

  throwUnsupported(
    element,
    'The provided value is not supported: $badType. '
    'This may be an error in package:json_serializable. '
    'Please rerun your build with `--verbose` and file an issue.',
  );
}
