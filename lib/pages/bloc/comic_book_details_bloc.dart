import 'package:comic_vine/api/models/ComicBook/comic_book_api.dart';
import 'package:comic_vine/api/off_api.dart';
import 'package:comic_vine/models/comic_book.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ComicBookDetailsEvent {}

class LoadComicBookDetailsEvent extends ComicBookDetailsEvent {
  LoadComicBookDetailsEvent();
}

class ComicBookDetailsBloc
    extends Bloc<ComicBookDetailsEvent, ComicBookDetailsState> {
  ComicBookDetailsBloc(this.comicBookId)
      : assert(comicBookId.isNotEmpty),
        super(ComicBookDetailsNotifierLoadingState()) {
    on<LoadComicBookDetailsEvent>(_getComicBook);
    add(LoadComicBookDetailsEvent());
  }

  final String comicBookId;

  Future<void> _getComicBook(
    ComicBookDetailsEvent event,
    Emitter<ComicBookDetailsState> emit,
  ) async {
    try {
      final ComicBookDetailServerResponse? response =
          await OFFAPIManager().getComicBookById(comicBookId);
      emit(ComicBookDetailsNotifierSuccessState(
          response!.response.generateComicBook()));
    } catch (e) {
      emit(ComicBookDetailsNotifierErrorState(e));
    }
  }
}

sealed class ComicBookDetailsState {}

class ComicBookDetailsNotifierLoadingState extends ComicBookDetailsState {}

class ComicBookDetailsNotifierSuccessState extends ComicBookDetailsState {
  final ComicBook? comicBook;

  ComicBookDetailsNotifierSuccessState(this.comicBook);
}

class ComicBookDetailsNotifierErrorState extends ComicBookDetailsState {
  final dynamic error;

  ComicBookDetailsNotifierErrorState(this.error);
}
