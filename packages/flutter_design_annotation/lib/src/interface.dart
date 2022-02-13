typedef ComponentBuilder<TWidget, TBuildContext> = TWidget Function(
  TBuildContext context,
  TDataBuilderFactory<TBuildContext> factory,
);

typedef TUpdateDataBuilder<TWidget, TBuildContext, TData> = void Function(
    TDataBuilder<TWidget, TBuildContext, TData> builder);

abstract class TDataBuilder<TWidget, TBuildContext, TData> {
  String get name;
  TData build(TBuildContext context, String field);
  TWidget buildDesigner(
    TBuildContext context,
    TUpdateDataBuilder<TWidget, TBuildContext, TData> updateBuilder,
  );
}

abstract class TDataBuilderFactory<TBuildContext> {
  const TDataBuilderFactory();
  T build<T>(TBuildContext context, String field);
}
