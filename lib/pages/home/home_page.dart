import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_bloc/http/http_index.dart';
import 'package:flutter_app_bloc/http/repository/home_repository.dart';
import 'package:flutter_app_bloc/model/home/home_entity.dart';
import 'package:flutter_app_bloc/model/home/home_project_entity.dart';
import 'package:flutter_app_bloc/widget/list_item.dart';
import 'package:flutter_app_bloc/widget/progres_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:toast/toast.dart';

import 'bloc/home_index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeRepository homeRepository = HomeRepository();
  List<HomeProjectEntity>   homelist;
  HomeBloc homeBloc;
  /// 生成banner
  Widget _bannerView({List<BannerEntity> data}){
    return  Container(
      width: double.infinity,
      height: 200,
      child: Swiper(
        itemCount: data.length,
        itemBuilder: (context,index){
          return CachedNetworkImage(
            height: 200,
            imageUrl: data[index].imagePath,
            fit: BoxFit.fill,
            placeholder: (context,url) => DecoratedBox(
              decoration: BoxDecoration(color: Colors.grey),
            ),
            errorWidget: (context,url,error) => DecoratedBox(
              decoration: BoxDecoration(color: Colors.grey),
            ),
          );
        },
        autoplay: data.length > 1,
        pagination: SwiperPagination(
            alignment: Alignment.bottomCenter
        ),
      ),
    );
  }
  Widget _homeListData({List<BannerEntity> bannerData ,List<HomeProjectEntity> data}){
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: _bannerView(data: bannerData),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(_homeListItem,childCount: data.length)
        )
      ],
    );
  }
  ///生成item
  ///

  Widget _homeListItem(BuildContext context,int index){
    if(homelist == null || homelist.length == 0){
      return Center(
        child: Text("没有数据"),
      );
    }else {
      HomeProjectEntity entity = homelist[index];

      return Container(
        child: ListItem(
          ListItemEntity(entity.title, entity.desc, entity.envelopePic,entity.author, "09-09"),
          onTap: (){

          },)
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc,HomeState>(
          bloc: homeBloc,
          builder: (context,state) {
            if (state is HomeLoadingState) {
              return ProgressView();
            }

            if (state is HomeDataState) {
              homelist = state.homeList;
              return _homeListData(bannerData: state.bannerList,data: state.homeList );
            }

            if(state is HomeLoginState){
              return Center(
                child: Text('请求成功${state.runtimeType}'),
              );
            }
            if (state is HomeLoadError) {
              return Center(
                child: Text('异常 ${DioUtils.parseError(state.exception)}'),
              );
            }
            return Center(
              child: Text('未找到state${state.runtimeType}'),
            );
          }
      )
    );



  }

  @override
  void initState() {
    super.initState();
    homeBloc = HomeBloc(homeRepository: homeRepository);
  }
}
