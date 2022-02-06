import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrouter/vrouter.dart';

import 'screens/home_screen.dart';
import 'screens/page_screen.dart';

final rootPagesProvider = Provider<List<ViewerPageGroup>>((ref) => []);

class DesignSystemViewerApp extends HookConsumerWidget {
  final Widget? branding;
  final List<ViewerPageGroup> pageGroups;

  const DesignSystemViewerApp({
    this.branding,
    required this.pageGroups,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        rootPagesProvider.overrideWithValue(pageGroups),
      ],
      child: VRouter(
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        initialUrl: '/',
        routes: [
          VWidget(path: '/', widget: const HomeScreen()),
          ...pageGroups.fold(
            [],
            (previousValue, element) => _buildRoutes(element.children),
          ),
        ],
      ),
    );
  }

  List<VRouteElement> _buildRoutes(List<ViewerPageUnion> pages) {
    return [
      ...pages.map(
        (e) => VWidget(
          path: '/' + e.namespace.join('/') + e.id,
          widget: const PageScreen(),
        ),
      ),
      ...pages.fold(
        [],
        (previousValue, element) => _buildRoutes(element.children),
      )
    ];
  }
}
