import 'package:flutter/material.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TrackedNavigatorObserver extends NavigatorObserver {
  final StateController<ViewerState> viewerStateNotifier;

  TrackedNavigatorObserver({
    required this.viewerStateNotifier,
  });

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _registerCurrentUrl(route.settings.name);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _registerCurrentUrl(newRoute?.settings.name);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _registerCurrentUrl(previousRoute?.settings.name);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _registerCurrentUrl(previousRoute?.settings.name);
  }

  void _registerCurrentUrl(String? uriName) {
    if (uriName != null) {
      WidgetsBinding.instance?.scheduleFrameCallback((timeStamp) {
        try {
          viewerStateNotifier.update((state) =>
              state.copyWith(uri: uriName.split(routePathNameSeparator).first));
        } finally {
          // Ignore in case of error
        }
      });
    }
  }
}
