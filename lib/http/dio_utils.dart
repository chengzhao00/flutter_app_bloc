

import 'package:dio/dio.dart';

import 'http_index.dart';
import 'interceptors/logger_interceptors.dart';
import 'interceptors/response_interceptors.dart';

Dio _dio = Dio();

Dio get dio => _dio;

class DioUtils{

  static init(){
    dio.options.receiveTimeout = 5 * 1000;
    dio.options.connectTimeout = 5* 1000;
    dio.options.sendTimeout = 5 * 1000;
    dio.options.baseUrl = Api.BASE_API;
    dio.interceptors.add(LoggerInterceptors(isDebug:true));
    dio.interceptors.add(ResponseInterceptor());
  }


  static String parseError(error, {String defErrorString = '网络连接超时或者服务器未响应'}) {
    String errStr;
    if (error is DioError) {
      if (error.type == DioErrorType.CONNECT_TIMEOUT ||
          error.type == DioErrorType.SEND_TIMEOUT ||
          error.type == DioErrorType.RECEIVE_TIMEOUT) {
        errStr = defErrorString;
      } else {
        errStr = error.message;
      }
    }
    return errStr ?? defErrorString;
  }


}