import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:weather_app/constants/colors.dart';
import 'package:weather_app/controllers/home_controller.dart';
import 'package:weather_app/repositories/weather_repo.dart';
import 'package:weather_app/utils/high_width.dart';
import 'package:weather_app/utils/weather_assets.dart';
import 'package:weather_app/views/pages/components/home/home_map.dart';
import 'package:weather_app/views/widgets/custom_pop_up_button.dart';
import 'package:weather_app/views/widgets/custom_text.dart';
import '../../constants/assets.dart';
import '../../routes/routes.dart';
import 'components/home/daily_forecast.dart';
import 'components/home/home_top_view.dart';
import 'components/home/hourly_forecast.dart';
import 'components/home/other_details.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppThemeColors.white,
      body: Obx(() {
        return controller
            .getLoading()
            .value ?
         const Center(child:  Image(image: AssetImage(Assets.rainLogo),height: 100,)):
        Stack(
          children: [
            Image(
              key: Key("weather_image"),
              image: AssetImage(getWeatherBackground(
                  "${controller.weather.value.current?.weather?[0].main}")
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
            NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  SliverLayoutBuilder(
                    builder: (BuildContext context , constraints ) {
                      final scrolled = constraints.scrollOffset > 70;
                      return SliverAppBar(
                        backgroundColor: scrolled ? AppThemeColors.black.withOpacity(0.5) : AppThemeColors.transparent,
                        title: CustomText.text(controller
                            .getCity().value, size: 24, color: AppThemeColors.white),
                        pinned: true,
                      );
                    },

                  ),
                ];
              },
              body: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const SizedBox(height: 200,),
                      ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          HomeTopView(controller.weather.value),
                          const SizedBox(height: 20,),
                          HourlyWeatherForecast(controller.weather.value.hourly),
                          const Divider(height: 2,),
                          const SizedBox(height: 20,),
                          DailyForecast(controller.weather.value.daily),
                          GestureDetector(
                              key: Key("historic_button"),
                            onTap: (){
                              Get.toNamed(AppRoutes.historical,
                                  arguments: [controller.getLatitude().value,controller.getLongitude().value,controller.getCity().value]
                              );
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width*0.8,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    color: AppThemeColors.black,
                                    borderRadius: const BorderRadius.all(Radius.circular(20))
                                ),
                                child: CustomText.text("Show Historical Forecast",textAlign: TextAlign.center,weight: FontWeight.w500)),
                          ),
                          const SizedBox(height: 20,),
                          HomeMap(controller.weather.value),
                          const SizedBox(height: 20,),
                          OtherDetails(controller.weather.value.current),
                          const SizedBox(height: 20,),

                        ],
                      ),

                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
