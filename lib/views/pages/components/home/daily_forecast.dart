import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/utils/convertors.dart';
import 'package:weather_app/utils/high_width.dart';
import 'package:weather_app/utils/weather_assets.dart';
import 'package:weather_app/views/pages/historical_screen.dart';

import '../../../../models/weather_model.dart';
import '../../../../routes/routes.dart';
import '../../../widgets/custom_text.dart';

class DailyForecast extends StatelessWidget {
  List<Daily> ?daily;
  DailyForecast(this.daily,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: AppThemeColors.black.withOpacity(0.4)
          ),
          child: ListView.builder(
              itemCount: daily?.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context,index){
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.text(milliToWeek(daily?[index].dt),size: 16,weight: FontWeight.w500),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(image: AssetImage(getWeatherAsset("${daily?[index].weather?[0].main}")),height: 20,),
                          const SizedBox(width: 8,),
                          SizedBox(
                              width: 50,
                              child: CustomText.text("${daily?[index].weather?[0].main}",size: 16,weight: FontWeight.w500)),
                          const SizedBox(width: 16,),
                          CustomText.text("${tempToInt(daily?[index].temp?.max)}°C / ${tempToInt(daily?[index].temp?.min)}°C", size: 14,weight: FontWeight.w500),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ),
        const SizedBox(height: 16,),
        
      ],
    );
  }
}
