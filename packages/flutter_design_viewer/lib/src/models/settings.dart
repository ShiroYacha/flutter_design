// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:localstorage/localstorage.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

enum ViewMode { canvas, devices, themes, locales }

@freezed
class ViewerSettings with _$ViewerSettings {
  static const String storageKey = 'flutter_design_viewer';
  static const String settingsKey = 'settings';
  const ViewerSettings._();
  const factory ViewerSettings({
    required ViewMode viewMode,
    required List<String> enabledDeviceIds,
    required String targetDeviceId,
    required String targetThemeId,
    required List<String> enabledLocaleCodes,
    required String targetLocaleCode,
    String? catalogId,
  }) = _ViewerSettings;

  factory ViewerSettings.fromJson(Map<String, dynamic> json) =>
      _$ViewerSettingsFromJson(json);

  static Future<ViewerSettings?> getFromStorage() async {
    final storage = LocalStorage(storageKey);
    try {
      if (await storage.ready) {
        final value = storage.getItem(settingsKey);
        if (value != null) {
          final json = jsonDecode(value);
          return ViewerSettings.fromJson(json);
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


// final defaultViewerSettings = ViewerSettings(
//   viewMode: ViewMode.themes,
//   enabledDeviceIds: [
//     Devices.ios.iPhone12,
//     Devices.android.samsungGalaxyS20,
//   ],
//   targetDeviceId: Devices.ios.iPhone12,
//   enabledLocaleCodes: [supportedLocales.first],
//   targetLocaleCode: supportedLocales.first,
//   targetThemeId: themeMap.entries.first.key,
// );
