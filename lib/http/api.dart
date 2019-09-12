

import 'http_index.dart';

class Api{

  static const BASE_API = 'https://www.wanandroid.com';

  static const ERROR_CODE = -1001;

}

class ProjectApi{
  static String banner = '/banner/json';


  static Future<Response> getBanners() async{
    return dio.get(banner);
  }
}