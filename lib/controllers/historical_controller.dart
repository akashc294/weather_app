import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/history_model.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/repositories/weather_repo.dart';
import 'package:weather_app/utils/convertors.dart';

class HistoricalController extends GetxController{
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxString _city = "".obs;
  final RxString _time = "".obs;
  var  historical = Historical().obs;

  RxBool getLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;
  RxString getCity() => _city;
  RxString getTime() => _time;

  setTime(String time) async {
    _time.value = milliToDate(DateFormat("yyyy-MM-dd").parse(time).toUtc().millisecondsSinceEpoch ~/ 1000) ;
    var data = (await WeatherRepo().getHistoricalForecast(_latitude.value,_longitude.value,DateFormat("yyyy-MM-dd").parse(time).toUtc().millisecondsSinceEpoch ~/ 1000))!;
    historical.value = data;
  }


  @override
  Future<void> onInit() async {
    _time.value = milliToDate(DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000);
    if(_isLoading.isTrue){
      var items = Get.arguments;
      _latitude.value = items[0];
      _longitude.value = items[1];
      var data = (await WeatherRepo().getHistoricalForecast(_latitude.value,_longitude.value,DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000))!;
      historical.value = data;
      //weather = (await WeatherRepo().getWeatherForecastLocalData(_latitude.value,_longitude.value))!;
      _isLoading.value = false;
    }
    super.onInit();
  }

}