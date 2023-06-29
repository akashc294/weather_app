import 'package:flutter/cupertino.dart';
import 'package:weather_app/utils/high_width.dart';

import '../../constants/assets.dart';
import '../../constants/colors.dart';
import '../../utils/convertors.dart';
import 'custom_text.dart';

class DetailCard extends StatelessWidget {
  String asset;
  String header;
  String subTitle;
  DetailCard(this.asset,this.header,this.subTitle,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context)*0.4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppThemeColors.grey.withOpacity(0.4)
              ),
              child: Image(image: AssetImage(asset),height: 30,)),
          const SizedBox(width: 16,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.text(header,size: 16),
              const SizedBox(height: 2,),
              CustomText.text(subTitle, size: 14,weight: FontWeight.w500),
            ],
          ),
        ],
      ),
    );
  }
}
