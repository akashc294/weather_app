import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/services/api_service.dart';

import '../constants/apis.dart';
import '../errors/error_message.dart';
import '../models/history_model.dart';
import '../models/weather_model.dart';

class WeatherRepo{
  APIService apiService = APIService();

  Future<String> getName() async {
    await Future.delayed(Duration(seconds: 1));
    return "Akash";
  }

  Future<WeatherModel?> getWeatherForecast(double lat,double long)async{
    WeatherModel? weather;
    try {
      Response response = await apiService.dio.get(
        APIS.currentWeather,
        queryParameters: {'lat':lat,'lon':long,'units':'metric','exclude':'minutely'}
      );
      weather=WeatherModel.fromJson(response.data);
    } on DioError catch (exception){
      errorMessage(exception);
    }
    return weather;
  }
  Future<Historical?> getHistoricalForecast(double lat,double long,int dt)async{
    Historical? historical;
    try {
      Response response = await apiService.dio.get(
          APIS.historicalData,
          queryParameters: {'lat':lat,'lon':long,'dt':dt,'units':'metric'}
      );
      historical=Historical.fromJson(response.data);
    } on DioError catch (exception){
      errorMessage(exception);
    }
    return historical;
  }

  Future<WeatherModel?> getWeatherForecastLocalData(double lat,double long)async{
    WeatherModel? weather;
    try {
      final String response = await rootBundle.loadString('assets/data.json');
      weather = WeatherModel.fromJson(jsonDecode(response));
      log(weather.current.toString());
    } on DioError catch (exception){
      errorMessage(exception);
    }
    return weather;
  }

  Future<WeatherModel?> getHistoricalLocalData(double lat,double long)async{
    WeatherModel? weather;
    try {
      final String response = await rootBundle.loadString('assets/data/history.json');
      weather = WeatherModel.fromJson(jsonDecode(response));
      log(weather.current.toString());
    } on DioError catch (exception){
      errorMessage(exception);
    }
    return weather;
  }
}