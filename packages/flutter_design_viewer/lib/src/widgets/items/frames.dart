import 'dart:async';
import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:clipboard/clipboard.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:flutter_design_viewer/src/measures.dart';
import 'package:flutter_design_viewer/src/widgets/items/buttons.dart';
import 'package:flutter_design_viewer/src/widgets/screens/page_screen.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:flutter_highlight/themes/atom-one-light.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';

import '../../utils.dart';
import 'controls.dart';
import 'images.dart';
import 'splitter.dart';

class ComponentFramePanel extends HookConsumerWidget {
  const ComponentFramePanel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const widgetDisplayHeight = 600.0; //TODO: configurable?
    final viewerState = ref.watch(viewerStateProvider);
    final selectedViewMode = useState(viewerState.viewMode);
    final selectedDisplayMode = useState(viewerState.displayMode);
    final targetDeviceId = useState(viewerState.targetDeviceId);
    final targetDeviceIds = useState(viewerState.targetDeviceIds);
    final targetLocaleId = useState(viewerState.targetLocaleId);
    final targetThemeId = useState(viewerState.targetThemeId);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ComponentFrameToolbar(
          viewModeNotifier: selectedViewMode,
          displayModeNotifier: selectedDisplayMode,
          targetDeviceIdNotifier: targetDeviceId,
          targetDeviceIdsNotifier: targetDeviceIds,
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
                  displayMode: selectedDisplayMode.value,
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
          child: Consumer(
            builder: (context, ref, widget) {
              final theme = Theme.of(context);
              final localViewerState = ref.watch(viewerStateProvider);
              if (localViewerState.displayMode == DisplayMode.widgetOnly) {
                return const SizedBox(
                    height: widgetDisplayHeight,
                    child: ComponentFrameWidgetDisplay());
              } else if (localViewerState.displayMode == DisplayMode.codeOnly) {
                return const CompontentFrameCodeDisplay();
              }
              return SizedBox(
                height: widgetDisplayHeight,
                child: Split(
                  axis: Axis.horizontal,
                  initialFractions: const [0.5, 0.5],
                  splitters: [
                    SizedBox(
                      width: 6,
                      child: MouseRegion(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: theme.dividerColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                  children: const [
                    ComponentFrameWidgetDisplay(),
                    CompontentFrameCodeDisplay(),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CompontentFrameCodeDisplay extends HookConsumerWidget {
  const CompontentFrameCodeDisplay({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sourceCode = ref.watch(sourceCodeProvider);
    final theme = Theme.of(context).brightness == Brightness.light
        ? atomOneLightTheme
        : atomOneDarkTheme;
    final backgroundColor = theme['root']!.backgroundColor;
    return Container(
      color: backgroundColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GlyphButton(
              glyph: const ViewerGlyphUnion.icon(
                icon: Ionicons.copy_outline,
                size: 20,
              ),
              padding: SpacingDesign.paddingAll10,
              onTap: () {
                FlutterClipboard.copy(sourceCode.code)
                    .then((value) => BotToast.showText(text: 'Copied!'));
              },
            ),
          ),
          HighlightView(
            sourceCode.code,
            language: 'dart',
            theme: {
              ...theme,
              'root': TextStyle(
                color: theme['root']!.color,
                backgroundColor: Colors.transparent,
              ),
            },
            padding: const EdgeInsets.all(12),
            textStyle: const TextStyle(
              fontFamily: 'My awesome monospace font',
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class ComponentFrameWidgetDisplay extends HookConsumerWidget {
  const ComponentFrameWidgetDisplay({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localViewerState = ref.watch(viewerStateProvider);
    return buildIf(
          {
            () => localViewerState.viewMode == ViewMode.locales: () =>
                const LocalesDevicesFrameContainer(),
            () => localViewerState.viewMode == ViewMode.devices: () =>
                const DevicesFrameContainer(),
            () => localViewerState.viewMode == ViewMode.themes: () =>
                const ThemeDevicesFrameContainer(),
          },
        ) ??
        const CanvasFrameContainer();
  }
}

class ComponentFrameToolbar extends HookConsumerWidget {
  final ValueNotifier<ViewMode> viewModeNotifier;
  final ValueNotifier<DisplayMode> displayModeNotifier;
  final ValueNotifier<String> targetDeviceIdNotifier;
  final ValueNotifier<List<String>> targetDeviceIdsNotifier;
  final ValueNotifier<String> targetThemeIdNotifier;
  final ValueNotifier<String> targetLocaleIdNotifier;
  const ComponentFrameToolbar({
    required this.viewModeNotifier,
    required this.displayModeNotifier,
    required this.targetDeviceIdNotifier,
    required this.targetDeviceIdsNotifier,
    required this.targetThemeIdNotifier,
    required this.targetLocaleIdNotifier,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          runAlignment: WrapAlignment.start,
          direction: Axis.horizontal,
          runSpacing: 10,
          spacing: 10,
          children: [
            SelectableViewModeGroup(
              value: viewModeNotifier.value,
              valueChanged: (v) => viewModeNotifier.value = v,
            ),
            if (viewModeNotifier.value != ViewMode.themes)
              SelectableThemeGroup(
                value: targetThemeIdNotifier.value,
                valueChanged: (v) => targetThemeIdNotifier.value = v,
              ),
            SelectableDisplayModeGroup(
              value: displayModeNotifier.value,
              valueChanged: (v) => displayModeNotifier.value = v,
            ),
          ],
        ),
        Spacers.v20,
        if (viewModeNotifier.value == ViewMode.devices)
          SelectableDevicesGroup(
            value: targetDeviceIdsNotifier.value,
            valueChanged: (v) => targetDeviceIdsNotifier.value = v,
          )
        else if (viewModeNotifier.value != ViewMode.canvas)
          SelectableDeviceGroup(
            value: targetDeviceIdNotifier.value,
            valueChanged: (v) => targetDeviceIdNotifier.value = v,
          ),
      ],
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
    return Scrollbar(
      controller: scrollController,
      isAlwaysShown: true,
      child: ListView(
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
      ),
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
    final scrollController = useScrollController();
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

final sourceCodeProvider =
    Provider<ViewerSourceCode>((ref) => throw UnimplementedError());

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
