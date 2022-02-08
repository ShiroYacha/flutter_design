import 'package:flutter/material.dart';
import 'package:flutter_design_viewer/src/widget_keys.dart';

import 'widgets/dialogs/search_dialog.dart';

class SearchIntent extends Intent {
  const SearchIntent();
}

class SearchAction extends Action<SearchIntent> {
  bool _canSearch = true;

  @override
  Object? invoke(SearchIntent intent) async {
    _canSearch = false;
    final context = WidgetKeys.navKey.currentContext!;
    final theme = Theme.of(context);
    await showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: theme.dialogBackgroundColor.withOpacity(0.5),
      builder: (context) {
        return const SearchDialog();
      },
    );
    _canSearch = true;
  }

  @override
  bool get isActionEnabled => _canSearch;
}
