import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:weather_app/constants/apis.dart';
import 'package:weather_app/models/history_model.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/api_service.dart';

void main() {
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);

  setUp(() {
    dio.httpClientAdapter = dioAdapter;
  });

  group('APIService class methods test', () {
    group('WeatherForecast', () {
      test('WeatherForecast Success Test', () async {

        dioAdapter.onGet(
              '',
              queryParameters: {'lat':27.1767,'lon':78.0081,'units':'metric'},
              (request) {
            return request.reply(200, WeatherModel(lat:27.1767,lon:78.0081,current: Current(temp: 36.38,feelsLike: 40.69,pressure: 998,humidity: 43)));
          },
          data: null,
          headers: {},
        );

        final service = APIService();
        final fakeResponse = await dioAdapter.dio.get('',queryParameters: {'lat':27.1767,'lon':78.0081,'units':'metric'});

        final realResponse = await service.dio.get('',queryParameters: {'lat':27.1767,'lon':78.0081,'units':'metric'});

        expect(WeatherModel.fromJson(fakeResponse.data).current?.temp,WeatherModel.fromJson(realResponse.data).current?.temp);
      });

      test('WeatherForecast Fail Test', () async {

        dioAdapter.onGet(
          '',
          queryParameters: {'lat':27.1767,'lon':78.0081,'units':'metric'},
              (request) {
            return request.reply(200, WeatherModel(lat:27.1767,lon:78.0081,current: Current(temp: 36.21,feelsLike: 40.69,pressure: 998,humidity: 43)));
          },
          data: null,
          headers: {},
        );

        final service = APIService();
        final fakeResponse = await dioAdapter.dio.get('',queryParameters: {'lat':27.1767,'lon':78.0081,'units':'metric'});

        final realResponse = await service.dio.get('',queryParameters: {'lat':27.1767,'lon':78.0081,'units':'metric'});

        expect(WeatherModel.fromJson(fakeResponse.data).current?.temp,WeatherModel.fromJson(realResponse.data).current?.temp);
      });
    });

    group('Historical', () {
      test('Historical Success Test', () async {

        dioAdapter.onGet(
            APIS.historicalData,
          queryParameters: {'lat':27.1767,'lon':78.0081,'dt':1586468027,'units':'metric'},
              (request) {
            return request.reply(200, Historical(lat:27.1767,lon:78.0081,data: [Data(temp: 19.74,feelsLike: 40.69,pressure: 998,humidity: 43)]));
          },
          data: null,
          headers: {},
        );

        final service = APIService();
        final fakeResponse = await dioAdapter.dio.get(APIS.historicalData,queryParameters: {'lat':27.1767,'lon':78.0081,'units':'metric','dt':1586468027});

        final realResponse = await service.dio.get(APIS.historicalData,queryParameters: {'lat':27.1767,'lon':78.0081,'units':'metric','dt':1586468027});

        expect(Historical.fromJson(fakeResponse.data).data![0].temp,Historical.fromJson(realResponse.data).data![0].temp);
      });

      test('Historical Fail Test', () async {

        dioAdapter.onGet(
          APIS.historicalData,
          queryParameters: {'lat':27.1767,'lon':78.0081,'dt':1586468027,'units':'metric'},
              (request) {
            return request.reply(200, Historical(lat:27.1767,lon:78.0081,data: [Data(temp: 20.74,feelsLike: 40.69,pressure: 998,humidity: 43)]));
          },
          data: null,
          headers: {},
        );

        final service = APIService();
        final fakeResponse = await dioAdapter.dio.get(APIS.historicalData,queryParameters: {'lat':27.1767,'lon':78.0081,'units':'metric','dt':1586468027});

        final realResponse = await service.dio.get(APIS.historicalData,queryParameters: {'lat':27.1767,'lon':78.0081,'units':'metric','dt':1586468027});

        expect(Historical.fromJson(fakeResponse.data).data![0].temp,Historical.fromJson(realResponse.data).data![0].temp);
      });
    });
  });
}