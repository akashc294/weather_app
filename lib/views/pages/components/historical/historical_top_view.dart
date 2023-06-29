import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_model.dart';

import '../../../../models/history_model.dart';
import '../../../../utils/convertors.dart';
import '../../../widgets/custom_text.dart';

class HistoricalTopView extends StatelessWidget {
  Data data;
  HistoricalTopView(this.data,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomText.text("${tempToInt(data.temp)}",size: 100),
            const SizedBox(width: 16,),
            SizedBox(
              height: 65,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.text("°C",size: 20),
                  CustomText.text("${data.weather?[0].main}",size: 20),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CustomText.text("${milliToDate(data.dt)} ${tempToInt(data.temp)}°C / ${tempToInt(data.feelsLike)}°C", size: 14,weight: FontWeight.w500),
        ),
      ],
    );
  }
}
