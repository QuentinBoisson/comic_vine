import 'package:comic_vine/api/models/Episode/episode_api.dart';
import 'package:comic_vine/api/off_api.dart';
import 'package:comic_vine/models/episode.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class EpisodeListEvent {}

class LoadEpisodeListEvent extends EpisodeListEvent {}

class EpisodeListBloc extends Bloc<EpisodeListEvent, EpisodeListState> {
  EpisodeListBloc(this.seriesId) : super(EpisodeListNotifierLoadingState()) {
    on<LoadEpisodeListEvent>(_getEpisodeList);
    add(LoadEpisodeListEvent());
  }

  final String seriesId;

  Future<void> _getEpisodeList(
    EpisodeListEvent event,
    Emitter<EpisodeListState> emit,
  ) async {
    try {
      final EpisodeListServerResponse? response =
          await OFFAPIManager().getEpisodeList(seriesId);
      emit(EpisodeListNotifierSuccessState(response!.response
          .map((episode) => episode.generateEpisode())
          .toList()));
    } catch (e) {
      emit(EpisodeListNotifierErrorState(e));
    }
  }
}

sealed class EpisodeListState {}

class EpisodeListNotifierLoadingState extends EpisodeListState {}

class EpisodeListNotifierSuccessState extends EpisodeListState {
  final List<Episode> episodeList;

  EpisodeListNotifierSuccessState(this.episodeList);
}

class EpisodeListNotifierErrorState extends EpisodeListState {
  final dynamic error;

  EpisodeListNotifierErrorState(this.error);
}
