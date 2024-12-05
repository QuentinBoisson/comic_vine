import 'package:comic_vine/models/character.dart';

class Movie {
  final String? title;
  final String? story;
  final int? runtime;
  final DateTime? releaseDate;
  final List<Character>? characters;
  final String? classification;
  final List<String>? screenwriters;
  final List<String>? producers;
  final List<String>? studios;
  final int? budget;
  final int? boxOfficeRevenue;
  final int? totalRevenue;
  final String? coverUrl;
  final String? backgroundUrl;

  Movie({
    this.title,
    this.story,
    this.runtime,
    this.releaseDate,
    this.characters,
    this.classification,
    this.screenwriters,
    this.producers,
    this.studios,
    this.budget,
    this.boxOfficeRevenue,
    this.totalRevenue,
    this.coverUrl,
    this.backgroundUrl,
  });
}
