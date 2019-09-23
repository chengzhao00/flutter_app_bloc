


import 'package:flutter/material.dart';
import 'package:flutter_app_bloc/http/repository/home_repository.dart';
import 'package:flutter_app_bloc/model/home/home_entity.dart';
import 'package:flutter_app_bloc/model/home/home_project_entity.dart';

import 'home_index.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{

  final HomeRepository homeRepository;


  HomeBloc({
    this.homeRepository}) : assert( homeRepository != null){
    dispatch(HomeLoadingEvent());
  }

  ///初始化状态 state
  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    try{
      if(event is HomeLoadingEvent){
        yield HomeLoadingState();
        List<BannerEntity> bannerList = await homeRepository.getBanner();
        List<HomeProjectEntity> homelist  = await homeRepository.getHomeList(1);
        yield HomeDataState(homeList: homelist , bannerList:  bannerList);

      }
    } catch(e){
      yield HomeLoadError(e);
    }
  }

}