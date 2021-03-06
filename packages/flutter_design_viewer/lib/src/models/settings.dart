// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_viewer/src/design_theme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionicons/ionicons.dart';
import 'package:localstorage/localstorage.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

enum ViewMode {
  canvas,
  devices,
  themes,
  locales,
}

enum DisplayMode {
  widgetOnly,
  codeOnly,
  widgetCodeSideBySide,
}

@freezed
class ViewerState with _$ViewerState {
  static const String storageKey = 'flutter_design_viewer';
  static const String settingsKey = 'settings';
  const ViewerState._();
  const factory ViewerState({
    required ViewMode viewMode,
    required DisplayMode displayMode,
    required ThemeMode themeMode,
    required bool showDataBuilderByDefault,
    required bool expandExplorerNodesByDefault,
    required String targetDeviceId,
    required List<String> targetDeviceIds,
    required String targetThemeId,
    required List<String> targetThemeIds,
    required String targetLocaleId,
    required List<String> targetLocaleIds,
    @Default(false) bool explorerPinned,
    String? uri,
  }) = _ViewerState;

  factory ViewerState.createDefault(ViewerSettings viewerSettings) =>
      ViewerState(
        viewMode: ViewMode.themes,
        displayMode: DisplayMode.widgetCodeSideBySide,
        themeMode: ThemeMode.dark,
        explorerPinned: true,
        showDataBuilderByDefault: true,
        expandExplorerNodesByDefault: true,
        targetDeviceId: Devices.ios.iPhone12.identifier.toString(),
        targetDeviceIds: [
          Devices.ios.iPhone12.identifier.toString(),
          Devices.ios.iPad.identifier.toString(),
          Devices.macOS.wideMonitor.identifier.toString(),
        ],
        targetLocaleId: viewerSettings.enabledLocales.keys.first,
        targetLocaleIds: viewerSettings.enabledLocales.keys.toList(),
        targetThemeId: viewerSettings.enabledThemes.keys.first,
        targetThemeIds: viewerSettings.enabledThemes.keys.toList(),
      );

  factory ViewerState.fromJson(Map<String, dynamic> json) =>
      _$ViewerStateFromJson(json);

  IconData get themeModeIcon => {
        ThemeMode.system: Ionicons.partly_sunny,
        ThemeMode.dark: Ionicons.moon,
        ThemeMode.light: Ionicons.sunny,
      }[themeMode]!;

  String get themeModeTooltip => themeMode.name;

  ThemeMode get nextThemeMode => ThemeMode.values[
      (ThemeMode.values.indexOf(themeMode) + 1) % ThemeMode.values.length];

  bool get isValid =>
      targetDeviceId.isNotEmpty &&
      targetLocaleId.isNotEmpty &&
      targetLocaleIds.isNotEmpty &&
      targetThemeIds.isNotEmpty &&
      targetThemeId.isNotEmpty &&
      uri?.isNotEmpty == true &&
      uri != '/404' &&
      uri != '/';

  static Future<ViewerState?> getFromStorage() async {
    final storage = LocalStorage(storageKey);
    try {
      if (await storage.ready) {
        final value = storage.getItem(settingsKey);
        if (value != null) {
          final json = jsonDecode(value);
          return ViewerState.fromJson(json);
        }
      }
    } on Error catch (e) {
      // ignore: avoid_print
      print('Error: $e');
      // Delete cache
      await storage.deleteItem(settingsKey);
    }
    return null;
  }

  Future saveToStorage() async {
    final storage = LocalStorage(storageKey);
    if (await storage.ready) {
      await storage.setItem(
        settingsKey,
        toJson(),
        jsonEncode,
      );
    }
  }
}

@freezed
class ViewerSettings with _$ViewerSettings {
  const factory ViewerSettings({
    required Map<String, Locale> enabledLocales,
    required Map<String, DesignTheme> enabledThemes,
    @Default(Breakpoints()) Breakpoints breakpoints,
    @Default(600.0) double widgetDisplayHeight,
    @Default(500.0) double rightPanelInitialWidth,
    String? githubLink,
  }) = _ViewerSettigns;
}

@freezed
class Breakpoints with _$Breakpoints {
  const factory Breakpoints({
    @Default(320) double mobile,
    @Default(768) double tablet,
    @Default(1024) double desktop,
  }) = _Breakpoints;

  factory Breakpoints.fromJson(Map<String, dynamic> json) =>
      _$BreakpointsFromJson(json);
}
