


import 'package:dio/dio.dart';

class LoggerInterceptors extends InterceptorsWrapper{
  final bool isDebug;


  LoggerInterceptors({ this.isDebug = false});

  @override
  onRequest(RequestOptions options) {
    if(isDebug){
      print("---------------start request----------");
      print('uri==${options.uri.toString()}');
      print('method == ${options.method}');
      print('headers:${options.headers.toString()}');
      print('body:${options.data?.toString()}');
      print('--------------end request------------');
    }
    return options;
  }


  @override
  onResponse(Response response) {
    if(isDebug){
      print('------------start response----------');
      print('status ${response.statusCode}');
      print('response === ${response.toString()}');
      print('------------end response----------');

    }
    return response;
  }

  @override
  onError(DioError err) {
    if(isDebug){
      print('------------start error----------');
      print('请求异常 ${err.toString()}');
      print('请求异常信息 === ${err.response?.toString()}');
      print('------------end error----------');
    }
    return err;
  }

}