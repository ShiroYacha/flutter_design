import 'dart:ui';

import 'package:flutter/material.dart';

class KeyContainer extends StatelessWidget {
  final String label;
  const KeyContainer({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: theme.cardColor,
      ),
      width: 24,
      height: 24,
      child: Center(
        child: Text(
          label,
          style: theme.textTheme.button!.copyWith(
            fontFeatures: [const FontFeature.tabularFigures()],
            textBaseline: TextBaseline.alphabetic,
          ),
        ),
      ),
    );
  }
}
