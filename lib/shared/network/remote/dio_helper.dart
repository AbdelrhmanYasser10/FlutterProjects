import 'package:dio/dio.dart';
import 'package:weather_app/shared/constants/constants.dart';

class DioHelper{

  static Dio dio= Dio(BaseOptions(
    baseUrl:baseUrl,
    receiveDataWhenStatusError: true,
  ));


  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String token = "",
  }) async {
    return await dio.get(
        url,
        queryParameters: query
    );
  }

}