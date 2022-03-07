// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sliders.dart';

// **************************************************************************
// DesignGenerator
// **************************************************************************

typedef _$FunctionAliasForOnChangedViaRangeAdjustableSlider = void Function(
    double);
final generatedWidgetsActionsSlidersRangeAdjustableSliderPage =
    ViewerDocumentPage(
  id: 'rangeAdjustableSlider',
  namespace: ['widgets', 'actions', 'sliders'],
  title: 'RangeAdjustableSlider',
  subtitle: null,
  description: null,
  sections: [
    ViewerSectionUnion.component(
      id: 'component_anatomy',
      title: 'Anatomy',
      ctorName: 'RangeAdjustableSlider',
      designLink: null,
      builder: ViewerWidgetBuilder(
        build: (context, factory) => RangeAdjustableSlider(
          value: factory.build(context, 'value'),
          onChanged: factory.build(context, 'onChanged'),
          max: factory.build(context, 'max'),
          min: factory.build(context, 'min'),
          allowsDecimal: factory.build(context, 'allowsDecimal'),
        ),
        fieldMetaDataset: const [
          FieldMetaData(
            name: 'value',
            type: double,
            typeName: 'double',
            isNullable: false,
            defaultValue: null,
            defaultValueCode: '''null''',
            viewerInitSelectorParam: DesignParamSubscriber(
              defaultValue: 0.0,
              key: 'value',
            ),
            documentation: null,
          ),
          FieldMetaData(
            name: 'onChanged',
            type: _$FunctionAliasForOnChangedViaRangeAdjustableSlider,
            typeName: 'void Function(double)',
            isNullable: false,
            defaultValue: null,
            defaultValueCode: '''null''',
            viewerInitSelectorParam: DesignParamPublisher(
              key: 'value',
            ),
            documentation: null,
          ),
          FieldMetaData(
            name: 'max',
            type: double,
            typeName: 'double',
            isNullable: false,
            defaultValue: 100.0,
            defaultValueCode: '''100.0''',
            documentation: null,
          ),
          FieldMetaData(
            name: 'min',
            type: double,
            typeName: 'double',
            isNullable: false,
            defaultValue: 0.0,
            defaultValueCode: '''0.0''',
            documentation: null,
          ),
          FieldMetaData(
            name: 'allowsDecimal',
            type: bool,
            typeName: 'bool',
            isNullable: false,
            defaultValue: true,
            defaultValueCode: '''true''',
            documentation: null,
          ),
        ],
      ),
      sourceCode: const ViewerSourceCode(
          location: 'package:viewer_example/widgets/actions/sliders.dart',
          code: '''
/// Built from the following function 
(context, factory) => RangeAdjustableSlider(value: factory.build(context, 'value'),onChanged: factory.build(context, 'onChanged'),max: factory.build(context, 'max'),min: factory.build(context, 'min'),allowsDecimal: factory.build(context, 'allowsDecimal'),)

/// Widget
class RangeAdjustableSlider extends HookWidget {
  final double max;
  final double min;
  final double value;
  final void Function(double) onChanged;
  final bool allowsDecimal;
  const RangeAdjustableSlider(
      {required this.value,
      required this.onChanged,
      this.max = 100.0,
      this.min = 0.0,
      this.allowsDecimal = true,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final minTc = useTextEditingController(
        text: allowsDecimal ? min.toString() : min.toStringAsFixed(0));
    final maxTc = useTextEditingController(
        text: allowsDecimal ? max.toString() : max.toStringAsFixed(0));
    final inputDecoration = InputDecoration(
        border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1),
            borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.all(6),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: theme.primaryColor),
            borderRadius: BorderRadius.circular(8)));
    final minD = double.tryParse(minTc.text) ?? 0;
    final maxD = double.tryParse(maxTc.text) ?? 0;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(value.toStringAsFixed(2)),
          Row(children: [
            SizedBox(
                width: 50,
                child: TextField(
                    decoration: inputDecoration.copyWith(
                        label: Text('min', style: theme.textTheme.caption)),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                          allowsDecimal ? r'(^-?\d*\.?\d*)' : r'(^-?\d*)'))
                    ],
                    textAlign: TextAlign.center,
                    controller: minTc)),
            Expanded(
                child: Slider(
                    max: maxD,
                    min: minD,
                    value: value.clamp(minD, maxD),
                    onChanged: onChanged)),
            SizedBox(
                width: 50,
                child: TextField(
                    decoration: inputDecoration.copyWith(
                        label: Text('max', style: theme.textTheme.caption)),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'(^-?\d*)'))
                    ],
                    textAlign: TextAlign.center,
                    controller: maxTc))
          ])
        ]));
  }
}

'''),
    ),
    const ViewerSectionUnion.apiDocs(
      id: 'apiDocs',
      title: 'API reference',
    ),
  ],
);
