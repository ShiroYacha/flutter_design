// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searches.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchResultItem _$$_SearchResultItemFromJson(Map<String, dynamic> json) =>
    _$_SearchResultItem(
      context: $enumDecode(_$SearchResultContextEnumMap, json['context']),
      type: $enumDecode(_$SearchResultItemTypeEnumMap, json['type']),
      pageType:
          $enumDecode(_$SearchResultItemPageTypeEnumMap, json['pageType']),
      prefix:
          $enumDecodeNullable(_$SearchResultItemPrefixEnumMap, json['prefix']),
      score: json['score'] as int,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
      labelHighlightStart: json['labelHighlightStart'] as int,
      labelHighlightEnd: json['labelHighlightEnd'] as int,
      uri: json['uri'] as String,
    );

Map<String, dynamic> _$$_SearchResultItemToJson(_$_SearchResultItem instance) =>
    <String, dynamic>{
      'context': _$SearchResultContextEnumMap[instance.context],
      'type': _$SearchResultItemTypeEnumMap[instance.type],
      'pageType': _$SearchResultItemPageTypeEnumMap[instance.pageType],
      'prefix': _$SearchResultItemPrefixEnumMap[instance.prefix],
      'score': instance.score,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'labelHighlightStart': instance.labelHighlightStart,
      'labelHighlightEnd': instance.labelHighlightEnd,
      'uri': instance.uri,
    };

const _$SearchResultContextEnumMap = {
  SearchResultContext.documentation: 'documentation',
  SearchResultContext.recent: 'recent',
  SearchResultContext.favorite: 'favorite',
};

const _$SearchResultItemTypeEnumMap = {
  SearchResultItemType.page: 'page',
  SearchResultItemType.section: 'section',
  SearchResultItemType.content: 'content',
  SearchResultItemType.recent: 'recent',
  SearchResultItemType.favorite: 'favorite',
};

const _$SearchResultItemPageTypeEnumMap = {
  SearchResultItemPageType.document: 'document',
  SearchResultItemPageType.component: 'component',
  SearchResultItemPageType.prototype: 'prototype',
};

const _$SearchResultItemPrefixEnumMap = {
  SearchResultItemPrefix.sub: 'sub',
  SearchResultItemPrefix.subEnd: 'subEnd',
};
