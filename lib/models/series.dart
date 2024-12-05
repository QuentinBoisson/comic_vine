import 'package:comic_vine/models/character.dart';
import 'package:comic_vine/models/episode.dart';

class Series {
  final String? title;
  final String? publisher;
  final int? episodeCount;
  final DateTime? releaseDate;
  final String? story;
  final List<Character>? characters;
  final List<Episode>? episodes;
  final String? coverUrl;
  final String? backgroundUrl;

  Series({
    this.title,
    this.publisher,
    this.episodeCount,
    this.releaseDate,
    this.story,
    this.characters,
    this.episodes,
    this.coverUrl,
    this.backgroundUrl,
  });
}
