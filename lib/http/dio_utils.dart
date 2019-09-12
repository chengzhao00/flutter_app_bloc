

import 'package:dio/dio.dart';

import 'interceptors/response_interceptors.dart';

Dio _dio = Dio();

Dio get dio => _dio;

class DioUtils{

  static init(){
    dio.options.receiveTimeout = 5 * 1000;
    dio.options.connectTimeout = 5* 1000;
    dio.options.sendTimeout = 5 * 1000;
    dio.interceptors.add(LogInterceptor());
    dio.interceptors.add(ResponseInterceptor());
  }


}