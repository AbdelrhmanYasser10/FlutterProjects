import 'package:breaking_bad/data_layer/models/characters_model/character_model.dart';
import 'package:breaking_bad/data_layer/web_server/characters_web_services/characters_web_servcies.dart';

class CharactersRepository{

  late CharacterWebServices characterWebServices;

  CharactersRepository({
    required this.characterWebServices,
});

  Future<List<Character>> getAllCharacters() async{
    final characters = await characterWebServices.getAllCharacters();

    return characters.map((character) => Character.fromJson(character)).toList();
  }
}