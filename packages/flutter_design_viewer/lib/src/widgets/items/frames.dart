import 'dart:async';
import 'dart:math';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:flutter_design_viewer/src/measures.dart';
import 'package:flutter_design_viewer/src/widgets/screens/page_screen.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';

import '../../utils.dart';
import 'buttons.dart';
import 'images.dart';

class ComponentFramePanel extends HookConsumerWidget {
  const ComponentFramePanel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewerState = ref.watch(viewerStateProvider);
    final selectedViewMode = useState(viewerState.viewMode);
    final targetDeviceId = useState(viewerState.targetDeviceId);
    final targetLocaleId = useState(viewerState.targetLocaleId);
    final targetThemeId = useState(viewerState.targetThemeId);
    return Column(
      children: [
        ComponentFrameToolbar(
          viewModeNotifier: selectedViewMode,
          targetDeviceIdNotifier: targetDeviceId,
          targetLocaleIdNotifier: targetLocaleId,
          targetThemeIdNotifier: targetThemeId,
        ),
        Spacers.v20,
        ProviderScope(
          overrides: [
            viewerStateProvider.overrideWithValue(
              StateController(
                viewerState.copyWith(
                  viewMode: selectedViewMode.value,
                  targetDeviceId: targetDeviceId.value,
                  targetLocaleId: targetLocaleId.value.isNotEmpty
                      ? targetLocaleId.value
                      : viewerState.targetLocaleId,
                  targetThemeId: targetThemeId.value.isNotEmpty
                      ? targetThemeId.value
                      : viewerState.targetThemeId,
                ),
              ),
            )
          ],
          child: Consumer(builder: (context, ref, _) {
            final localViewerState = ref.watch(viewerStateProvider);
            return buildIf(
                  {
                    () => localViewerState.viewMode == ViewMode.locales: () =>
                        const SizedBox(
                          child: LocalesDevicesFrameContainer(),
                          height: 800,
                        ),
                    () => localViewerState.viewMode == ViewMode.devices: () =>
                        const SizedBox(
                          child: DevicesFrameContainer(),
                          height: 800,
                        ),
                    () => localViewerState.viewMode == ViewMode.themes: () =>
                        const SizedBox(
                          child: ThemeDevicesFrameContainer(),
                          height: 800,
                        ),
                  },
                ) ??
                const SizedBox(
                  child: CanvasFrameContainer(),
                  height: 500,
                );
          }),
        ),
      ],
    );
  }
}

class ComponentFrameToolbar extends HookConsumerWidget {
  final ValueNotifier<ViewMode> viewModeNotifier;
  final ValueNotifier<String> targetDeviceIdNotifier;
  final ValueNotifier<String> targetThemeIdNotifier;
  final ValueNotifier<String> targetLocaleIdNotifier;
  const ComponentFrameToolbar({
    required this.viewModeNotifier,
    required this.targetDeviceIdNotifier,
    required this.targetThemeIdNotifier,
    required this.targetLocaleIdNotifier,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        SelectableViewModeGroup(
          value: viewModeNotifier.value,
          valueChanged: (v) => viewModeNotifier.value = v,
        ),
        Spacers.h40,
        if (viewModeNotifier.value != ViewMode.themes)
          SelectableThemeGroup(
            value: targetThemeIdNotifier.value,
            valueChanged: (v) => targetThemeIdNotifier.value = v,
          ),
      ],
    );
  }
}

class SelectableThemeGroup extends HookConsumerWidget {
  final String value;
  final void Function(String) valueChanged;
  const SelectableThemeGroup({
    required this.value,
    required this.valueChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final viewerSettings = ref.watch(viewerSettingsProvider);
    return SelectableGlyphGroup<String>(
      items: viewerSettings.enabledThemes.keys,
      selectedItem: value,
      selectionChanged: (e) => valueChanged(e),
      builder: (context, e, [selected]) {
        final color = selected ? theme.primaryColor : null;
        return CircleAvatar(
          backgroundColor: color,
          radius: 10,
          child: CircleAvatar(
            backgroundColor:
                viewerSettings.enabledThemes[e]?.scaffoldBackgroundColor,
            radius: 8,
          ),
        );
      },
    );
  }
}

class SelectableViewModeGroup extends StatelessWidget {
  final ViewMode value;
  final void Function(ViewMode) valueChanged;
  const SelectableViewModeGroup({
    Key? key,
    required this.value,
    required this.valueChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SelectableGlyphGroup<ViewMode>(
      items: ViewMode.values,
      selectedItem: value,
      selectionChanged: (e) => valueChanged(e),
      builder: (context, e, [selected]) {
        final color = selected ? theme.primaryColor : null;
        return ThemableGlyph(
          glyph: {
                ViewMode.canvas: ViewerGlyphUnion.icon(
                  icon: Ionicons.easel_outline,
                  color: color,
                ),
                ViewMode.devices: ViewerGlyphUnion.icon(
                  icon: Ionicons.phone_portrait_outline,
                  color: color,
                ),
                ViewMode.themes: ViewerGlyphUnion.icon(
                  icon: Ionicons.partly_sunny_outline,
                  color: color,
                ),
                ViewMode.locales: ViewerGlyphUnion.icon(
                  icon: Ionicons.language,
                  color: color,
                ),
              }[e] ??
              ViewerGlyphUnion.icon(
                icon: FeatherIcons.alertCircle,
                color: color,
              ),
        );
      },
    );
  }
}

class PointerSyncEvent {
  final String id;
  final PointerEvent event;
  PointerSyncEvent({
    required this.id,
    required this.event,
  });
}

final pointerEventBusProvider = Provider<StreamController<PointerSyncEvent>>(
  (ref) => StreamController.broadcast(),
);

class CanvasFrameContainer extends HookWidget {
  const CanvasFrameContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ContentApp();
  }
}

DeviceInfo _locateDeviceById(String id) =>
    Devices.all.firstWhere((e) => e.identifier.toString() == id);

Widget wrapInDeviceFrameTheme(Widget child) {
  return DeviceFrameTheme(
    style: DeviceFrameStyle(
      keyboardStyle: DeviceKeyboardStyle.dark().copyWith(
        backgroundColor: Colors.black,
      ),
    ),
    child: child,
  );
}

class DevicesFrameContainer extends HookConsumerWidget {
  const DevicesFrameContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewerState = ref.watch(viewerStateProvider);
    final scrollController = useScrollController();
    return ListView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      children: viewerState.targetDeviceIds
          .map(
            (id) => Padding(
              padding: const EdgeInsets.only(right: 10),
              child: wrapInDeviceFrameTheme(
                DeviceFrame(
                  device: _locateDeviceById(id),
                  isFrameVisible: true,
                  screen: ContentApp(key: UniqueKey()),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class ThemeDevicesFrameContainer extends HookConsumerWidget {
  const ThemeDevicesFrameContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewerSettings = ref.watch(viewerSettingsProvider);
    final viewerState = ref.watch(viewerStateProvider);
    final scrollController = useScrollController();
    return ListView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      children: viewerState.targetThemeIds.map(
        (id) {
          final theme = viewerSettings.enabledThemes[id];
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: wrapInDeviceFrameTheme(
              DeviceFrame(
                device: _locateDeviceById(viewerState.targetDeviceId),
                isFrameVisible: true,
                screen: ContentApp(
                  key: Key('themed_$id'),
                  themeDataOverride: theme,
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}

class LocalesDevicesFrameContainer extends HookConsumerWidget {
  const LocalesDevicesFrameContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewerSettings = ref.watch(viewerSettingsProvider);
    final viewerState = ref.watch(viewerStateProvider);
    final scrollController = useScrollController();
    return ListView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      children: viewerState.targetLocaleIds.map(
        (id) {
          final locale = viewerSettings.enabledLocales[id];
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: wrapInDeviceFrameTheme(
              DeviceFrame(
                device: _locateDeviceById(viewerState.targetDeviceId),
                isFrameVisible: true,
                screen: ContentApp(
                  key: Key('locales_${locale?.toLanguageTag()}'),
                  localeOverride: locale,
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}

class ScrollableFrame extends HookWidget {
  final Widget child;
  const ScrollableFrame({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController =
        useScrollController(); //useLinkedScrollController();
    return SingleChildScrollView(
      controller: scrollController,
      child: child,
    );
  }
}

final keyboardVisibleProvider = StateProvider((ref) => false);

final seededRandomProvider =
    Provider<Random>((ref) => throw UnimplementedError());

final randomSeedProvider = StateProvider<int>((ref) => 0);

final widgetBuilderProvider =
    Provider<WidgetBuilder>((ref) => throw UnimplementedError());

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class ContentApp extends HookConsumerWidget {
  final ThemeData? themeDataOverride;
  final Locale? localeOverride;
  const ContentApp({
    Key? key,
    this.themeDataOverride,
    this.localeOverride,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewerSettings = ref.watch(viewerSettingsProvider);
    final viewerState = ref.watch(viewerStateProvider);
    final currentPage = ref.watch(currentPageProvider);
    // final localNavigatorKeys = ref.watch(localNavigatorKeysProvider);
    final locale = localeOverride ??
        viewerSettings.enabledLocales[viewerState.targetLocaleId]!;
    final theme = themeDataOverride ??
        viewerSettings.enabledThemes[viewerState.targetThemeId];
    final randomSeed = ref.watch(randomSeedProvider);
    final keyboardVisible = ref.watch(keyboardVisibleProvider);
    final widgetBuilder = ref.watch(widgetBuilderProvider);
    // final navigatorKey = useMemoized(() => GlobalKey<NavigatorState>(), [key]);
    // useAsyncEffect(() async {
    //   localNavigatorKeys.state[key] = navigatorKey;
    // }, [key]);
    return VirtualKeyboard(
      isEnabled: keyboardVisible,
      transitionDuration: const Duration(milliseconds: 100),
      child: FocusScope(
        child: MaterialApp(
          scrollBehavior: MyCustomScrollBehavior(),
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          locale: locale,
          theme: theme,
          onGenerateTitle: (BuildContext context) {
            return currentPage.title;
          },
          // navigatorKey: navigatorKey,
          home: Builder(
            builder: (context) {
              return Container(
                child: widgetBuilder(context),
              );
            },
          ),
          builder: (ctx, widget) {
            return ProviderScope(
              overrides: [
                seededRandomProvider.overrideWithValue(Random(randomSeed)),
              ],
              child: Stack(
                children: [
                  const PatternedBackground(),
                  [
                    ViewMode.themes,
                    ViewMode.locales,
                    ViewMode.devices,
                  ].contains(viewerState.viewMode)
                      ? DeviceEventSyncContainer(
                          key: Key(key.toString()),
                          child: widget!,
                        )
                      : widget!,
                  Positioned(
                    left: MediaQuery.of(ctx).viewPadding.left + 10,
                    top: MediaQuery.of(ctx).viewInsets.top,
                    child: Padding(
                      padding: viewerState.viewMode == ViewMode.canvas
                          ? EdgeInsets.zero
                          : const EdgeInsets.all(8.0),
                      child: LocaleTag(
                        name: locale.toLanguageTag(),
                        locale: locale,
                        textStyle: Theme.of(ctx)
                            .textTheme
                            .caption!
                            .copyWith(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Provide pointer event synchronization between devices. Currently only working
/// with at most 2 devices.
class DeviceEventSyncContainer extends HookConsumerWidget {
  final Widget child;
  const DeviceEventSyncContainer({
    required Key key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pointerEventBus = ref.watch(pointerEventBusProvider);
    final listenerKey = useMemoized(() => GlobalKey(), []);
    final deviceOffset = useState(Offset.zero);
    useEffect(() {
      // subscribe to pointer events
      final subscription = pointerEventBus.stream.listen((syncEvent) {
        if (syncEvent.id != key.toString()) {
          final position = syncEvent.event.position
              .translate(deviceOffset.value.dx, deviceOffset.value.dy);
          // print(
          //     '$key received sync event = ${syncEvent.event.buttons}, pos = $position');
          Future.delayed(const Duration(milliseconds: 10), () {
            _simulatePointerEventOnPosition(
              position: position,
              event: syncEvent.event,
            );
          });
        }
      });
      // compute the local device frame offset position
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        final box = listenerKey.currentContext?.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero);
        deviceOffset.value = Offset(
          position.dx,
          position.dy,
        );
      });

      return subscription.cancel;
    }, []);

    return Listener(
      key: listenerKey,
      onPointerDown: (e) => _handlePointerEvent(
        e,
        bus: pointerEventBus,
        deviceOffset: deviceOffset.value,
      ),
      onPointerMove: (e) => _handlePointerEvent(
        e,
        bus: pointerEventBus,
        deviceOffset: deviceOffset.value,
      ),
      onPointerUp: (e) => _handlePointerEvent(
        e,
        bus: pointerEventBus,
        deviceOffset: deviceOffset.value,
      ),
      onPointerSignal: (e) => _handlePointerEvent(
        e,
        bus: pointerEventBus,
        deviceOffset: deviceOffset.value,
      ),
      child: child,
    );
  }

  void _handlePointerEvent(
    PointerEvent event, {
    required StreamController<PointerSyncEvent> bus,
    required Offset deviceOffset,
  }) {
    if (event.embedderId != -1) {
      final position = event.position
          // remove position device offset
          .translate(-deviceOffset.dx, -deviceOffset.dy);
      // print('$key handled event of type ${event.buttons}, pos = $position');
      bus.add(
        PointerSyncEvent(
          id: key.toString(),
          event: event.copyWith(
            position: position,
          ),
        ),
      );
    }
  }

  void _simulatePointerEventOnPosition({
    required Offset position,
    required PointerEvent event,
  }) {
    // To avoid getting the same pointer
    final e = event.copyWith(
      pointer: key.hashCode,
      embedderId: -1,
      position: position,
    );
    // print('$key simulated ${e.original}');
    // GestureBinding.instance!.handlePointerEvent(e);
    final result = HitTestResult();
    WidgetsBinding.instance!.hitTest(result, position);
    for (var element in result.path) {
      try {
        element.target.handleEvent(
          e,
          element,
        );
      } on Exception catch (e) {
        // TODO
        // ignore: avoid_print
        print(e);
      }
    }
  }
}
