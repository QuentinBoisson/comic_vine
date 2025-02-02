import 'package:comic_vine/api/models/Series/series_api.dart';
import 'package:comic_vine/api/off_api.dart';
import 'package:comic_vine/models/series.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SeriesDetailsEvent {}

class LoadSeriesDetailsEvent extends SeriesDetailsEvent {
  LoadSeriesDetailsEvent();
}

class SeriesDetailsBloc extends Bloc<SeriesDetailsEvent, SeriesDetailsState> {
  SeriesDetailsBloc(this.seriesId)
      : assert(seriesId.isNotEmpty),
        super(SeriesDetailsNotifierLoadingState()) {
    on<LoadSeriesDetailsEvent>(_getSeriesDetails);
    add(LoadSeriesDetailsEvent());
  }

  final String seriesId;

  Future<void> _getSeriesDetails(
    SeriesDetailsEvent event,
    Emitter<SeriesDetailsState> emit,
  ) async {
    try {
      final SeriesDetailServerResponse? response =
          await OFFAPIManager().getSeriesById(seriesId);
      emit(SeriesDetailsNotifierSuccessState(
          response!.response.generateSeries()));
    } catch (e) {
      emit(SeriesDetailsNotifierErrorState(e));
    }
  }
}

sealed class SeriesDetailsState {}

class SeriesDetailsNotifierLoadingState extends SeriesDetailsState {}

class SeriesDetailsNotifierSuccessState extends SeriesDetailsState {
  final Series? series;

  SeriesDetailsNotifierSuccessState(this.series);
}

class SeriesDetailsNotifierErrorState extends SeriesDetailsState {
  final dynamic error;

  SeriesDetailsNotifierErrorState(this.error);
}
