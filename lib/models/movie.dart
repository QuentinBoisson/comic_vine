class Movie {
  final String? title;
  final String? story;
  final int? runtime;
  final DateTime? releaseDate;
  final List<int>? characterIdList;
  final String? classification;
  final List<String>? screenwriters;
  final List<String>? producers;
  final List<String>? studios;
  final int? budget;
  final int? boxOfficeRevenue;
  final int? totalRevenue;
  final String? thumbnailUrl;
  final String? backgroundUrl;

  Movie({
    this.title,
    this.story,
    this.runtime,
    this.releaseDate,
    this.characterIdList,
    this.classification,
    this.screenwriters,
    this.producers,
    this.studios,
    this.budget,
    this.boxOfficeRevenue,
    this.totalRevenue,
    this.thumbnailUrl,
    this.backgroundUrl,
  });
}
