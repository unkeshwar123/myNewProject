import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class DataResponse {
  final SeoSettings seo_settings;
  final List<Deal> deals;

  DataResponse({required this.seo_settings, required this.deals});

  factory DataResponse.fromJson(Map<String, dynamic> json) => _$DataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}

@JsonSerializable()
class SeoSettings {
  final String seo_title;
  final String seo_description;
  final String web_url;

  SeoSettings({required this.seo_title, required this.seo_description, required this.web_url});

  factory SeoSettings.fromJson(Map<String, dynamic> json) => _$SeoSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$SeoSettingsToJson(this);
}

@JsonSerializable()
class Deal {
  final int id;
  final int comments_count;
  final String created_at;
  final int created_at_in_millis;
  final String image_medium;
  final Store? store;

  Deal({
    required this.id,
    required this.comments_count,
    required this.created_at,
    required this.created_at_in_millis,
    required this.image_medium,
    this.store,
  });

  factory Deal.fromJson(Map<String, dynamic> json) => _$DealFromJson(json);
  Map<String, dynamic> toJson() => _$DealToJson(this);
}

@JsonSerializable()
class Store {
  final String name;


  Store({
    required this.name,
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
  Map<String, dynamic> toJson() => _$StoreToJson(this);
}
