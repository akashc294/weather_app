import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_model.dart';

import '../../../../utils/convertors.dart';
import '../../../widgets/custom_text.dart';

class HomeTopView extends StatelessWidget {
  WeatherModel weather;
  HomeTopView(this.weather,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomText.text("${tempToInt(weather.current?.temp)}",size: 100),
            const SizedBox(width: 16,),
            SizedBox(
              height: 65,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.text("°C",size: 20),
                  CustomText.text("${weather.current?.weather?[0].main}",size: 20),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CustomText.text("${milliToDate(weather.current?.dt)} ${tempToInt(weather.daily?[0].temp?.max)}°C / ${tempToInt(weather.daily?[0].temp?.min)}°C", size: 14,weight: FontWeight.w500),
        ),
      ],
    );
  }
}
