// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorDetailServerResponse _$AuthorDetailServerResponseFromJson(
        Map<String, dynamic> json) =>
    AuthorDetailServerResponse(
      AuthorDetailResponse.fromJson(json['results'] as Map<String, dynamic>),
      json['error'],
    );

Map<String, dynamic> _$AuthorDetailServerResponseToJson(
        AuthorDetailServerResponse instance) =>
    <String, dynamic>{
      'results': instance.response,
      'error': instance.error,
    };

AuthorDetailResponse _$AuthorDetailResponseFromJson(
        Map<String, dynamic> json) =>
    AuthorDetailResponse(
      json['name'] as String?,
      json['role'] as String?,
      json['image'] == null
          ? null
          : ImageData.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthorDetailResponseToJson(
        AuthorDetailResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'role': instance.role,
      'image': instance.imageUrls,
    };
