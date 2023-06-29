import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/views/widgets/custom_text.dart';
import 'package:weather_app/views/widgets/custom_weather_map.dart';

import '../../models/weather_model.dart';

class FullScreenMap extends StatelessWidget {
  FullScreenMap({Key? key}) : super(key: key);
  var items = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemeColors.black.withOpacity(0.4),
        elevation: 0,
        title: CustomText.text(items[1]!,color: AppThemeColors.white,size: 24,weight: FontWeight.w500),
        leading: IconButton(
            onPressed: (){Get.back();},
            icon: Icon(Icons.arrow_back,
            color: AppThemeColors.white,),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: WeatherMap().map(items[0].lat,items[0].lon,items[2],true),
    );
  }
}
