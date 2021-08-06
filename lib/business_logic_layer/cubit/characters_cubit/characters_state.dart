import 'package:breaking_bad/data_layer/models/characters_model/character_model.dart';

abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersError extends CharactersState {

}

class CharactersLoaded extends CharactersState {
  final List<Character> characters;
  CharactersLoaded({
    required this.characters,
  });
}
