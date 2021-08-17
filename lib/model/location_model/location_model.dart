class LocationModel{
  String? name;
  String? region;
  String? country;
  dynamic lat;
  dynamic lon;
  String? zone;
  String? localTime;

  LocationModel.fromJson(Map<String,dynamic>json){
    this.name = json['name'];
    this.region = json['region'];
    this.country = json['country'];
    this.lat = json['lat'];
    this.lon = json['lon'];
    this.zone = json['tz_id'];
    this.localTime = json['localtime'];
  }

}