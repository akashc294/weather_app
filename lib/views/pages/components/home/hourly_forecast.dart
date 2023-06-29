import 'package:flutter/cupertino.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/utils/high_width.dart';

import '../../../../utils/convertors.dart';
import '../../../../utils/weather_assets.dart';
import '../../../widgets/custom_text.dart';

class HourlyWeatherForecast extends StatelessWidget {
  List<Hourly>? hourly;
  HourlyWeatherForecast(this.hourly,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context)*0.7,
      height: 100,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: hourly?.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: AppThemeColors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(16.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText.text(milliToHourly(hourly?[index].dt),size: 14),
              const SizedBox(height: 8,),
              Image(image: AssetImage(getWeatherAsset("${hourly?[index].weather?[0].main}")),height: 20,),
              const SizedBox(height: 8,),
              CustomText.text("${tempToInt(hourly?[index].temp)}°C",size: 14),
            ],
          ),
        );
      }),
    );
  }
}
