import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/controllers/home_controller.dart';


@GenerateMocks([Dio])
void main(){
  late HomeController myController;
  setUp(() async {
    myController = HomeController();
  });
  tearDown((){

  });
  group('Home Controller Test', () {
    test('Initial value of longitude should be 0', () {
      expect(myController.getLongitude().value, 0);
    });

    test('Setting longitude must set the value', () {
      myController.setLongitude(20.0);
      expect(myController.getLongitude().value, 20.0);
    });

    test('Setting latitude must set the value', () {
      myController.setLatitude(10.5);
      expect(myController.getLatitude().value, 10.5);
    });
  });
}