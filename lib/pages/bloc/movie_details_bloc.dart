import 'package:comic_vine/api/models/Movie/movie_api.dart';
import 'package:comic_vine/api/off_api.dart';
import 'package:comic_vine/models/movie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MovieDetailsEvent {}

class LoadMovieDetailsEvent extends MovieDetailsEvent {
  LoadMovieDetailsEvent();
}

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.movieId)
      : assert(movieId.isNotEmpty),
        super(MovieDetailsNotifierLoadingState()) {
    on<LoadMovieDetailsEvent>(_getMovieDetails);
    add(LoadMovieDetailsEvent());
  }

  final String movieId;

  Future<void> _getMovieDetails(
    MovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    try {
      final MovieDetailServerResponse? response =
          await OFFAPIManager().getMovieById(movieId);
      emit(
          MovieDetailsNotifierSuccessState(response!.response.generateMovie()));
    } catch (e) {
      emit(MovieDetailsNotifierErrorState(e));
    }
  }
}

sealed class MovieDetailsState {}

class MovieDetailsNotifierLoadingState extends MovieDetailsState {}

class MovieDetailsNotifierSuccessState extends MovieDetailsState {
  final Movie? movie;

  MovieDetailsNotifierSuccessState(this.movie);
}

class MovieDetailsNotifierErrorState extends MovieDetailsState {
  final dynamic error;

  MovieDetailsNotifierErrorState(this.error);
}
