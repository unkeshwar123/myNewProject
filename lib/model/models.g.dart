// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) => DataResponse(
      seo_settings:
          SeoSettings.fromJson(json['seo_settings'] as Map<String, dynamic>),
      deals: (json['deals'] as List<dynamic>)
          .map((e) => Deal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'seo_settings': instance.seo_settings,
      'deals': instance.deals,
    };

SeoSettings _$SeoSettingsFromJson(Map<String, dynamic> json) => SeoSettings(
      seo_title: json['seo_title'] as String,
      seo_description: json['seo_description'] as String,
      web_url: json['web_url'] as String,
    );

Map<String, dynamic> _$SeoSettingsToJson(SeoSettings instance) =>
    <String, dynamic>{
      'seo_title': instance.seo_title,
      'seo_description': instance.seo_description,
      'web_url': instance.web_url,
    };

Deal _$DealFromJson(Map<String, dynamic> json) => Deal(
      id: json['id'] as int,
      comments_count: json['comments_count'] as int,
      created_at: json['created_at'] as String,
      created_at_in_millis: json['created_at_in_millis'] as int,
      image_medium: json['image_medium'] as String,
      store: json['store'] == null
          ? null
          : Store.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DealToJson(Deal instance) => <String, dynamic>{
      'id': instance.id,
      'comments_count': instance.comments_count,
      'created_at': instance.created_at,
      'created_at_in_millis': instance.created_at_in_millis,
      'image_medium': instance.image_medium,
      'store': instance.store,
    };

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      name: json['name'] as String,
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'name': instance.name,
    };
