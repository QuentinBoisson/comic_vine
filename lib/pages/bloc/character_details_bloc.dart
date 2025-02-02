import 'package:comic_vine/api/models/Character/character_api.dart';
import 'package:comic_vine/api/off_api.dart';
import 'package:comic_vine/models/character.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CharacterDetailsEvent {}

class LoadCharacterDetailsEvent extends CharacterDetailsEvent {
  LoadCharacterDetailsEvent();
}

class CharacterDetailsBloc
    extends Bloc<CharacterDetailsEvent, CharacterDetailsState> {
  CharacterDetailsBloc(this.characterId)
      : assert(characterId.isNotEmpty),
        super(CharacterDetailsNotifierLoadingState()) {
    on<LoadCharacterDetailsEvent>(_getCharacterDetails);
    add(LoadCharacterDetailsEvent());
  }

  final String characterId;

  Future<void> _getCharacterDetails(
    CharacterDetailsEvent event,
    Emitter<CharacterDetailsState> emit,
  ) async {
    try {
      final CharacterDetailServerResponse? response =
          await OFFAPIManager().getCharacterById(characterId);
      emit(CharacterDetailsNotifierSuccessState(
          response!.response.generateCharacter()));
    } catch (e) {
      emit(CharacterDetailsNotifierErrorState(e));
    }
  }
}

sealed class CharacterDetailsState {}

class CharacterDetailsNotifierLoadingState extends CharacterDetailsState {}

class CharacterDetailsNotifierSuccessState extends CharacterDetailsState {
  final Character? character;

  CharacterDetailsNotifierSuccessState(this.character);
}

class CharacterDetailsNotifierErrorState extends CharacterDetailsState {
  final dynamic error;

  CharacterDetailsNotifierErrorState(this.error);
}
