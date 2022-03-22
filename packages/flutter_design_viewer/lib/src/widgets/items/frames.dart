import 'dart:async';
import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:clipboard/clipboard.dart';
import 'package:device_preview/device_preview.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_design/flutter_design.dart';
import 'package:flutter_design_viewer/flutter_design_viewer.dart';
import 'package:flutter_design_viewer/src/data_builders/builders.dart';
import 'package:flutter_design_viewer/src/data_builders/factory.dart';
import 'package:flutter_design_viewer/src/measures.dart';
import 'package:flutter_design_viewer/src/widgets/dialogs/widget_dialog.dart';
import 'package:flutter_design_viewer/src/widgets/items/buttons.dart';
import 'package:flutter_design_viewer/src/widgets/screens/page_screen.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:flutter_highlight/themes/atom-one-light.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils.dart';
import 'controls.dart';
import 'images.dart';
import 'splitter.dart';

final showDataBuilderProvider =
    Provider<bool>((ref) => throw UnimplementedError());

class ComponentFramePanel extends HookConsumerWidget {
  final double widgetDisplayHeight;
  const ComponentFramePanel({
    required this.widgetDisplayHeight,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewerState = ref.watch(viewerStateProvider);
    final viewerWidgetBuilder =
        ref.watch(viewerComponentSectionProvider.select((v) => v.builder));
    final dataBuilderRegistry = ref.watch(dataBuilderRegistryProvider);
    final selectedViewMode = useState(viewerState.viewMode);
    final selectedDisplayMode = useState(viewerState.displayMode);
    final targetDeviceId = useState(viewerState.targetDeviceId);
    final targetDeviceIds = useState(viewerState.targetDeviceIds);
    final targetLocaleId = useState(viewerState.targetLocaleId);
    final targetThemeId = useState(viewerState.targetThemeId);
    // Assemble data builders
    final showDataBuilder = useState(viewerState.showDataBuilderByDefault);
    final dataBuilderOptions = useMemoized(
        () => dataBuilderRegistry.getAllOptionsFor(
              {for (var k in viewerWidgetBuilder.fieldMetaDataset) k.name: k},
            ),
        [viewerWidgetBuilder]);
    final dataBuilders = useState({
      for (var k in viewerWidgetBuilder.fieldMetaDataset.where((e) =>
          dataBuilderOptions.containsKey(e.name) &&
          dataBuilderOptions[e.name]!.isNotEmpty))
        k.name: dataBuilderOptions[k.name]!.firstWhere((o) =>
            k.viewerInitSelectorParam == null ||
            o.hasParameterType(k.viewerInitSelectorParam))
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ComponentFrameToolbar(
          key: const ValueKey('ComponentFrameToolbar'),
          viewModeNotifier: selectedViewMode,
          displayModeNotifier: selectedDisplayMode,
          targetDeviceIdNotifier: targetDeviceId,
          targetDeviceIdsNotifier: targetDeviceIds,
          targetLocaleIdNotifier: targetLocaleId,
          targetThemeIdNotifier: targetThemeId,
          showDataBuilderNotifier: showDataBuilder,
        ),
        Spacers.v10,
        ProviderScope(
          overrides: [
            viewerStateProvider.overrideWithValue(
              StateController(
                viewerState.copyWith(
                  viewMode: selectedViewMode.value,
                  displayMode: selectedDisplayMode.value,
                  targetDeviceId: targetDeviceId.value,
                  targetDeviceIds: targetDeviceIds.value,
                  targetLocaleId: targetLocaleId.value.isNotEmpty
                      ? targetLocaleId.value
                      : viewerState.targetLocaleId,
                  targetThemeId: targetThemeId.value.isNotEmpty
                      ? targetThemeId.value
                      : viewerState.targetThemeId,
                ),
              ),
            ),
            showDataBuilderProvider.overrideWithValue(showDataBuilder.value),
            dataBuildersProvider.overrideWithValue(dataBuilders.value),
            dataBuilderOptionsProvider.overrideWithValue(dataBuilderOptions),
          ],
          child: Consumer(
            builder: (context, ref, widget) {
              final localViewerState = ref.watch(viewerStateProvider);
              final showDataBuilder = ref.watch(showDataBuilderProvider);
              if (localViewerState.displayMode == DisplayMode.codeOnly) {
                return const CompontentFrameCodeDisplay(expand: false);
              }
              final sideBySide = showDataBuilder ||
                  localViewerState.displayMode ==
                      DisplayMode.widgetCodeSideBySide;
              return SizedBox(
                height: widgetDisplayHeight,
                child: LayoutBuilder(builder: (context, constraints) {
                  final maxWidth = constraints.maxWidth;
                  const rightPanelWidth = 600;
                  final rightPortion = rightPanelWidth / maxWidth;
                  return NSplitter(
                    // Use a key composed of the current builder instance & side by side
                    // to invalidate the initial fraction if needed
                    key:
                        ValueKey('${viewerWidgetBuilder.hashCode}_$sideBySide'),
                    initialFractions: sideBySide
                        // Display side by side if data builder or code is shown
                        ? rightPortion < 0.5
                            ? [1 - rightPortion, rightPortion]
                            : [0.5, 0.5]
                        // Display widget fully if only showing widget
                        : [1.0, 0.0],
                    items: [
                      const ComponentFrameWidgetDisplay(),
                      if (showDataBuilder)
                        CompontentFrameDataDisplay(
                          dataBuildersNotifier: dataBuilders,
                        )
                      else if (localViewerState.displayMode ==
                          DisplayMode.widgetCodeSideBySide)
                        const CompontentFrameCodeDisplay(expand: true)
                      else
                        Container(),
                    ],
                  );
                }),
              );
            },
          ),
        ),
      ],
    );
  }
}

class NSplitter extends StatelessWidget {
  final List<Widget> items;
  final List<double>? initialFractions;
  final Axis axis;
  const NSplitter({
    required this.items,
    this.axis = Axis.horizontal,
    this.initialFractions,
    Key? key,
  })  : assert(items.length != 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (items.length == 1) {
      return items.first;
    }
    final horizontal = axis == Axis.horizontal;
    return Split(
      axis: axis,
      initialFractions:
          initialFractions ?? items.map((e) => 1.0 / items.length).toList(),
      splitters: items
          .skip(1)
          .map((e) => SizedBox(
                width: horizontal ? 6 : 0,
                height: horizontal ? 0 : 6,
                child: MouseRegion(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: theme.dividerColor,
                    ),
                  ),
                ),
              ))
          .toList(),
      children: items,
    );
  }
}

class CompontentFrameCodeDisplay extends HookConsumerWidget {
  final bool expand;
  const CompontentFrameCodeDisplay({
    this.expand = false,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sourceCode =
        ref.watch(viewerComponentSectionProvider.select((v) => v.sourceCode));
    final theme = Theme.of(context).brightness == Brightness.light
        ? atomOneLightTheme
        : atomOneDarkTheme;
    final backgroundColor = theme['root']!.backgroundColor;
    const padding = SpacingDesign.s10;
    return Container(
      color: backgroundColor,
      child: Stack(
        fit: expand ? StackFit.expand : StackFit.passthrough,
        children: [
          SingleChildScrollView(
            child: Paddings.bottom40(
              child: HighlightView(
                sourceCode.code,
                padding: const EdgeInsets.only(
                    left: padding, top: padding, bottom: padding),
                language: 'dart',
                theme: {
                  ...theme,
                  'root': TextStyle(
                    color: theme['root']!.color,
                    backgroundColor: Colors.transparent,
                  ),
                },
                textStyle: GoogleFonts.robotoMono(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: ThemableIconButton(
              icon: Ionicons.copy_outline,
              size: 20,
              padding: SpacingDesign.paddingAll10,
              onTap: () {
                FlutterClipboard.copy(sourceCode.code)
                    .then((value) => BotToast.showText(text: 'Copied!'));
              },
            ),
          ),
        ],
      ),
    );
  }
}

final dataBuildersProvider =
    Provider<Map<String, DataBuilder>>((ref) => throw UnimplementedError());
final dataBuilderOptionsProvider = Provider<Map<String, List<DataBuilder>>>(
    (ref) => throw UnimplementedError());

class CompontentFrameDataDisplay extends HookConsumerWidget {
  final ValueNotifier<Map<String, DataBuilder>> dataBuildersNotifier;
  const CompontentFrameDataDisplay({
    required this.dataBuildersNotifier,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final viewerWidgetBuilder =
        ref.watch(viewerComponentSectionProvider.select((v) => v.builder));
    return Container(
      padding: SpacingDesign.paddingAll10,
      color: theme.backgroundColor,
      child: viewerWidgetBuilder.fieldMetaDataset.isEmpty
          ? const Center(
              child: Text('No data found'),
            )
          : ListView(
              children: viewerWidgetBuilder.fieldMetaDataset.fold<List<Widget>>(
                  <Widget>[],
                  (pe, v) => [
                        ...pe,
                        SelectableContainer(
                          color: theme.dialogBackgroundColor,
                          child: ExpandablePanel(
                            controller:
                                ExpandableController(initialExpanded: true),
                            theme: ExpandableThemeData(
                              iconPadding: EdgeInsets.zero,
                              iconColor: theme.colorScheme.onBackground,
                              useInkWell: false,
                            ),
                            header: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    const WidgetSpan(
                                      child: ThemableIcon(
                                        icon: Ionicons.cube_outline,
                                      ),
                                    ),
                                    const WidgetSpan(child: Spacers.h6),
                                    TextSpan(
                                        text:
                                            '${v.typeName}${v.isNullable ? '?' : ''}',
                                        style: theme.textTheme.subtitle1
                                            ?.copyWith(
                                                color: theme.primaryColor)),
                                    const WidgetSpan(child: Spacers.h6),
                                    TextSpan(
                                        text: v.name,
                                        style: theme.textTheme.subtitle1)
                                  ],
                                ),
                              ),
                            ),
                            collapsed: const SizedBox.shrink(),
                            expanded: DataBuilderPanel(
                              fieldMetaData: v,
                              dataBuildersNotifier: dataBuildersNotifier,
                            ),
                          ),
                        ),
                        Spacers.v10,
                        if (viewerWidgetBuilder.fieldMetaDataset.last == v)
                          Spacers.v300,
                      ]).toList(),
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
        NSplitter(
          axis: Axis.vertical,
          initialFractions: const [1.0, 0.0],
          items: [
            const CanvasFrameContainer(),
            Container(),
          ],
        );
  }
}

class ComponentFrameToolbar extends HookConsumerWidget {
  final ValueNotifier<ViewMode> viewModeNotifier;
  final ValueNotifier<DisplayMode> displayModeNotifier;
  final ValueNotifier<String> targetDeviceIdNotifier;
  final ValueNotifier<List<String>> targetDeviceIdsNotifier;
  final ValueNotifier<String> targetThemeIdNotifier;
  final ValueNotifier<String> targetLocaleIdNotifier;
  final ValueNotifier<bool> showDataBuilderNotifier;
  const ComponentFrameToolbar({
    required this.viewModeNotifier,
    required this.displayModeNotifier,
    required this.targetDeviceIdNotifier,
    required this.targetDeviceIdsNotifier,
    required this.targetThemeIdNotifier,
    required this.targetLocaleIdNotifier,
    required this.showDataBuilderNotifier,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fullscreenMode = ref.watch(fullscreenModeProvider);
    final designLink = ref.watch(
        viewerComponentSectionProvider.select((value) => value.designLink));

    /// Measure size and notify dialog if in full screen mode
    ///
    /// Remark: it's okay to do this all the time as if the screensize changes,
    /// the widget will need to be run build anyway (e.g. when resizing a window)
    ///
    if (fullscreenMode) {
      final componentFrameToolbarSize =
          ref.watch(componentFrameToolbarSizeProvider);
      final componentFrameToolbarSizeNotifier =
          ref.watch(componentFrameToolbarSizeProvider.notifier);
      WidgetsBinding.instance?.addPostFrameCallback((timestamp) {
        final size =
            (context.findRenderObject() as RenderBox?)?.size ?? Size.zero;
        Future.delayed(const Duration(milliseconds: 500), () {
          if (componentFrameToolbarSize != size) {
            componentFrameToolbarSizeNotifier.update((state) => size);
          }
        });
      });
    }

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
              onValueChanged: (v) => viewModeNotifier.value = v,
            ),
            if (viewModeNotifier.value != ViewMode.themes)
              SelectableThemeGroup(
                value: targetThemeIdNotifier.value,
                onValueChanged: (v) => targetThemeIdNotifier.value = v,
              ),
            if (viewModeNotifier.value != ViewMode.locales)
              SelectableLocaleGroup(
                value: targetLocaleIdNotifier.value,
                onValueChanged: (v) => targetLocaleIdNotifier.value = v,
              ),
            SelectableDisplayModeGroup(
              value: displayModeNotifier.value,
              onValueChanged: (v) => displayModeNotifier.value = v,
            ),
            if (displayModeNotifier.value != DisplayMode.codeOnly)
              ShowDataBuilderToggle(
                value: showDataBuilderNotifier.value,
                onValueChanged: (v) => showDataBuilderNotifier.value = v,
              ),
            if (designLink != null)
              LinkableClickableContainer(
                uri: Uri.tryParse(designLink),
                tooltip: 'Design link',
                onTap: () async {
                  if (await canLaunch(designLink)) {
                    launch(designLink);
                  }
                },
                child: const SelectableContainer(
                  child: ThemableIcon(icon: Ionicons.link),
                ),
              ),
            FullScreenButton(fullscreenMode: fullscreenMode),
          ],
        ),
        if (viewModeNotifier.value == ViewMode.devices) ...[
          Spacers.v10,
          SelectableDevicesGroup(
            value: targetDeviceIdsNotifier.value,
            onValueChanged: (v) => targetDeviceIdsNotifier.value = v,
          ),
        ] else if (viewModeNotifier.value != ViewMode.canvas) ...[
          Spacers.v10,
          SelectableDeviceGroup(
            value: targetDeviceIdNotifier.value,
            onValueChanged: (v) => targetDeviceIdNotifier.value = v,
          ),
        ],
      ],
    );
  }
}

final fullscreenModeProvider = Provider<bool>((ref) => false);

class FullScreenButton extends HookConsumerWidget {
  final bool fullscreenMode;
  const FullScreenButton({
    required this.fullscreenMode,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final viewerComponentSection = ref.watch(viewerComponentSectionProvider);
    final currentPage = ref.watch(currentPageProvider);
    return SelectableContainer(
      child: Tooltip(
        message: 'Fullscreen',
        child: GestureDetector(
          onTap: () {
            if (fullscreenMode) {
              Navigator.of(context).pop();
            } else {
              showDialog(
                context: context,
                builder: (context) => ProviderScope(
                  overrides: [
                    fullscreenModeProvider.overrideWithValue(true),
                    currentPageProvider.overrideWithValue(currentPage),
                    viewerComponentSectionProvider
                        .overrideWithValue(viewerComponentSection)
                  ],
                  child: const WidgetDialog(),
                ),
              );
            }
          },
          child: ThemableIcon(
            icon: fullscreenMode
                ? Ionicons.contract_outline
                : Ionicons.expand_outline,
            color: theme.colorScheme.onBackground,
          ),
        ).asMouseClickRegion,
      ),
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
    return PubSubConnectedData(child: const ContentApp());
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
    final targetDeviceIds =
        ref.watch(viewerStateProvider.select((value) => value.targetDeviceIds));
    final scrollController = useScrollController();
    return Scrollbar(
      controller: scrollController,
      isAlwaysShown: true,
      child: ListView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        children: targetDeviceIds
            .map(
              (id) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: wrapInDeviceFrameTheme(
                  DeviceFrame(
                    device: _locateDeviceById(id),
                    isFrameVisible: true,
                    screen: PubSubConnectedData(
                      child: ContentApp(key: ValueKey('ContentApp_$id')),
                    ),
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
    final targetThemeIds =
        ref.watch(viewerStateProvider.select((e) => e.targetThemeIds));
    final targetDeviceId =
        ref.watch(viewerStateProvider.select((e) => e.targetDeviceId));
    final scrollController = useScrollController();
    return ListView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      children: targetThemeIds.map(
        (id) {
          final theme = viewerSettings.enabledThemes[id];
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: wrapInDeviceFrameTheme(
              DeviceFrame(
                device: _locateDeviceById(targetDeviceId),
                isFrameVisible: true,
                screen: PubSubConnectedData(
                  child: ContentApp(
                    key: Key('ContentApp_$id'),
                    themeOverride: theme,
                  ),
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
    final targetLocaleIds =
        ref.watch(viewerStateProvider.select((e) => e.targetLocaleIds));
    final targetDeviceId =
        ref.watch(viewerStateProvider.select((e) => e.targetDeviceId));
    final scrollController = useScrollController();
    return ListView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      children: targetLocaleIds.map(
        (id) {
          final locale = viewerSettings.enabledLocales[id];
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: wrapInDeviceFrameTheme(
              DeviceFrame(
                device: _locateDeviceById(targetDeviceId),
                isFrameVisible: true,
                screen: PubSubConnectedData(
                  child: ContentApp(
                    key: ValueKey('ContentApp_${locale?.toLanguageTag()}'),
                    localeOverride: locale,
                  ),
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

final viewerComponentSectionProvider =
    Provider<ViewerComponentSection>((ref) => throw UnimplementedError());

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class EmbeddedAppRouteInformationParser extends RouteInformationParser<Object> {
  @override
  Future<Object> parseRouteInformation(
      RouteInformation routeInformation) async {
    return 0;
  }
}

class EmbeddedAppRouterDelegate extends RouterDelegate<Object>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<Object> {
  @override
  Widget build(BuildContext context) {
    return HookConsumer(builder: (context, ref, widget) {
      final viewerWidgetBuilder =
          ref.watch(viewerComponentSectionProvider.select((v) => v.builder));
      final dataBuilders = ref.watch(dataBuildersProvider);
      return Material(
        color: Colors.transparent,
        child: Center(
          child: viewerWidgetBuilder.build(
            context,
            ManagedDataBuilderFactory(builders: dataBuilders),
          ),
        ),
      );
    });
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(Object configuration) async {}
}

class ContentApp extends HookConsumerWidget {
  final DesignTheme? themeOverride;
  final Locale? localeOverride;
  const ContentApp({
    Key? key,
    this.themeOverride,
    this.localeOverride,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewerSettings = ref.watch(viewerSettingsProvider);
    final viewerState = ref.watch(viewerStateProvider);
    final currentPage = ref.watch(currentPageProvider);
    final designerBuilder = ref.watch(designerBuilderProvider);
    // final localNavigatorKeys = ref.watch(localNavigatorKeysProvider);
    final locale = localeOverride ??
        viewerSettings.enabledLocales[viewerState.targetLocaleId]!;
    final theme = themeOverride ??
        viewerSettings.enabledThemes[viewerState.targetThemeId]!;
    final randomSeed = ref.watch(randomSeedProvider);
    final keyboardVisible = ref.watch(keyboardVisibleProvider);
    // final navigatorKey = useMemoized(() => GlobalKey<NavigatorState>(), [key]);
    // useAsyncEffect(() async {
    //   localNavigatorKeys.state[key] = navigatorKey;
    // }, [key]);
    return VirtualKeyboard(
      isEnabled: keyboardVisible,
      transitionDuration: const Duration(milliseconds: 100),
      child: FocusScope(
        child: MaterialApp.router(
          routeInformationParser: EmbeddedAppRouteInformationParser(),
          routerDelegate: EmbeddedAppRouterDelegate(),
          scrollBehavior: MyCustomScrollBehavior(),
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          locale: locale,
          theme: theme.materialTheme,
          onGenerateTitle: (BuildContext context) {
            return currentPage.title;
          },
          // navigatorKey: navigatorKey,
          builder: (ctx, widget) {
            return ProviderScope(
              overrides: [
                seededRandomProvider.overrideWithValue(Random(randomSeed)),
              ],
              child: designerBuilder(
                ctx,
                theme,
                Stack(
                  children: [
                    const PatternedBackground(foregroundOpacity: 0.1),
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
                        child: LocaleBadge(
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
        // ignore: avoid_print
        print(e);
      }
    }
  }
}
