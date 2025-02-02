class ComicBook {
  final String? volumeName;
  final String? issueName;
  final int? issueNumber;
  final DateTime? releaseDate;
  final String? story;
  final List<String>? authorIdList;
  final List<String>? characterIdList;
  final String? thumbnailUrl;
  final String? backgroundUrl;

  ComicBook({
    this.volumeName,
    this.issueName,
    this.story,
    this.issueNumber,
    this.releaseDate,
    this.characterIdList,
    this.authorIdList,
    this.thumbnailUrl,
    this.backgroundUrl,
  });
}
