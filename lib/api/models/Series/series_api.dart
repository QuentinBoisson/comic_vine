import 'package:comic_vine/api/models/common/image_data_api.dart';
import 'package:comic_vine/api/models/common/named_entity_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'series_api.g.dart';

@JsonSerializable()
class SeriesDetailServerResponse {
  @JsonKey(name: 'results')
  final SeriesDetailResponse response;
  @JsonKey(name: 'error')
  final dynamic error;

  SeriesDetailServerResponse(this.response, this.error);

  factory SeriesDetailServerResponse.fromJson(Map<String, dynamic> json) =>
      _$SeriesDetailServerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesDetailServerResponseToJson(this);
}

@JsonSerializable()
class SeriesDetailResponse {
  @JsonKey(name: 'name')
  final String? title;
  @JsonKey(name: 'publisher')
  final NamedEntity? publisher;
  @JsonKey(name: 'count_of_episodes')
  final int? episodeCount;
  @JsonKey(name: 'date_added')
  final DateTime? releaseDate;
  @JsonKey(name: 'description')
  final String? story;
  @JsonKey(name: 'character_credits')
  final List<NamedEntity>? characters;
  @JsonKey(name: 'episodes')
  final List<NamedEntity>? episodes;
  @JsonKey(name: 'image')
  final ImageData? imageUrls;

  SeriesDetailResponse(
    this.title,
    this.publisher,
    this.episodeCount,
    this.releaseDate,
    this.story,
    this.characters,
    this.episodes,
    this.imageUrls,
  );

  factory SeriesDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$SeriesDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesDetailResponseToJson(this);
}
