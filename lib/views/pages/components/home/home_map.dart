import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:weather_app/routes/routes.dart';
import 'package:weather_app/views/pages/full_screen_map.dart';

import '../../../../constants/colors.dart';
import '../../../../models/weather_model.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_weather_map.dart';

class HomeMap extends StatelessWidget {
  WeatherModel weather;
  HomeMap(this.weather,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 200,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Stack(
                  children: [
                    WeatherMap().map(weather.lat,weather.lon,"precipitation_new",false),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                          margin:const EdgeInsets.all(8.0),
                          padding:const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: AppThemeColors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: CustomText.text("Precipitation Map")
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        key: Key("pre_button"),
                        onPressed: (){
                        Get.toNamed(AppRoutes.map,
                            arguments: [weather, "Precipitation", "precipitation_new"]
                        );
                      },icon: const Icon(Icons.fullscreen),color: AppThemeColors.black,),
                    ),
                  ],
                ))
        ),
        const SizedBox(height: 20,),
        SizedBox(
            height: 200,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Stack(
                  children: [
                    WeatherMap().map(weather.lat,weather.lon,"temp_new",false),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: AppThemeColors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: CustomText.text("Temperature Map",size: 14)
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        key: Key("temp_button"),
                        onPressed: (){
                        Get.toNamed(AppRoutes.map,
                            arguments: [weather, "Temperature", "temp_new"]
                        );
                      },icon: const Icon(Icons.fullscreen),color: AppThemeColors.black,),
                    ),
                  ],
                ))
        ),
      ],
    );
  }
}
