import 'package:flutter/material.dart';

class Error404Screen extends StatelessWidget {
  const Error404Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Text(
          '😭 404\nNothing is here...',
          style: theme.textTheme.headline2,
        ),
      ),
    );
  }
}
