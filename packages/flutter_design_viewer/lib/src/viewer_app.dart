import 'package:bot_toast/bot_toast.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:flutter_design_viewer/src/theme.dart';
import 'package:flutter_design_viewer/src/utils.dart';
import 'package:flutter_design_viewer/src/widget_keys.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrouter/vrouter.dart';

import 'commands.dart';
import 'models/settings.dart';
import 'widgets/items/brandings.dart';
import 'widgets/screens/home_screen.dart';
import 'widgets/screens/page_screen.dart';

final pageGroupsProvider = Provider<List<ViewerPageGroup>>((ref) => []);
final brandingProvider = Provider<Widget>((ref) => throw UnimplementedError());
final viewerSettingsProvider =
    Provider<ViewerSettings>((ref) => throw UnimplementedError());
final viewerStateProvider = StateProvider<ViewerState>(
  (ref) => ViewerState(
    viewMode: ViewMode.themes,
    targetDeviceId: Devices.ios.iPhone12.identifier.toString(),
    targetLocaleCode: '',
    targetThemeId: '',
  ),
);

class DesignSystemViewerApp extends HookConsumerWidget {
  final Widget? branding;
  final ViewerSettings settings;
  final List<ViewerPageGroup> pageGroups;

  const DesignSystemViewerApp({
    required this.pageGroups,
    required this.settings,
    this.branding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        brandingProvider.overrideWithValue(branding ?? const DefaultBranding()),
        pageGroupsProvider.overrideWithValue(pageGroups),
        viewerSettingsProvider.overrideWithValue(settings),
      ],
      child: const DesignSystemViewerRouter(),
    );
  }
}

class DesignSystemViewerRouter extends HookConsumerWidget {
  const DesignSystemViewerRouter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageGroups = ref.watch(pageGroupsProvider);
    final viewerSettings = ref.watch(viewerSettingsProvider);
    final viewerState = ref.watch(viewerStateProvider);
    final viewerStateNotifier = ref.read(viewerStateProvider.notifier);
    // Restore viewer state from cache
    useAsyncEffect(() async {
      try {
        final cache = await ViewerState.getFromStorage();
        viewerStateNotifier.state = cache ??
            ViewerState(
              viewMode: ViewMode.themes,
              targetDeviceId: Devices.ios.iPhone12.identifier.toString(),
              targetLocaleCode: viewerSettings.enabledLocales.keys.first,
              targetThemeId: viewerSettings.enabledThemes.keys.first,
            );
      } finally {}
    }, []);
    // Persists viewer state to cache upon changes
    ref.listen<ViewerState>(viewerStateProvider, (previous, next) async {
      if (previous != next) {
        await next.saveToStorage();
      }
    });
    final botToastInit = BotToastInit();
    return VRouter(
      debugShowCheckedModeBanner: false,
      navigatorKey: WidgetKeys.navKey,
      theme: defaultLightTheme,
      darkTheme: defaultDarkTheme,
      themeMode: viewerState.themeMode,
      builder: (context, widget) => botToastInit(
          context,
          Shortcuts(
            shortcuts: const <SingleActivator, Intent>{
              SingleActivator(LogicalKeyboardKey.keyK, meta: true):
                  SearchIntent()
            },
            child: Actions(
              actions: <Type, Action<Intent>>{
                SearchIntent: SearchAction(),
              },
              child: Material(
                child: widget,
              ),
            ),
          )),
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
    );
  }

  List<VRouteElement> _buildRoutes(List<ViewerPageUnion> pages) {
    return [
      ...pages.whereType<ViewerDocumentPage>().map(
            (e) => VWidget(
              path: e.uri,
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
