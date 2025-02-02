import 'package:comic_vine/api/models/common/image_data_api.dart';
import 'package:comic_vine/api/models/common/named_entity_api.dart';
import 'package:comic_vine/models/comic_book.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comic_book_api.g.dart';

@JsonSerializable()
class ComicBookDetailServerResponse {
  @JsonKey(name: 'results')
  final ComicBookDetailResponse response;
  @JsonKey(name: 'error')
  final dynamic error;

  ComicBookDetailServerResponse(this.response, this.error);

  factory ComicBookDetailServerResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicBookDetailServerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicBookDetailServerResponseToJson(this);
}

@JsonSerializable()
class ComicBookDetailResponse {
  @JsonKey(name: 'volume')
  final NamedEntity? volume;
  @JsonKey(name: 'name')
  final String? issueName;
  @JsonKey(name: 'issue_number')
  final int? issueNumber;
  @JsonKey(name: 'release_date')
  final DateTime? releaseDate;
  @JsonKey(name: 'description')
  final String? story;
  @JsonKey(name: 'person_credits')
  final List<NamedEntity>? authors;
  @JsonKey(name: 'character_credits')
  final List<NamedEntity>? characters;
  @JsonKey(name: 'image')
  final ImageData? imageUrls;

  ComicBookDetailResponse(
      this.volume,
      this.issueName,
      this.issueNumber,
      this.releaseDate,
      this.story,
      this.authors,
      this.characters,
      this.imageUrls);

  factory ComicBookDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicBookDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicBookDetailResponseToJson(this);

  ComicBook generateComicBook() => ComicBook(
        story: story,
        backgroundUrl: imageUrls?.backgroundUrl,
        authorIdList: authors?.map((creatorInfo) => creatorInfo.id).toList(),
        characterIdList: characters?.map((character) => character.id).toList(),
        issueName: issueName,
        issueNumber: issueNumber,
        releaseDate: releaseDate,
        thumbnailUrl: imageUrls?.thumbnailUrl,
        volumeName: volume?.name,
      );
}
