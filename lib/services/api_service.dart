import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/apis.dart';
import '../constants/strings.dart';

class APIService{
  final Dio _dio = Dio();

  APIService(){
    _dio.options.baseUrl = APIS.baseURL;
    _dio.options.queryParameters.addAll({'appid':Strings.appID});
    _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get dio=>_dio;
}