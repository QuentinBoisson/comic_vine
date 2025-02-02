import 'package:comic_vine/api/models/common/image_data_api.dart';
import 'package:comic_vine/api/models/common/named_entity_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_api.g.dart';

@JsonSerializable()
class MovieDetailServerResponse {
  @JsonKey(name: 'results')
  final MovieDetailResponse response;
  @JsonKey(name: 'error')
  final dynamic error;

  MovieDetailServerResponse(this.response, this.error);

  factory MovieDetailServerResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailServerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailServerResponseToJson(this);

//
}

@JsonSerializable()
class MovieDetailResponse {
  @JsonKey(name: 'name')
  final String? title;
  @JsonKey(name: 'runtime')
  final int? runtime;
  @JsonKey(name: 'release_date')
  final DateTime? releaseDate;
  @JsonKey(name: 'description')
  final String? story;
  @JsonKey(name: 'characters')
  final List<NamedEntity>? characters;
  @JsonKey(name: 'rating')
  final String? rating;
  @JsonKey(name: 'writers')
  final List<NamedEntity>? writers;
  @JsonKey(name: 'producers')
  final List<NamedEntity>? producers;
  @JsonKey(name: 'studios')
  final List<NamedEntity>? studios;
  @JsonKey(name: 'budget')
  final int? budget;
  @JsonKey(name: 'box_office_revenue')
  final int? boxOfficeRevenue;
  @JsonKey(name: 'total_revenue')
  final int? totalRevenue;
  @JsonKey(name: 'image')
  final ImageData? imageUrls;

  MovieDetailResponse(
    this.title,
    this.runtime,
    this.releaseDate,
    this.story,
    this.characters,
    this.rating,
    this.writers,
    this.producers,
    this.studios,
    this.budget,
    this.boxOfficeRevenue,
    this.totalRevenue,
    this.imageUrls,
  );

  factory MovieDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailResponseToJson(this);
}
