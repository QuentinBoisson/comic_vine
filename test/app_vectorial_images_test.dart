import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:comic_vine/resources/resources.dart';

void main() {
  test('app_vectorial_images assets test', () {
    expect(File(AppVectorialImages.astronaut).existsSync(), isTrue);
    expect(File(AppVectorialImages.icBooksBicolor).existsSync(), isTrue);
    expect(File(AppVectorialImages.icCalendarBicolor).existsSync(), isTrue);
    expect(File(AppVectorialImages.icMovieBicolor).existsSync(), isTrue);
    expect(File(AppVectorialImages.icPublisherBicolor).existsSync(), isTrue);
    expect(File(AppVectorialImages.icTvBicolor).existsSync(), isTrue);
    expect(File(AppVectorialImages.navbarComics).existsSync(), isTrue);
    expect(File(AppVectorialImages.navbarHome).existsSync(), isTrue);
    expect(File(AppVectorialImages.navbarMovies).existsSync(), isTrue);
    expect(File(AppVectorialImages.navbarSearch).existsSync(), isTrue);
    expect(File(AppVectorialImages.navbarSeries).existsSync(), isTrue);
  });
}
