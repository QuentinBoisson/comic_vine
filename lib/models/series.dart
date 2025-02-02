class Series {
  final String? id;
  final String? title;
  final String? publisher;
  final int? episodeCount;
  final DateTime? releaseDate;
  final String? story;
  final List<String>? characterIdList;
  final List<String>? episodeIdList;
  final String? thumbnailUrl;
  final String? backgroundUrl;

  Series({
    this.id,
    this.title,
    this.publisher,
    this.episodeCount,
    this.releaseDate,
    this.story,
    this.characterIdList,
    this.episodeIdList,
    this.thumbnailUrl,
    this.backgroundUrl,
  });
}
