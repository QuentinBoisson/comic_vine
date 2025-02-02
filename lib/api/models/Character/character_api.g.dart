// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterDetailServerResponse _$CharacterDetailServerResponseFromJson(
        Map<String, dynamic> json) =>
    CharacterDetailServerResponse(
      CharacterDetailResponse.fromJson(json['results'] as Map<String, dynamic>),
      json['error'],
    );

Map<String, dynamic> _$CharacterDetailServerResponseToJson(
        CharacterDetailServerResponse instance) =>
    <String, dynamic>{
      'results': instance.response,
      'error': instance.error,
    };

CharacterListServerResponse _$CharacterListServerResponseFromJson(
        Map<String, dynamic> json) =>
    CharacterListServerResponse(
      (json['results'] as List<dynamic>)
          .map((e) =>
              CharacterDetailResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['error'],
    );

Map<String, dynamic> _$CharacterListServerResponseToJson(
        CharacterListServerResponse instance) =>
    <String, dynamic>{
      'results': instance.response,
      'error': instance.error,
    };

CharacterDetailResponse _$CharacterDetailResponseFromJson(
        Map<String, dynamic> json) =>
    CharacterDetailResponse(
      json['name'] as String?,
      json['description'] as String?,
      json['real_name'] as String?,
      json['aliases'] as String?,
      json['publisher'] == null
          ? null
          : NamedEntity.fromJson(json['publisher'] as Map<String, dynamic>),
      (json['creators'] as List<dynamic>?)
          ?.map((e) => NamedEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['gender'] as num?)?.toInt(),
      json['birth'] == null ? null : DateTime.parse(json['birth'] as String),
      json['image'] == null
          ? null
          : ImageData.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharacterDetailResponseToJson(
        CharacterDetailResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.story,
      'real_name': instance.realName,
      'aliases': instance.aliases,
      'publisher': instance.publisher,
      'creators': instance.creators,
      'gender': instance.gender,
      'birth': instance.birthDate?.toIso8601String(),
      'image': instance.imageUrls,
    };
