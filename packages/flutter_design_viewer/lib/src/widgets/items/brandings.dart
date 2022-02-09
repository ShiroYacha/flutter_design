import 'package:flutter/material.dart';
import 'package:flutter_design_viewer/src/measures.dart';

import 'images.dart';

class DefaultBranding extends StatelessWidget {
  const DefaultBranding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        const ThemableImage(uri: 'assets/images/logo.png'),
        Spacers.h10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Flutter',
              style: theme.textTheme.headline5,
            ),
            Text(
              'Design system',
              style: theme.textTheme.caption,
            ),
          ],
        ),
      ],
    );
  }
}
