


import 'package:flutter_app_bloc/model/base_entity.dart';
import 'package:flutter_app_bloc/model/base_list_entity.dart';
import 'package:flutter_app_bloc/model/home/home_entity.dart';
import 'package:flutter_app_bloc/model/home/home_project_entity.dart';

import '../http_index.dart';

class HomeRepository{


    Future<List<BannerEntity>> getBanner() async {
      Response response = await dio.get(Api.BANNER);
      BaseEntity<List> baseEntity = BaseEntity.fromJson(response.data);
      List<BannerEntity> bannerList = baseEntity.data.map((e){
        return BannerEntity.fromJson(e);
      }).toList();
      return bannerList;
    }


    Future<List<HomeProjectEntity>> getHomeList(int page) async {
      try{
        Response response = await dio.get('${Api.HOME_PROJECT_LIST}$page/json');
        BaseEntity<Map<String,dynamic>> baseEntity = BaseEntity.fromJson(response.data);
        BaseListEntity<List> baseListEntity = BaseListEntity.fromJson(baseEntity.data);
        List<HomeProjectEntity> homeList = baseListEntity.datas.map((e) => HomeProjectEntity.fromJson(e)).toList();
        return homeList;
      }catch (e){
        print(e);
        return e;
      }
    }
}