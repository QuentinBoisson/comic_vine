import 'package:comic_vine/api/models/Author/author_api.dart';
import 'package:comic_vine/api/off_api.dart';
import 'package:comic_vine/models/author.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AuthorDetailsEvent {}

class LoadAuthorDetailsEvent extends AuthorDetailsEvent {
  LoadAuthorDetailsEvent();
}

class AuthorDetailsBloc extends Bloc<AuthorDetailsEvent, AuthorDetailsState> {
  AuthorDetailsBloc(this.authorId)
      : assert(authorId.isNotEmpty),
        super(AuthorDetailsNotifierLoadingState()) {
    on<LoadAuthorDetailsEvent>(_getAuthor);
    add(LoadAuthorDetailsEvent());
  }

  final String authorId;

  Future<void> _getAuthor(
    AuthorDetailsEvent event,
    Emitter<AuthorDetailsState> emit,
  ) async {
    try {
      final AuthorDetailServerResponse? response =
          await OFFAPIManager().getAuthorById(authorId);
      emit(AuthorDetailsNotifierSuccessState(
          response!.response.generateAuthor()));
    } catch (e) {
      emit(AuthorDetailsNotifierErrorState(e));
    }
  }
}

sealed class AuthorDetailsState {}

class AuthorDetailsNotifierLoadingState extends AuthorDetailsState {}

class AuthorDetailsNotifierSuccessState extends AuthorDetailsState {
  final Author? author;

  AuthorDetailsNotifierSuccessState(this.author);
}

class AuthorDetailsNotifierErrorState extends AuthorDetailsState {
  final dynamic error;

  AuthorDetailsNotifierErrorState(this.error);
}
