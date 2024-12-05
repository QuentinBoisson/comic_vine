import 'package:json_annotation/json_annotation.dart';

part 'image_data_api.g.dart';

@JsonSerializable()
class ImageData {
  @JsonKey(name: 'icon_url')
  final String? iconUrl;
  @JsonKey(name: 'thumb_url')
  final String? thumbnailUrl;
  @JsonKey(name: 'screen_url')
  final String? backgroundUrl;

  ImageData(this.iconUrl, this.thumbnailUrl, this.backgroundUrl);

  factory ImageData.fromJson(Map<String, dynamic> json) =>
      _$ImageDataFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDataToJson(this);
}
