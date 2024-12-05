import 'package:comic_vine/models/author.dart';
import 'package:comic_vine/models/character.dart';

class ComicBook {
  final String? volumeName;
  final String? issueName;
  final int? issueNumber;
  final DateTime? releaseDate;
  final String? story;
  final List<Author>? authors;
  final List<Character>? characters;
  final String? coverUrl;
  final String? backgroundUrl;

  ComicBook({
    this.volumeName,
    this.issueName,
    this.story,
    this.issueNumber,
    this.releaseDate,
    this.characters,
    this.authors,
    this.coverUrl,
    this.backgroundUrl,
  });
}
