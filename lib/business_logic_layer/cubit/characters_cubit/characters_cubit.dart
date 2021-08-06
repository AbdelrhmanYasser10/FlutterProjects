import 'package:bloc/bloc.dart';
import 'package:breaking_bad/data_layer/models/characters_model/character_model.dart';
import 'package:breaking_bad/data_layer/repository/characters_repository/characters_repository.dart';
import 'characters_state.dart';


class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(
      this.charactersRepository,
      ) : super(CharactersInitial());

  CharactersRepository charactersRepository;
  List<Character> characters = [];

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      this.characters = characters;
      print(this.characters);
      emit(CharactersLoaded(characters:characters));
    });

    return characters;
  }
}
