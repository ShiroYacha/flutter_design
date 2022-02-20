import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/src/widgets/items/data_designers.dart';
import 'package:flutter_design_viewer/src/widgets/items/images.dart';
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

typedef DataBuilderCreator = DataBuilder Function([dynamic defaultData]);

class DataBuilderRegistry {
  /// The default data must be positional optional because in case a
  /// not nullable field is marked with [required] there is no default value
  /// with it... So the data builders will have to default to the constructor's
  /// default value
  final Map<Type, List<DataBuilderCreator>> allBuilders;
  const DataBuilderRegistry({
    required this.allBuilders,
  });

  List<DataBuilder> getOptionsFor(Type type, dynamic defaultData) =>
      allBuilders[type]?.map((e) {
        if (defaultData == null) {
          return e.call();
        }
        return e.call(defaultData);
      }).toList() ??
      [];

  Map<String, List<DataBuilder>> getAllOptionsFor(
          Map<String, FieldMetaData> idFieldMetaDataMap) =>
      {
        for (final kvp in idFieldMetaDataMap.entries)
          kvp.key: [
            ...getOptionsFor(
              kvp.value.type,
              kvp.value.viewerInitValue ?? kvp.value.defaultValue,
            ),
            if (kvp.value.isOptional) DataTemplateNullBuilder(),
          ]
      };
}

class DataTemplateStringRawBuilder extends DataBuilder<String> {
  String raw;
  DataTemplateStringRawBuilder({
    this.raw = 'Type something',
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
  String get name => 'Raw text';
}

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
  String get name => 'Lorem ipsum';
}

class DataTemplateWidgetPlaceholderBuilder extends DataBuilder<Widget> {
  Color color;
  Size size;
  DataTemplateWidgetPlaceholderBuilder({
    this.color = Colors.amber,
    this.size = const Size(100, 100),
  });

  @override
  Widget build(BuildContext context, String field) {
    return CustomPaint(
      key: UniqueKey(),
      size: size,
      painter: PatternPainter(
        theme: Theme.of(context),
        backgroundColor: color.withOpacity(0.8),
        foregroundColor: color,
      ),
    );
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<Widget> updateBuilder,
  ) {
    return DataTemplateWidgetPlaceholderDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Widget placeholder';
}

class DataTemplateWidgetPlaceholderListBuilder
    extends DataBuilder<List<Widget>> {
  Size size;
  int count;
  DataTemplateWidgetPlaceholderListBuilder({
    this.size = const Size(100, 100),
    this.count = 3,
  });

  @override
  List<Widget> build(BuildContext context, String field) {
    return List.generate(
      count,
      (index) {
        final color = Colors.primaries[index % Colors.primaries.length];
        return CustomPaint(
          key: UniqueKey(),
          size: size,
          painter: PatternPainter(
            theme: Theme.of(context),
            backgroundColor: color.withOpacity(0.8),
            foregroundColor: color,
          ),
        );
      },
    );
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<List<Widget>> updateBuilder,
  ) {
    return DataTemplateWidgetPlaceholderListDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Widget placeholder list';
}

class DataTemplateStubFunctionBuilder extends DataBuilder<Function> {
  DataTemplateStubFunctionBuilder();

  @override
  Function build(BuildContext context, String field) {
    return () {};
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<Function> updateBuilder,
  ) {
    return const SizedBox.shrink();
  }

  @override
  String get name => 'Stub function';
}

class DataTemplateNullBuilder extends DataBuilder<void> {
  DataTemplateNullBuilder();

  @override
  void build(BuildContext context, String field) {
    return;
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<Function> updateBuilder,
  ) {
    return const SizedBox.shrink();
  }

  @override
  String get name => 'Null';
}

class DataTemplateColorPickerBuilder extends DataBuilder<Color> {
  Color color;

  DataTemplateColorPickerBuilder({
    this.color = Colors.amber,
  });

  @override
  Color build(BuildContext context, String field) {
    return color;
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<Color> updateBuilder,
  ) {
    return DataTemplateColorPickerDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Color picker';
}

class DataTemplateDoubleBuilder extends DataBuilder<double> {
  double value;

  DataTemplateDoubleBuilder({
    this.value = 0,
  });

  @override
  double build(BuildContext context, String field) {
    return value;
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<double> updateBuilder,
  ) {
    return DataTemplateDoubleDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Double picker';
}

class DataTemplateIntBuilder extends DataBuilder<int> {
  int value;

  DataTemplateIntBuilder({
    this.value = 0,
  });

  @override
  int build(BuildContext context, String field) {
    return value;
  }

  @override
  Widget buildDesigner(
    BuildContext context,
    UpdateDataBuilder<int> updateBuilder,
  ) {
    return DataTemplateIntDesigner(
      builder: this,
      updateBuilder: updateBuilder,
    );
  }

  @override
  String get name => 'Integer picker';
}
