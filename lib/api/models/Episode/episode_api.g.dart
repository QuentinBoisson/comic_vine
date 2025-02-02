// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeDetailServerResponse _$EpisodeDetailServerResponseFromJson(
        Map<String, dynamic> json) =>
    EpisodeDetailServerResponse(
      EpisodeDetailResponse.fromJson(json['results'] as Map<String, dynamic>),
      json['error'],
    );

Map<String, dynamic> _$EpisodeDetailServerResponseToJson(
        EpisodeDetailServerResponse instance) =>
    <String, dynamic>{
      'results': instance.response,
      'error': instance.error,
    };

EpisodeListServerResponse _$EpisodeListServerResponseFromJson(
        Map<String, dynamic> json) =>
    EpisodeListServerResponse(
      (json['results'] as List<dynamic>)
          .map((e) => EpisodeDetailResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['error'],
    );

Map<String, dynamic> _$EpisodeListServerResponseToJson(
        EpisodeListServerResponse instance) =>
    <String, dynamic>{
      'results': instance.response,
      'error': instance.error,
    };

EpisodeDetailResponse _$EpisodeDetailResponseFromJson(
        Map<String, dynamic> json) =>
    EpisodeDetailResponse(
      (json['episode_number'] as num?)?.toInt(),
      json['name'] as String?,
      json['air_date'] == null
          ? null
          : DateTime.parse(json['air_date'] as String),
      json['image'] == null
          ? null
          : ImageData.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EpisodeDetailResponseToJson(
        EpisodeDetailResponse instance) =>
    <String, dynamic>{
      'episode_number': instance.episodeNumber,
      'name': instance.title,
      'air_date': instance.releaseDate?.toIso8601String(),
      'image': instance.imageUrls,
    };
