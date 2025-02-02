// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesDetailServerResponse _$SeriesDetailServerResponseFromJson(
        Map<String, dynamic> json) =>
    SeriesDetailServerResponse(
      SeriesDetailResponse.fromJson(json['results'] as Map<String, dynamic>),
      json['error'],
    );

Map<String, dynamic> _$SeriesDetailServerResponseToJson(
        SeriesDetailServerResponse instance) =>
    <String, dynamic>{
      'results': instance.response,
      'error': instance.error,
    };

SeriesDetailResponse _$SeriesDetailResponseFromJson(
        Map<String, dynamic> json) =>
    SeriesDetailResponse(
      json['id'] as String?,
      json['name'] as String?,
      json['publisher'] == null
          ? null
          : NamedEntity.fromJson(json['publisher'] as Map<String, dynamic>),
      (json['count_of_episodes'] as num?)?.toInt(),
      json['date_added'] == null
          ? null
          : DateTime.parse(json['date_added'] as String),
      json['description'] as String?,
      (json['character_credits'] as List<dynamic>?)
          ?.map((e) => NamedEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['episodes'] as List<dynamic>?)
          ?.map((e) => NamedEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['image'] == null
          ? null
          : ImageData.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SeriesDetailResponseToJson(
        SeriesDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.title,
      'publisher': instance.publisher,
      'count_of_episodes': instance.episodeCount,
      'date_added': instance.releaseDate?.toIso8601String(),
      'description': instance.story,
      'character_credits': instance.characters,
      'episodes': instance.episodes,
      'image': instance.imageUrls,
    };
