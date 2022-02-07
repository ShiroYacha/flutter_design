// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViewerState _$$_ViewerStateFromJson(Map<String, dynamic> json) =>
    _$_ViewerState(
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

Map<String, dynamic> _$$_ViewerStateToJson(_$_ViewerState instance) =>
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

_$_Breakpoints _$$_BreakpointsFromJson(Map<String, dynamic> json) =>
    _$_Breakpoints(
      mobile: (json['mobile'] as num?)?.toDouble() ?? 320,
      tablet: (json['tablet'] as num?)?.toDouble() ?? 768,
      desktop: (json['desktop'] as num?)?.toDouble() ?? 1024,
    );

Map<String, dynamic> _$$_BreakpointsToJson(_$_Breakpoints instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'tablet': instance.tablet,
      'desktop': instance.desktop,
    };
