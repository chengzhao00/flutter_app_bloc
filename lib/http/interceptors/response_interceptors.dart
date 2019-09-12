import 'dart:convert';

import 'package:dio/dio.dart';

import '../http_index.dart';

final bool isDebug = true;

///请求数据日志只有在debug模式下才会打印出来
///
class ResponseInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) {
    return options;
  }

  @override
  onResponse(Response response) {
    var data = response.data;
    if (data is String) {
      try {
        data = json.decode(data);
      } catch (e) {}
    }

    if(data is Map){
      int errorCode = data['errorCode'] ?? 0;
      String message = data['errorMsg'] ?? '请求失败[$errorCode]';
      if(errorCode == Api.ERROR_CODE){ // 未登录
        dio.clear();
        ///跳转登录页面
        ///没有登录页面后续实现
        return dio.reject(message);
      }else if(errorCode == 0){
        return response;
      }else {
        return dio .reject(message);
      }
    }
    return response;
  }

  @override
  onError(DioError err) {
    return err;
  }
}
