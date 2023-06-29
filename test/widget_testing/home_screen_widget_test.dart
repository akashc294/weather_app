import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/constants/apis.dart';
import 'package:weather_app/constants/assets.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/utils/convertors.dart';
import 'package:weather_app/views/pages/components/home/daily_forecast.dart';
import 'package:weather_app/views/pages/components/home/home_top_view.dart';
import 'package:weather_app/views/pages/components/home/hourly_forecast.dart';
import 'package:weather_app/views/widgets/custom_weather_map.dart';


void main(){
  testWidgets("Home Top View Testing", (WidgetTester tester)async{
    //final customText = find.byType(Text);
    WeatherModel weather = WeatherModel(current: Current(temp: 34, weather: [Weather(main: "Clouds")]));
    await tester.pumpWidget(MaterialApp(home: HomeTopView(weather)));
    await tester.pump();
    expect(find.text("Clouds"), findsOneWidget);
    expect(find.text("34"), findsOneWidget);
  });

  testWidgets("Hourly Widget Testing", (WidgetTester tester)async{
    List<Hourly> hourly = [Hourly(temp:36,weather: [Weather(main: "Rain")])];
    await tester.pumpWidget(MaterialApp(home: HourlyWeatherForecast(hourly)));
    await tester.pump();
    expect(find.text("36°C"), findsOneWidget);
    expect(find.image(AssetImage(Assets.rain)), findsOneWidget);
  });

  testWidgets("Daily Widget Testing", (WidgetTester tester)async{
    List<Daily> daily = [Daily(dt:1687891188,temp:Temp(min: 27,max: 38),weather: [Weather(main: "Rain")])];
    await tester.pumpWidget(MaterialApp(home: DailyForecast(daily)));
    await tester.pump();
    expect(find.text(milliToWeek(1687891188)), findsOneWidget);
    expect(find.text("38°C / 27°C"), findsOneWidget);
    expect(find.image(AssetImage(Assets.rain)), findsOneWidget);
  });

  testWidgets("Map Testing", (WidgetTester tester)async{
    await tester.pumpWidget(MaterialApp(home: WeatherMap().map(10.0,10.0,"temp_new",false)));
    await tester.pump();
    expect(find.byKey(ValueKey("openweathermap")), findsWidgets);
    expect(find.byKey(ValueKey("openstreetmap")), findsWidgets);
    expect(find.byKey(ValueKey("marker_layer")), findsWidgets);
  });

}