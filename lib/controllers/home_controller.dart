import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/repositories/weather_repo.dart';

class HomeController extends GetxController{
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxString _city = "".obs;
  final RxBool _atTop = false.obs;
  var  weather = WeatherModel().obs;


   RxBool getLoading() => _isLoading;
   RxDouble getLatitude() => _latitude;
   RxDouble getLongitude() => _longitude;
   RxString getCity() => _city;
   RxBool getScreenPos() => _atTop;

   setLoading(bool status){
     _isLoading.value = status;
   }

  setLatitude(double lat){
    _latitude.value = lat;
  }

  setLongitude(double lon){
    _longitude.value = lon;
  }

   @override
  void onInit() {
     if(_isLoading.isTrue){
       getLocation().then((value) async {
         getAddress(_latitude.value,_longitude.value);
         getWeatherData();
       });
     }

    super.onInit();
  }

  getWeatherData() async {
    var data = (await WeatherRepo().getWeatherForecast(_latitude.value,_longitude.value))!;
    weather.value = data;
    //weather = (await WeatherRepo().getWeatherForecastLocalData(_latitude.value,_longitude.value))!;
    _isLoading.value = false;
  }

  Future<Position> getLocation() async{
     bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
     if(!isLocationEnabled) {
       return Future.error("Location not enabled");
     }

     LocationPermission permission = await Geolocator.checkPermission();
     if(permission==LocationPermission.deniedForever) {
       return Future.error("Location not enabled");
     }else if(permission==LocationPermission.denied){
         permission = await Geolocator.requestPermission();
         if(permission==LocationPermission.denied){
           return Future.error("Location permission is denied");
         }
     }
     Position pos = await Geolocator.getCurrentPosition();
     _latitude.value = pos.latitude;
     _longitude.value = pos.longitude;
     return pos;
  }

  getAddress(double lat,double long) async {
     List<Placemark> placeMark = await placemarkFromCoordinates(lat, long);
     Placemark place = placeMark[0];
     _city.value = place.locality!;
  }
}