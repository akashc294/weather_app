class Historical {
  double? lat;
  double? lon;
  String? timezone;
  int? timezoneOffset;
  List<Data>? data;

  Historical(
      {this.lat, this.lon, this.timezone, this.timezoneOffset, this.data});

  Historical.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['timezone'] = this.timezone;
    data['timezone_offset'] = this.timezoneOffset;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? dt;
  int? sunrise;
  int? sunset;
  double? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  int? clouds;
  double? windSpeed;
  int? windDeg;
  List<Weather>? weather;

  Data(
      {this.dt,
        this.sunrise,
        this.sunset,
        this.temp,
        this.feelsLike,
        this.pressure,
        this.humidity,
        this.dewPoint,
        this.clouds,
        this.windSpeed,
        this.windDeg,
        this.weather});

  Data.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = (json['temp']??0.0)+0.0;
    feelsLike = (json['feels_like']??0.0)+0.0;
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = (json['dew_point']??0.0)+0.0;
    clouds = json['clouds'];
    windSpeed = json['wind_speed'];
    windDeg = json['wind_deg'];
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(new Weather.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['temp'] = this.temp;
    data['feels_like'] = this.feelsLike;
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    data['dew_point'] = this.dewPoint;
    data['clouds'] = this.clouds;
    data['wind_speed'] = this.windSpeed;
    data['wind_deg'] = this.windDeg;
    if (this.weather != null) {
      data['weather'] = this.weather!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}