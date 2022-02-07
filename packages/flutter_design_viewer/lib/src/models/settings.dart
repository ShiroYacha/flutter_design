// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localstorage/localstorage.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

enum ViewMode { canvas, devices, themes, locales }

@freezed
class ViewerState with _$ViewerState {
  static const String storageKey = 'flutter_design_viewer';
  static const String settingsKey = 'settings';
  const ViewerState._();
  const factory ViewerState({
    required ViewMode viewMode,
    required List<String> enabledDeviceIds,
    required String targetDeviceId,
    required String targetThemeId,
    required List<String> enabledLocaleCodes,
    required String targetLocaleCode,
    String? catalogId,
  }) = _ViewerState;

  factory ViewerState.fromJson(Map<String, dynamic> json) =>
      _$ViewerStateFromJson(json);

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
    @Default(Breakpoints()) Breakpoints breakpoints,
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
