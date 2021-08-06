import 'package:breaking_bad/data_layer/models/characters_model/character_model.dart';
import 'package:breaking_bad/presentation_layer/shared/constants/constants.dart';
import 'package:dio/dio.dart';

class CharacterWebServices {
   late Dio dio;
  CharacterWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 60 * 10000, //60 sec
      receiveTimeout: 60 * 10000, //60 sec
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async =>
    await dio.get('characters').then((value){
      print(value.data.toString());
      return value.data;
    }).catchError((error){
      print(error.toString());
    });
}