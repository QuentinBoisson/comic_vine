import 'dart:convert';
import 'package:http/http.dart' as http;

String cleanHtmlTags(String htmlText) {
  final RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: false);
  return htmlText.replaceAll(exp, '').trim();
}

class ComicVineAPI {
  static const String ApiKey = '02dca90269220214a7e549c8e3ff211b8ad76143';
  static const String baseUrl = 'https://comicvine.gamespot.com/api';

  // Appel API pour Comics
  static Future<List<dynamic>> fetchComics() async {
    final String url = '$baseUrl/issues/?api_key=$ApiKey&format=json&limit=50';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        print('Données brutes des comics : ${data['results']}');

        final List<dynamic> results = data['results'] ?? [];

        return results.map((json) {
          print('Comic brut : $json');

          return {
            'name': json['volume'] != null
                ? json['volume']['name']
                : json['name'] ?? 'Titre indisponible',
            'description': json['description'] != null
                ? cleanHtmlTags(json['description'])
                : 'Description indisponible',
            'coverUrl': json['image']?['medium_url'] ?? '',
            'issueNumber': json['issue_number'] ?? 'Numéro inconnu',
            'date': json['cover_date'] ?? 'Date inconnue',
          };

        }).toList();
      } else {
        throw Exception('Erreur ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur lors du chargement des comics : $e');
    }
  }

  //Appel API pour Series
  static Future<List<dynamic>> fetchSeries() async {
    final String url = '$baseUrl/series_list/?api_key=$ApiKey&format=json&limit=50';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> results = data['results'] ?? [];

        return results.map((json) {
          return {
            'name': json['name'] ?? 'Nom indisponible',
            'description': cleanHtmlTags(json['description'] ?? ''),
            'coverUrl': json['image']?['medium_url'] ?? '',
            'publisher': json['publisher']?['name'] ?? '',
            'episodeCount': json['count_of_episodes']?.toString() ?? '',
            'startYear': json['start_year']?.toString() ?? '',
          };
        }).toList();
      } else {
        throw Exception('Erreur ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur lors du chargement des séries : $e');
    }
  }

  //Appel API pour Films
  static Future<List<dynamic>> fetchFilms() async {
    final String url = '$baseUrl/movies/?api_key=$ApiKey&format=json&limit=50';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> results = data['results'] ?? [];

        return results.map((json) {
          return {
            'name': json['name'] ?? 'Nom indisponible',
            'description': cleanHtmlTags(json['description'] ?? ''),
            'coverUrl': json['image']?['medium_url'] ?? '',
            'runtime': json['runtime'] != null ? '${json['runtime']} min' : '',
            'releaseDate': json['release_date'] ?? '',
          };
        }).toList();
      } else {
        throw Exception('Erreur ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur lors du chargement des films : $e');
    }
  }

}
