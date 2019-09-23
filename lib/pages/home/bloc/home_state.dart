


import 'package:equatable/equatable.dart';
import 'package:flutter_app_bloc/model/home/home_entity.dart';
import 'package:flutter_app_bloc/model/home/home_project_entity.dart';

abstract class HomeState extends Equatable{

    HomeState([List props = const []]):super(props);
}


class HomeInitial extends HomeState{

  @override
  String toString() => 'HomeInitial';
}

class HomeBannerState extends HomeState{
  List<BannerEntity> bannerList;

  HomeBannerState({this.bannerList}) : super([bannerList]);

  @override
  String toString() => 'HomeBanner';
}


class HomeDataState extends HomeState{
  List<HomeProjectEntity> homeList;
  List<BannerEntity> bannerList;

  HomeDataState({this.homeList,this.bannerList}) :super([homeList,bannerList]);

  @override
  String toString() => 'HomeDataState homlist.length = ${homeList.length} && bannerlist.length = ${bannerList.length}';

}


class HomeLoginState extends HomeState{
  @override
  String toString() {
    return 'HomeLoginState';
  }
}


class HomeLoadingState extends HomeState {
   @override
  String toString() => 'homeLoading';
}


class HomeLoadError extends HomeState{

  Exception exception;

  HomeLoadError(this.exception):super([exception]);

}