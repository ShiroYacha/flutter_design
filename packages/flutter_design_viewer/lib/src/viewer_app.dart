import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:collection/collection.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrouter/vrouter.dart';

import '../flutter_design_viewer.dart';
import 'commands.dart';
import 'data_builders/factory.dart';
import 'default_data_builders.dart';
import 'navigator_observer.dart';
import 'theme.dart';
import 'utils.dart';
import 'widget_keys.dart';
import 'widgets/items/brandings.dart';
import 'widgets/scaffolds/root_scaffold.dart';
import 'widgets/screens/error_screens.dart';
import 'widgets/screens/page_screen.dart';

final pageGroupsProvider = Provider<List<ViewerGroupPage>>((ref) => []);
final brandingProvider = Provider<Widget>((ref) => throw UnimplementedError());
final viewerSettingsProvider =
    Provider<ViewerSettings>((ref) => throw UnimplementedError());
final viewerStateProvider = StateProvider<ViewerState>(
  (ref) => ViewerState(
    viewMode: ViewMode.themes,
    displayMode: DisplayMode.widgetCodeSideBySide,
    themeMode: ThemeMode.dark,
    showDataBuilderByDefault: true,
    expandExplorerNodesByDefault: true,
    targetDeviceId: Devices.ios.iPhone12.identifier.toString(),
    targetDeviceIds: [],
    targetLocaleId: '',
    targetLocaleIds: [],
    targetThemeId: '',
    targetThemeIds: [],
  ),
);
final designerBuilderProvider =
    Provider<DesignerBuilder>((ref) => throw UnimplementedError());

const routePathNameSeparator = '||';

typedef DesignerBuilder = Widget Function(BuildContext, DesignTheme, Widget);

class DesignSystemViewerApp extends HookConsumerWidget {
  final String? initialRoute;
  final Widget? branding;
  final ViewerSettings settings;
  final ViewerState? initialState;
  final List<ViewerGroupPage> pageGroups;
  final Map<Type, List<DataBuilderCreator>> dataBuilders;
  final DesignerBuilder? designerBuilder;

  const DesignSystemViewerApp({
    required this.pageGroups,
    required this.settings,
    this.dataBuilders = const {},
    this.initialRoute,
    this.designerBuilder,
    this.branding,
    this.initialState,
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
            allBuilders: _mergeDataBuilders(dataBuilders),
          ),
        ),
        designerBuilderProvider.overrideWithValue(
          designerBuilder ?? (ctx, theme, child) => child,
        ),
      ],
      child: DesignSystemViewerRouter(
        initialRoute: initialRoute,
        initialState: initialState,
      ),
    );
  }

  Map<Type, List<DataBuilderCreator>> _mergeDataBuilders(
      Map<Type, List<DataBuilderCreator>> dataBuilders) {
    return mergeMaps(defaultBuilders, dataBuilders, value: (e1, e2) {
      // The user provided data builders will have priority
      return [
        ...e2,
        ...e1,
      ];
    });
  }
}

class DesignSystemViewerRouter extends HookConsumerWidget {
  final String? initialRoute;
  final ViewerState? initialState;
  const DesignSystemViewerRouter({
    this.initialRoute,
    this.initialState,
    Key? key,
  }) : super(key: key);
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
        viewerStateNotifier.state = cache?.isValid == true
            ? cache!
            : (initialState ?? ViewerState.createDefault(viewerSettings));
        // Restore cached URI if possible (not doing it in Web because the user can open
        // multiple tabs).
        if (!kIsWeb &&
            cache?.uri != null &&
            WidgetKeys.navKey.currentContext != null) {
          VRouter.of(WidgetKeys.navKey.currentContext!).to(cache!.uri!);
        }
      } finally {
        BotToast.closeAllLoading();
      }
      return null;
    }, []);
    // Persists viewer state to cache upon changes
    ref.listen<ViewerState>(viewerStateProvider, (previous, next) async {
      if (previous != next) {
        unawaited(next.saveToStorage());
      }
    });
    return VRouter(
      mode: VRouterMode.history,
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
      initialUrl: pageGroups.isEmpty
          ? '/404'
          : (initialRoute ??
              pageGroups.first.children.map((e) => e.firstDocumentUri).first),
      onGenerateTitle: (context) {
        return WidgetKeys.navKey.currentContext != null
            ? VRouter.of(WidgetKeys.navKey.currentContext!)
                .names
                .first
                .split(routePathNameSeparator)
                .last
            : '';
      },
      buildTransition: (animation1, _, child) => FadeTransition(
        opacity: animation1,
        child: child,
      ),
      transitionDuration: const Duration(milliseconds: 0),
      routes: [
        VWidget(
            path: '/404', name: 'Error 404', widget: const Error404Screen()),
        VNester(
          path: '/',
          name: '',
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

              /// Currently both ID and name is needed
              /// - id: to observe and save current path
              /// - name: to show as tab name
              name: '${e.uri}$routePathNameSeparator${e.title}',
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
