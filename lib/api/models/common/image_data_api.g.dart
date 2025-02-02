// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_data_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageData _$ImageDataFromJson(Map<String, dynamic> json) => ImageData(
      json['icon_url'] as String?,
      json['thumb_url'] as String?,
      json['screen_url'] as String?,
    );

Map<String, dynamic> _$ImageDataToJson(ImageData instance) => <String, dynamic>{
      'icon_url': instance.iconUrl,
      'thumb_url': instance.thumbnailUrl,
      'screen_url': instance.backgroundUrl,
    };
