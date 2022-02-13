import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:flutter_design_viewer/src/models/data.dart';
import 'package:flutter_design_viewer/src/theme.dart';
import 'package:flutter_design_viewer/src/utils.dart';
import 'package:flutter_design_viewer/src/widget_keys.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrouter/vrouter.dart';

import 'commands.dart';
import 'models/settings.dart';
import 'navigator_observer.dart';
import 'widgets/items/brandings.dart';
import 'widgets/scaffolds/root_scaffold.dart';
import 'widgets/screens/page_screen.dart';

final pageGroupsProvider = Provider<List<ViewerPageGroup>>((ref) => []);
final brandingProvider = Provider<Widget>((ref) => throw UnimplementedError());
final viewerSettingsProvider =
    Provider<ViewerSettings>((ref) => throw UnimplementedError());
final viewerStateProvider = StateProvider<ViewerState>(
  (ref) => ViewerState(
    viewMode: ViewMode.themes,
    themeMode: ThemeMode.dark,
    displayMode: DisplayMode.widgetOnly,
    targetDeviceId: Devices.ios.iPhone12.identifier.toString(),
    targetDeviceIds: [],
    targetLocaleId: '',
    targetLocaleIds: [],
    targetThemeId: '',
    targetThemeIds: [],
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
        dataBuilderRegistryProvider.overrideWithValue(
          DataBuilderRegistry(
            allBuilders: {
              String: [
                () => DataTemplateStringLoremBuilder(),
                () => DataTemplateStringRawBuilder(),
              ],
            },
          ),
        )
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
        BotToast.showLoading();
        final cache = await ViewerState.getFromStorage();
        viewerStateNotifier.state = cache ??
            ViewerState(
              viewMode: ViewMode.canvas,
              displayMode: DisplayMode.widgetOnly,
              themeMode: ThemeMode.dark,
              targetDeviceId: Devices.ios.iPhone12.identifier.toString(),
              targetDeviceIds: [
                Devices.ios.iPhone12.identifier.toString(),
                Devices.android.samsungGalaxyS20.identifier.toString(),
              ],
              targetLocaleId: viewerSettings.enabledLocales.keys.first,
              targetLocaleIds: viewerSettings.enabledLocales.keys.toList(),
              targetThemeId: viewerSettings.enabledThemes.keys.first,
              targetThemeIds: viewerSettings.enabledThemes.keys.toList(),
            );
        if (cache?.uri != null && WidgetKeys.navKey.currentContext != null) {
          // Restore cached URI
          VRouter.of(WidgetKeys.navKey.currentContext!).to(cache!.uri!);
        }
      } finally {
        BotToast.closeAllLoading();
      }
    }, []);
    // Persists viewer state to cache upon changes
    ref.listen<ViewerState>(viewerStateProvider, (previous, next) async {
      if (previous != next) {
        unawaited(next.saveToStorage());
      }
    });
    return VRouter(
      debugShowCheckedModeBanner: false,
      navigatorKey: WidgetKeys.navKey,
      theme: defaultLightTheme,
      darkTheme: defaultDarkTheme,
      themeMode: viewerState.themeMode,
      builder: BotToastInit(),
      navigatorObservers: [
        BotToastNavigatorObserver(),
        TrackedNavigatorObserver(viewerStateNotifier: viewerStateNotifier),
      ],
      initialUrl:
          pageGroups.first.children.map((e) => e.firstDocumentUri).first,
      buildTransition: (animation1, _, child) => FadeTransition(
        opacity: animation1,
        child: child,
      ),
      transitionDuration: const Duration(milliseconds: 100),
      routes: [
        VNester(
          path: '/',
          widgetBuilder: (child) => Shortcuts(
            shortcuts: const <SingleActivator, Intent>{
              SingleActivator(LogicalKeyboardKey.keyK, meta: true):
                  SearchIntent()
            },
            child: Actions(
              actions: <Type, Action<Intent>>{
                SearchIntent: SearchAction(),
              },
              child: RootScaffold(
                child: child,
              ),
            ),
          ),
          nestedRoutes: pageGroups.fold(
            [],
            (previousValue, element) => [
              ...previousValue,
              ..._buildRoutes(element.children),
            ],
          ),
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
