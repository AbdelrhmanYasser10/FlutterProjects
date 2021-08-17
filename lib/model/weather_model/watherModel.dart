import 'package:weather_app/model/current_weather_model/current_weather_model.dart';
import 'package:weather_app/model/forecast_model/forecast_model.dart';
import 'package:weather_app/model/location_model/location_model.dart';

class WeatherModel{

  LocationModel? locationModel;
  CurrentWeatherModel? currentWeatherModel;
  ForecastModel? forecastModel;

  WeatherModel.fromJson(Map<String,dynamic> json){
    this.locationModel = LocationModel.fromJson(json['location']);
    this.currentWeatherModel = CurrentWeatherModel.fromJson(json['current']);
    this.forecastModel = ForecastModel.fromJson(json['forecast']);
  }
}