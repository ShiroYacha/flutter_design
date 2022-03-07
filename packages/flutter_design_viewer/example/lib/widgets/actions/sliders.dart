import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

part 'sliders.design.dart';

@design
class RangeAdjustableSlider extends HookWidget {
  final double max;

  final double min;

  @DesignField(
      parameter: DesignParamSubscriber(
    key: 'value',
    defaultValue: 0.0,
  ))
  final double value;

  @DesignField(
      parameter: DesignParamPublisher(
    key: 'value',
  ))
  final void Function(double) onChanged;

  final bool allowsDecimal;

  const RangeAdjustableSlider({
    required this.value,
    required this.onChanged,
    this.max = 100.0,
    this.min = 0.0,
    this.allowsDecimal = true,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final minTc = useTextEditingController(
      text: allowsDecimal ? min.toString() : min.toStringAsFixed(0),
    );
    final maxTc = useTextEditingController(
      text: allowsDecimal ? max.toString() : max.toStringAsFixed(0),
    );
    final inputDecoration = InputDecoration(
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.all(6),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: theme.primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    final minD = double.tryParse(minTc.text) ?? 0;
    final maxD = double.tryParse(maxTc.text) ?? 0;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value.toStringAsFixed(2)),
          Row(
            children: [
              SizedBox(
                width: 50,
                child: TextField(
                  decoration: inputDecoration.copyWith(
                    label: Text('min', style: theme.textTheme.caption),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(
                        allowsDecimal ? r'(^-?\d*\.?\d*)' : r'(^-?\d*)',
                      ),
                    )
                  ],
                  textAlign: TextAlign.center,
                  controller: minTc,
                ),
              ),
              Expanded(
                  child: Slider(
                max: maxD,
                min: minD,
                value: value.clamp(minD, maxD),
                onChanged: onChanged,
              )),
              SizedBox(
                width: 50,
                child: TextField(
                  decoration: inputDecoration.copyWith(
                    label: Text('max', style: theme.textTheme.caption),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'(^-?\d*)'))
                  ],
                  textAlign: TextAlign.center,
                  controller: maxTc,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
