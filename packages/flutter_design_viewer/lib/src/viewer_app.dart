import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/src/theme.dart';
import 'package:flutter_design_viewer/src/widgets/scaffolds/root_scaffold.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrouter/vrouter.dart';

import 'models/settings.dart';
import 'widgets/screens/home_screen.dart';
import 'widgets/screens/page_screen.dart';

final rootPagesProvider = Provider<List<ViewerPageGroup>>((ref) => []);
final brandingProvider = Provider<Widget?>((ref) => null);
final viewerSettingsProvider =
    Provider<ViewerSettings>((ref) => throw UnimplementedError());

class DesignSystemViewerApp extends HookConsumerWidget {
  final Widget? branding;
  final List<ViewerPageGroup> pageGroups;
  final ViewerSettings settings;

  const DesignSystemViewerApp({
    required this.pageGroups,
    this.branding,
    this.settings = const ViewerSettings(),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        brandingProvider.overrideWithValue(branding),
        rootPagesProvider.overrideWithValue(pageGroups),
        viewerSettingsProvider.overrideWithValue(settings)
      ],
      child: VRouter(
        debugShowCheckedModeBanner: false,
        theme: defaultDarkTheme,
        builder: (context, widget) => RootScaffold(child: widget),
        navigatorObservers: [BotToastNavigatorObserver()],
        initialUrl: '/',
        buildTransition: (animation1, _, child) => FadeTransition(
          opacity: animation1,
          child: child,
        ),
        transitionDuration: const Duration(milliseconds: 250),
        routes: [
          VWidget(path: '/', widget: const HomeScreen()),
          ...pageGroups.fold(
            [],
            (previousValue, element) => [
              ...previousValue,
              ..._buildRoutes(element.children),
            ],
          ),
        ],
      ),
    );
  }

  List<VRouteElement> _buildRoutes(List<ViewerPageUnion> pages) {
    return [
      ...pages.where((e) => e is! ViewerGroupPage).map(
            (e) => VWidget(
              path: e.segmentsUrl,
              widget: ProviderScope(
                overrides: [
                  currentPageProvider.overrideWithValue(e),
                ],
                child: const PageScreen(),
              ),
            ),
          ),
      ...pages.whereType<ViewerGroupPage>().fold(
        [],
        (previousValue, element) => [
          ...previousValue,
          ..._buildRoutes(element.children),
        ],
      )
    ];
  }
}
