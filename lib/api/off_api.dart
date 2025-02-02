import 'package:comic_vine/api/models/Author/author_api.dart';
import 'package:comic_vine/api/models/Character/character_api.dart';
import 'package:comic_vine/api/models/ComicBook/comic_book_api.dart';
import 'package:comic_vine/api/models/Episode/episode_api.dart';
import 'package:comic_vine/api/models/Movie/movie_api.dart';
import 'package:comic_vine/api/models/Series/series_api.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'off_api.g.dart';

@RestApi(baseUrl: "https://comicvine.gamespot.com/api")
abstract class OFFAPI {
  factory OFFAPI(Dio dio, {required String baseUrl}) = _OFFAPI;

//Getting lists of entities
  @GET("/episodes/")
  Future<EpisodeListServerResponse?> loadEpisodesList(
    @Path('seriesId') String seriesId,
    @Query('api_key') String apiKey,
    @Query('format') String format,
  );

  @GET("/characters/")
  Future<CharacterListServerResponse?> loadCharactersList(
    @Query("api_key") String apiKey,
    @Query("format") String format,
    @Query('limit') String limit,
  );

//Getting entities by id
  @GET("/issue/4000-{comicId}/")
  Future<ComicBookDetailServerResponse?> getComicBookById(
    @Path("comicBookId") String comicId,
    @Query("api_key") String apiKey,
    @Query("format") String format,
  );

  @GET("/character/4005-{characterId}/")
  Future<CharacterDetailServerResponse?> getCharacterById(
    @Path("characterId") String characterId,
    @Query("api_key") String apiKey,
    @Query("format") String format,
  );

  @GET("/series/4075-{seriesId}/")
  Future<SeriesDetailServerResponse?> getSerieById(
      @Path("seriesId") String seriesId,
      @Query("api_key") String apiKey,
      @Query("format") String format);

  @GET("/movie/4075-{movieId}/")
  Future<MovieDetailServerResponse?> getMovieById(
      @Path("movieId") String movieId,
      @Query("api_key") String apiKey,
      @Query("format") String format);

  @GET("/person/4040-{authorId}/")
  Future<AuthorDetailServerResponse> getAuthorById(
      @Path("authorId") String author,
      @Query("api_key") String apiKey,
      @Query("format") String format);
}

class OFFAPIManager {
  static OFFAPIManager? _instance;

  //Singleton
  factory OFFAPIManager() {
    _instance ??= OFFAPIManager._();
    return _instance!;
  }

  final OFFAPI api;
  final String _apiKey = "e7770e8ecb131cbf24e12e5315887a87f14410e0";

  OFFAPIManager._()
      : api = OFFAPI(
            Dio(BaseOptions(
              headers: {
                'Content-Type': 'application/json',
              },
            )),
            baseUrl: "https://comicvine.gamespot.com/api");

  Future<EpisodeListServerResponse?> getEpisodeList(String id) async {
    try {
      return await api.loadEpisodesList(id, _apiKey, "json");
    } catch (e) {
      print("Erreur à la récupération des épisodes : $e");
      return null;
    }
  }

  Future<CharacterListServerResponse?> getCharactersList() async {
    try {
      return await api.loadCharactersList(_apiKey, "json", "50");
    } catch (e) {
      print("Erreur à la récupération des personnages : $e");
      return null;
    }
  }

  Future<ComicBookDetailServerResponse?> getComicBookById(
      String comicBookId) async {
    try {
      return await api.getComicBookById(comicBookId, _apiKey, "json");
    } catch (e) {
      print("Erreur à la récupération du comic : $e");
      return null;
    }
  }

  Future<CharacterDetailServerResponse?> getCharacterById(
      String characterId) async {
    try {
      return await api.getCharacterById(characterId, _apiKey, "json");
    } catch (e) {
      print("Erreur à la récupération du personnage : $e");
      return null;
    }
  }

  Future<SeriesDetailServerResponse?> getSeriesById(String seriesId) async {
    try {
      return await api.getSerieById(seriesId, _apiKey, "json");
    } catch (e) {
      print("Erreur à la récupération de la série : $e");
      return null;
    }
  }

  Future<MovieDetailServerResponse?> getMovieById(String movieId) async {
    try {
      return await api.getMovieById(movieId, _apiKey, "json");
    } catch (e) {
      print("Erreur à la récupération du film : $e");
      return null;
    }
  }

  Future<AuthorDetailServerResponse?> getAuthorById(String personId) async {
    try {
      return await api.getAuthorById(personId, _apiKey, "json");
    } catch (e) {
      print("Erreur à la récupération de l'auteur : $e");
      return null;
    }
  }
}
