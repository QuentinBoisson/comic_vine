// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_book_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicBookDetailServerResponse _$ComicBookDetailServerResponseFromJson(
        Map<String, dynamic> json) =>
    ComicBookDetailServerResponse(
      ComicBookDetailResponse.fromJson(json['results'] as Map<String, dynamic>),
      json['error'],
    );

Map<String, dynamic> _$ComicBookDetailServerResponseToJson(
        ComicBookDetailServerResponse instance) =>
    <String, dynamic>{
      'results': instance.response,
      'error': instance.error,
    };

ComicBookDetailResponse _$ComicBookDetailResponseFromJson(
        Map<String, dynamic> json) =>
    ComicBookDetailResponse(
      json['volume'] == null
          ? null
          : NamedEntity.fromJson(json['volume'] as Map<String, dynamic>),
      json['name'] as String?,
      (json['issue_number'] as num?)?.toInt(),
      json['release_date'] == null
          ? null
          : DateTime.parse(json['release_date'] as String),
      json['description'] as String?,
      (json['person_credits'] as List<dynamic>?)
          ?.map((e) => NamedEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['character_credits'] as List<dynamic>?)
          ?.map((e) => NamedEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['image'] == null
          ? null
          : ImageData.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicBookDetailResponseToJson(
        ComicBookDetailResponse instance) =>
    <String, dynamic>{
      'volume': instance.volume,
      'name': instance.issueName,
      'issue_number': instance.issueNumber,
      'release_date': instance.releaseDate?.toIso8601String(),
      'description': instance.story,
      'person_credits': instance.authors,
      'character_credits': instance.characters,
      'image': instance.imageUrls,
    };
