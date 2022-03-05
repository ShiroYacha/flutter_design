import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'builders.dart';

class ManagedDataBuilderFactory extends DataBuilderFactory {
  final Map<String, DataBuilder> builders;
  const ManagedDataBuilderFactory({
    required this.builders,
  }) : super();

  @override
  T build<T>(BuildContext context, String field) {
    if (builders.containsKey(field)) {
      return builders[field]!.build(context, field);
    }
    throw UnimplementedError();
  }
}

final dataBuilderRegistryProvider =
    Provider<DataBuilderRegistry>((ref) => throw UnimplementedError());

typedef DataBuilderCreator = DataBuilder<dynamic, dynamic> Function([
  dynamic parameter,
]);

class DataBuilderRegistry {
  /// The default data must be positional optional because in case a
  /// not nullable field is marked with [required] there is no default value
  /// with it... So the data builders will have to default to the constructor's
  /// default value
  final Map<Type, List<DataBuilderCreator>> allBuilders;
  const DataBuilderRegistry({
    required this.allBuilders,
  });

  List<DataBuilder> getOptionsFor(
    Type type,
    dynamic parameter,
  ) {
    final options = allBuilders[type]?.map((e) {
          if (parameter == null) {
            return e.call();
          }
          return e.call(parameter);
        }).toList() ??
        [];
    if (options.isEmpty) {
      options.add(DataTemplateDynamicReadonlyBuilder(parameter));
    }
    return options;
  }

  Map<String, List<DataBuilder>> getAllOptionsFor(
          Map<String, FieldMetaData> idFieldMetaDataMap) =>
      {
        for (final kvp in idFieldMetaDataMap.entries)
          kvp.key: [
            ...getOptionsFor(
              kvp.value.type,
              kvp.value.viewerInitSelectorParam ?? kvp.value.defaultValue,
            ),
            if (kvp.value.isNullable) DataTemplateNullBuilder(),
          ]
      };
}
