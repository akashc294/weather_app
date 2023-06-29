import '../constants/assets.dart';

getWeatherAsset(String condition){
  switch(condition){
    case "Thunderstorm":return Assets.thunderStorm;
    case "Drizzle":return Assets.drizzle;
    case "Rain":return Assets.rain;
    case "Snow":return Assets.snow;
    case "Atmosphere":return Assets.atmosphere;
    case "Clear":return Assets.clear;
    case "Clouds":return Assets.clouds;
    default:return "";
  }
}

getWeatherBackground(String condition){
  switch(condition){
    case "Thunderstorm":return Assets.bgThunder;
    case "Drizzle":return Assets.bgRain;
    case "Rain":return Assets.bgRain;
    case "Snow":return Assets.bgRain;
    case "Atmosphere":return Assets.bgMorning;
    case "Clear":return Assets.bgSunnyCloud;
    case "Clouds":return Assets.bgCloud;
    default:return Assets.bgSunnyCloud;
  }
}