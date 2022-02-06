// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViewerSettings _$$_ViewerSettingsFromJson(Map<String, dynamic> json) =>
    _$_ViewerSettings(
      viewMode: $enumDecode(_$ViewModeEnumMap, json['viewMode']),
      enabledDeviceIds: (json['enabledDeviceIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      targetDeviceId: json['targetDeviceId'] as String,
      targetThemeId: json['targetThemeId'] as String,
      enabledLocaleCodes: (json['enabledLocaleCodes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      targetLocaleCode: json['targetLocaleCode'] as String,
      catalogId: json['catalogId'] as String?,
    );

Map<String, dynamic> _$$_ViewerSettingsToJson(_$_ViewerSettings instance) =>
    <String, dynamic>{
      'viewMode': _$ViewModeEnumMap[instance.viewMode],
      'enabledDeviceIds': instance.enabledDeviceIds,
      'targetDeviceId': instance.targetDeviceId,
      'targetThemeId': instance.targetThemeId,
      'enabledLocaleCodes': instance.enabledLocaleCodes,
      'targetLocaleCode': instance.targetLocaleCode,
      'catalogId': instance.catalogId,
    };

const _$ViewModeEnumMap = {
  ViewMode.canvas: 'canvas',
  ViewMode.devices: 'devices',
  ViewMode.themes: 'themes',
  ViewMode.locales: 'locales',
};
