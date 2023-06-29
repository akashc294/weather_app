import 'package:flutter/cupertino.dart';
import 'package:weather_app/utils/convertors.dart';
import 'package:weather_app/views/widgets/custom_text.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../models/history_model.dart';
import '../../../../models/weather_model.dart';
import '../../../widgets/custom_detail_card.dart';

class HistoricalOtherDetails extends StatelessWidget {
  Data data;
  HistoricalOtherDetails(this.data,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: AppThemeColors.black.withOpacity(0.4)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.text("Other Details",size: 18),
          const SizedBox(height: 18,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DetailCard(Assets.temperature,"Real Feel","${tempToInt(data.feelsLike)}°C"),
              DetailCard(Assets.wind,"Wind","${tempToInt(data.windSpeed)}°km/h"),
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DetailCard(Assets.dew,"Dew Point","${tempToInt(data.dewPoint)}°"),
              DetailCard(Assets.pressure,"Pressure","${tempToInt(data.pressure?.toDouble())} mb"),
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            children: [
              DetailCard(Assets.humidity,"Humidity","${tempToInt(data.humidity?.toDouble())}°%"),
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Image(image: AssetImage(Assets.sunrise),height: 20,),
                      const SizedBox(width: 6,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText.text("Sunrise",size: 16),
                          const SizedBox(height: 2,),
                          CustomText.text(milliToHourly(data.sunrise), size: 14,weight: FontWeight.w500),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Center(
                child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: AppThemeColors.grey.withOpacity(0.4)
                    ),
                    child: const Image(image: AssetImage(Assets.clear),height: 80,)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Image(image: AssetImage(Assets.sunset),height: 20,),
                      const SizedBox(width: 6,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText.text("Sunset",size: 16),
                          const SizedBox(height: 2,),
                          CustomText.text(milliToHourly(data.sunset), size: 14,weight: FontWeight.w500),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}
