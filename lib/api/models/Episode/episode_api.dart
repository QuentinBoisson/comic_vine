import 'package:comic_vine/api/models/common/image_data_api.dart';
import 'package:comic_vine/models/episode.dart';
import 'package:json_annotation/json_annotation.dart';

part 'episode_api.g.dart';

@JsonSerializable()
class EpisodeDetailServerResponse {
  @JsonKey(name: 'results')
  final EpisodeDetailResponse response;
  @JsonKey(name: 'error')
  final dynamic error;

  EpisodeDetailServerResponse(this.response, this.error);

  factory EpisodeDetailServerResponse.fromJson(Map<String, dynamic> json) =>
      _$EpisodeDetailServerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeDetailServerResponseToJson(this);
}

@JsonSerializable()
class EpisodeListServerResponse {
  @JsonKey(name: 'results')
  final List<EpisodeDetailResponse> response;
  @JsonKey(name: 'error')
  final dynamic error;

  EpisodeListServerResponse(this.response, this.error);

  factory EpisodeListServerResponse.fromJson(Map<String, dynamic> json) =>
      _$EpisodeListServerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeListServerResponseToJson(this);
}

@JsonSerializable()
class EpisodeDetailResponse {
  @JsonKey(name: 'episode_number')
  final int? episodeNumber;
  @JsonKey(name: 'name')
  final String? title;
  @JsonKey(name: 'air_date')
  final DateTime? releaseDate;
  @JsonKey(name: 'image')
  final ImageData? imageUrls;

  EpisodeDetailResponse(
    this.episodeNumber,
    this.title,
    this.releaseDate,
    this.imageUrls,
  );

  factory EpisodeDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$EpisodeDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeDetailResponseToJson(this);

  Episode generateEpisode() => Episode(
        releaseDate: releaseDate,
        imageUrl: imageUrls?.thumbnailUrl,
        title: title,
        episodeNumber: episodeNumber,
      );
}
