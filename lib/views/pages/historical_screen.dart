import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:weather_app/controllers/historical_controller.dart';

import '../../constants/colors.dart';
import '../../utils/weather_assets.dart';
import '../widgets/custom_text.dart';
import 'components/historical/historical_other_view.dart';
import 'components/historical/historical_top_view.dart';

class HistoricalScreen extends StatelessWidget {
  HistoricalScreen({Key? key}) : super(key: key);

  final HistoricalController controller = Get.put(HistoricalController());
  var items = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: CustomText.text(items[2], size: 24, color: AppThemeColors.white),
        backgroundColor: AppThemeColors.transparent,
        elevation: 0,
      ),
      body: Obx(() {
        return controller
            .getLoading()
            .value ?
        const Center(child: CircularProgressIndicator()):
        Stack(
          children: [
            Image(
              image: AssetImage(getWeatherBackground(
                  "${controller.historical.value.data?[0].weather?[0].main}")
              ),
              fit: BoxFit.cover,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
            ),
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: CustomText.text(controller.getTime().toString(),size: 18)),
                        IconButton(onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(), //get today's date
                              firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101)
                          );

                          controller.setTime(pickedDate.toString());


                        }, icon: Icon(Icons.edit,color: AppThemeColors.white,size: 20,)),
                      ],
                    ),
                    const SizedBox(height: 100,),
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        HistoricalTopView(controller.historical.value.data![0]),
                        const SizedBox(height: 20,),
                        HistoricalOtherDetails(controller.historical.value.data![0]),
                        const SizedBox(height: 20,),
                      ],
                    ),

                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
