import 'package:auto_size/auto_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_bloc/pages/my_main_page.dart';
import 'package:flutter_app_bloc/pages/web/webview_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

import 'http/dio_utils.dart';

///当获取不到context上下文时使用 Globalkey跳转 navigatorKey.currentState.pushNamed(ROUTER_NAME)
final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

final Map<String, WidgetBuilder> routes = {

//  WebViewPage.ROUTER_NAME: (context) => WebViewPage(),

};

void main() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]); //设置屏幕方向为纵向
  BlocSupervisor.delegate = GlobalBlocDel(); // 设置delegate
  await DioUtils.init();
  runAutoSizeApp(MyApp());
}

class GlobalBlocDel extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print('bloc error $error');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      navigatorKey: navigatorKey,
      home: BlocProvider(
        builder: (context) {},
        child: MyMainPage(),
      ),
    );
  }
}
