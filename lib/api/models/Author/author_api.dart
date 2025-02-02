import 'package:comic_vine/api/models/common/image_data_api.dart';
import 'package:comic_vine/models/author.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author_api.g.dart';

@JsonSerializable()
class AuthorDetailServerResponse {
  @JsonKey(name: 'results')
  final AuthorDetailResponse response;
  @JsonKey(name: 'error')
  final dynamic error;

  AuthorDetailServerResponse(this.response, this.error);

  factory AuthorDetailServerResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorDetailServerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorDetailServerResponseToJson(this);
}

@JsonSerializable()
class AuthorDetailResponse {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'role')
  final String? role;
  @JsonKey(name: 'image')
  final ImageData? imageUrls;

  AuthorDetailResponse(this.name, this.role, this.imageUrls);

  factory AuthorDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorDetailResponseToJson(this);

  Author generateAuthor() =>
      Author(name: name, iconUrl: imageUrls?.iconUrl, role: role);
}
