import 'package:weather_app/constants/strings.dart';

class APIS{
  static String baseURL = "https://api.openweathermap.org/data/3.0/onecall";
  static String baseMapURL = "https://tile.openstreetmap.org/{z}/{x}/{y}.png";
  static String baseWeatherURL = "https://{s}.tile.openweathermap.org/map/{layername}/{z}/{x}/{y}.png?appid=${Strings.appID}";
  static String currentWeather = "";
  static String historicalData = "/timemachine";
}