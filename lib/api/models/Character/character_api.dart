import 'package:comic_vine/api/models/common/image_data_api.dart';
import 'package:comic_vine/api/models/common/named_entity_api.dart';
import 'package:comic_vine/models/character.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_api.g.dart';

@JsonSerializable()
class CharacterDetailServerResponse {
  @JsonKey(name: 'results')
  final CharacterDetailResponse response;
  @JsonKey(name: 'error')
  final dynamic error;

  CharacterDetailServerResponse(this.response, this.error);

  factory CharacterDetailServerResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterDetailServerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterDetailServerResponseToJson(this);
}

@JsonSerializable()
class CharacterListServerResponse {
  @JsonKey(name: 'results')
  final List<CharacterDetailResponse> response;
  @JsonKey(name: 'error')
  final dynamic error;

  CharacterListServerResponse(this.response, this.error);

  factory CharacterListServerResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterListServerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterListServerResponseToJson(this);
}

@JsonSerializable()
class CharacterDetailResponse {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'description')
  final String? story;
  @JsonKey(name: 'real_name')
  final String? realName;
  @JsonKey(name: 'aliases')
  final String? aliases;
  @JsonKey(name: 'publisher')
  final NamedEntity? publisher;
  @JsonKey(name: 'creators')
  final List<NamedEntity>? creators;
  @JsonKey(name: 'gender')
  final int? gender;
  @JsonKey(name: 'birth')
  final DateTime? birthDate;
  @JsonKey(name: 'image')
  final ImageData? imageUrls;

  CharacterDetailResponse(
    this.name,
    this.story,
    this.realName,
    this.aliases,
    this.publisher,
    this.creators,
    this.gender,
    this.birthDate,
    this.imageUrls,
  );

  factory CharacterDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterDetailResponseToJson(this);
  Character generateCharacter() => Character(
        story: story,
        iconUrl: imageUrls?.iconUrl,
        name: name,
        aliases: aliases,
        backgroundUrl: imageUrls?.backgroundUrl,
        birthDate: birthDate,
        creators:
            creators?.map((creatorInfo) => creatorInfo.name ?? '').toList(),
        gender: gender,
        publisher: publisher?.name,
        realName: realName,
      );
}
