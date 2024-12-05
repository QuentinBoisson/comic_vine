// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailServerResponse _$MovieDetailServerResponseFromJson(
        Map<String, dynamic> json) =>
    MovieDetailServerResponse(
      MovieDetailResponse.fromJson(json['results'] as Map<String, dynamic>),
      json['error'],
    );

Map<String, dynamic> _$MovieDetailServerResponseToJson(
        MovieDetailServerResponse instance) =>
    <String, dynamic>{
      'results': instance.response,
      'error': instance.error,
    };

MovieDetailResponse _$MovieDetailResponseFromJson(Map<String, dynamic> json) =>
    MovieDetailResponse(
      json['name'] as String?,
      (json['runtime'] as num?)?.toInt(),
      json['release_date'] == null
          ? null
          : DateTime.parse(json['release_date'] as String),
      json['description'] as String?,
      (json['characters'] as List<dynamic>?)
          ?.map((e) => NamedEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['rating'] as String?,
      (json['writers'] as List<dynamic>?)
          ?.map((e) => NamedEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['producers'] as List<dynamic>?)
          ?.map((e) => NamedEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['studios'] as List<dynamic>?)
          ?.map((e) => NamedEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['budget'] as num?)?.toInt(),
      (json['box_office_revenue'] as num?)?.toInt(),
      (json['total_revenue'] as num?)?.toInt(),
      json['image'] == null
          ? null
          : ImageData.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieDetailResponseToJson(
        MovieDetailResponse instance) =>
    <String, dynamic>{
      'name': instance.title,
      'runtime': instance.runtime,
      'release_date': instance.releaseDate?.toIso8601String(),
      'description': instance.story,
      'characters': instance.characters,
      'rating': instance.rating,
      'writers': instance.writers,
      'producers': instance.producers,
      'studios': instance.studios,
      'budget': instance.budget,
      'box_office_revenue': instance.boxOfficeRevenue,
      'total_revenue': instance.totalRevenue,
      'image': instance.imageUrls,
    };
