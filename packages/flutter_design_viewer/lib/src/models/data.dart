import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/src/widgets/items/data_designers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recase/recase.dart';
import 'package:faker/faker.dart';

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

class DataBuilderRegistry {
  final Map<Type, List<DataBuilder Function()>> allBuilders;
  const DataBuilderRegistry({
    required this.allBuilders,
  });

  List<DataBuilder> getOptionsFor(Type type) =>
      allBuilders[type]!.map((e) => e.call()).toList();

  Map<String, List<DataBuilder>> getAllOptionsFor(
          Map<String, Type> idTypeMap) =>
      {for (final kvp in idTypeMap.entries) kvp.key: getOptionsFor(kvp.value)};
}

// TODO: can we make this immutable?
class DataTemplateStringRawBuilder extends DataBuilder<String> {
  String raw;
  DataTemplateStringRawBuilder({
    this.raw = 'Raw text',
  });

  @override
  String build(BuildContext context, String field) {
    return raw;
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<String> updateBuilder,
  ) {
    return DataTemplateStringRawDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Raw text generator';
}

// TODO: can we make this immutable?
class DataTemplateStringLoremBuilder extends DataBuilder<String> {
  int length;
  int min;
  int max;
  DataTemplateStringLoremBuilder({
    this.length = 10,
    this.min = 0,
    this.max = 100,
  });

  @override
  String build(BuildContext context, String field) {
    return ReCase(
      Faker(seed: field.hashCode).lorem.words(length).join(' '),
    ).sentenceCase;
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<String> updateBuilder,
  ) {
    return DataTemplateStringLoremDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Lorem ipsum generator';
}
