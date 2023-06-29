import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:weather_app/constants/colors.dart';

void errorMessage(DioError e) {
  String error = "";
  if(e.type == DioErrorType.response){
    final response = e.response;
    if(response!=null) {
      error =  response.data['message'];
    } else {
      error = "Please check your internet connection.";
    }
  }else{
    error = "Something went wrong. Please try again later";
  }
  Get.snackbar("Error",error,
      snackPosition: SnackPosition.BOTTOM,
      colorText: AppThemeColors.error);
}
