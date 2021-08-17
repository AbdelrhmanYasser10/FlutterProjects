class ForecastModel{
  List<ForecastDay> data = [];

  ForecastModel.fromJson(Map<String,dynamic> json){
    json['forecastday'].forEach((element){
      data.add(ForecastDay.fromJson(element));
    });
  }
}

class ForecastDay{
  String? date;
  ForecastDayData? forecastDayData;
  ForecastDayAstro? forecastDayAstro;
  List<ForecastDayHour> hours = [];

  ForecastDay.fromJson(Map<String,dynamic> json){
    this.date = json['date'];
    this.forecastDayData = ForecastDayData.fromJson(json['day']);
    this.forecastDayAstro = ForecastDayAstro.fromJson(json['astro']);
    json['hour'].forEach((element){
      hours.add(ForecastDayHour.fromJson(element));
    });
  }

}

class ForecastDayData{
  dynamic maxTempC;  //max temperature in Celsius
  dynamic maxTempF;  //max temperature in Fahrenheit
  dynamic minTempC;
  dynamic minTempF;
  dynamic averageTempC;
  dynamic averageTempF;
  ForecastDayDataCondition? forecastDayDataCondition;
  dynamic maxWindMph;
  dynamic maxWindKph;
  dynamic avgHumidity;
  int? willItRain;
  int? willItSnow;
  dynamic uv;

  ForecastDayData.fromJson(Map<String,dynamic>json){
    this.maxTempC = json['maxtemp_c'];
    this.maxTempF = json['maxtemp_f'];
    this.minTempC = json['mintemp_c'];
    this.minTempF = json['mintemp_f'];
    this.averageTempC = json['avgtemp_c'];
    this.averageTempF = json['avgtemp_f'];
    this.forecastDayDataCondition = ForecastDayDataCondition.fromJson(json['condition']);
    this.maxWindMph = json['maxwind_mph'];
    this.maxWindKph = json['maxwind_kph'];
    this.willItRain = json['daily_will_it_rain'];
    this.willItSnow = json['daily_will_it_snow'];
    this.avgHumidity = json['avghumidity'];
    this.uv = json['uv'];
  }
}

class ForecastDayDataCondition{
  String? text;
  String? image;
  ForecastDayDataCondition.fromJson(Map<String,dynamic>json){
    this.text = json['text'];
    this.image = json['icon'];
  }
}

class ForecastDayAstro{
  String? sunRise;
  String? sunSet;
  String?moonRise;
  String? moonSet;
  String? moonPhase;
  String? moonIllumination;

  ForecastDayAstro.fromJson(Map<String,dynamic>json){
    this.sunRise = json['sunrise'];
    this.sunSet = json['sunset'];
    this.moonRise = json['moonrise'];
    this.moonSet = json['moonset'];
    this.moonPhase = json['moon_phase'];
    this.moonIllumination = json['moon_illumination'];
  }
}

class ForecastDayHour{
  String? time;
  dynamic timeEpoch;
  dynamic tempC;
  dynamic tempF;
  int? isDay;
  ForecastDayHourCondition? forecastDayHourCondition;
  dynamic windMph;
  dynamic windKph;
  dynamic windDegree;
  String? windDirection;
  dynamic pressureMb;
  dynamic pressureIn;
  dynamic humidity;
  int? cloud;
  int? willItRain;
  int? willItSnow;
  dynamic uv;

  ForecastDayHour.fromJson(Map<String,dynamic>json){
    this.time = json['time'];
    this.timeEpoch = json['time_epoch'];
    this.tempC = json['temp_c'];
    this.tempF = json['temp_f'];
    this.isDay = json['is_day'];
    this.forecastDayHourCondition = ForecastDayHourCondition.fromJson(json['condition']);
    this.windMph = json['wind_mph'];
    this.windKph = json['wind_kph'];
    this.windDegree = json['wind_degree'];
    this.windDirection = json['wind_dir'];
    this.pressureMb = json['pressure_mb'];
    this.pressureIn = json['pressure_in'];
    this.humidity = json['humidity'];
    this.cloud = json['cloud'];
    this.willItRain = json['will_it_rain'];
    this.willItSnow = json['will_it_snow'];
    this.uv = json['uv'];
  }
}

class ForecastDayHourCondition{
  String? text;
  String? image;

  ForecastDayHourCondition.fromJson(Map<String,dynamic>json){
    this.text = json['text'];
    this.image = json['icon'];
  }

}

