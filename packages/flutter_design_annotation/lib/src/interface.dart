typedef ComponentBuilder<TWidget, TBuildContext> = TWidget Function(
  TBuildContext context,
  TDataBuilderFactory<TBuildContext> factory,
);

typedef TUpdateDataBuilder<TWidget, TBuildContext, TData, TParameter> = void
    Function(TDataBuilder<TWidget, TBuildContext, TData, TParameter> builder);

abstract class TDataBuilder<TWidget, TBuildContext, TData, TParameter> {
  /// TODO: see how to make this immutable...
  TParameter parameter;
  TDataBuilder(this.parameter);
  String get name;
  TData build(TBuildContext context, String field);
  TWidget buildDesigner(
    TBuildContext context,
    TUpdateDataBuilder<TWidget, TBuildContext, TData, TParameter> updateBuilder,
  );
  bool hasParameterType(dynamic parameter) {
    return parameter is TParameter;
  }
}

abstract class TDataBuilderFactory<TBuildContext> {
  const TDataBuilderFactory();
  T build<T>(TBuildContext context, String field);
}

abstract class ComponentParamBuilder {
  const ComponentParamBuilder();
}
