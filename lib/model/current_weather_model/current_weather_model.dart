class CurrentWeatherModel{
  String? lastTimeUpdated;
  dynamic temperatureCelsius;
  dynamic temperatureFahrenheit;
  int? isDay;
  CurrentWeatherCondition? currentWeatherCondition;
  dynamic windMph;
  dynamic windKph;
  dynamic windDegree;
  String? windDirection;
  dynamic pressureMb;
  dynamic pressureIn;
  dynamic feelsLikeC;

  CurrentWeatherModel.fromJson(Map<String,dynamic> json){
    this.lastTimeUpdated = json['last_updated'];
    this.temperatureCelsius = json['temp_c'];
    this.temperatureFahrenheit = json['temp_f'];
    this.isDay = json['is_day'];
    this.currentWeatherCondition = CurrentWeatherCondition.fromJson(json['condition']);
    this.windMph = json['wind_mph'];
    this.windKph = json['wind_kph'];
    this.windDegree = json['wind_degree'];
    this.windDirection = json['wind_dir'];
    this.pressureMb = json['pressure_mb'];
    this.pressureIn = json['pressure_in'];
    this.feelsLikeC = json['feelslike_c'];
  }

}

class CurrentWeatherCondition{
  String? text;
  String? image;

  CurrentWeatherCondition.fromJson(Map<String,dynamic> json){
    this.text = json['text'];
    this.image = json['icon'];
  }
}