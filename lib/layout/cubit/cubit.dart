import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/layout/cubit/states.dart';
import 'package:weather_app/model/weather_model/watherModel.dart';
import 'package:weather_app/shared/constants/constants.dart';
import 'package:weather_app/shared/network/end_points.dart';
import 'package:weather_app/shared/network/remote/dio_helper.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitialState());

  WeatherModel? weatherModel;

  static WeatherCubit get(context) => BlocProvider.of(context);


  void getWeatherData(){
    emit(WeatherLoadingDataState());
    DioHelper.getData(
        url: foreCast,
        query: {
          'key':apiKey,
          'q':baseLocation,
        },
    ).then((value) {
      weatherModel = WeatherModel.fromJson(value.data);
      emit(WeatherSuccessDataState());
    }).catchError((error){
      print(error.toString());
      emit(WeatherErrorDataState());
    });
  }

}
