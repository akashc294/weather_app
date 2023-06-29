import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/routes/routes.dart';
import 'package:weather_app/views/pages/full_screen_map.dart';
import 'package:weather_app/views/pages/historical_screen.dart';
import 'package:weather_app/views/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      home: HomeScreen(),
      title: "FarmSetuWeatherApp",
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      getPages: [
        GetPage(name: AppRoutes.home, page: () => HomeScreen()),
        GetPage(name: AppRoutes.map, page: () => FullScreenMap()),
        GetPage(name: AppRoutes.historical, page: () => HistoricalScreen()),
      ],
    );
  }
}

