

import 'package:flutter/material.dart';
import 'dart:ui' as ui;


class ScreenUtils{
  double _statusBarHeight = 0.0;
  double _bottomBarHeight = 0.0;
  double _appBarHeight = 0.0;
  double _screenHeight = 0.0;
  double _screenWidth = 0.0;


  double get statusBarHeight => _statusBarHeight;
  static  ScreenUtils _screenUtils;

  factory ScreenUtils(){
    if(_screenUtils == null){
      _screenUtils = ScreenUtils._internal();
      _screenUtils._init();
    }
    return _screenUtils;
  }

  ScreenUtils._internal();

  _init(){
    MediaQueryData mediaQueryData = MediaQueryData.fromWindow(ui.window);
    _statusBarHeight = mediaQueryData.padding.top;
    _bottomBarHeight = mediaQueryData.padding.bottom;
    _screenHeight = mediaQueryData.size.height;
    _screenWidth = mediaQueryData.size.width;
    _appBarHeight = kToolbarHeight;
  }

  double get bottomBarHeight => _bottomBarHeight;

  double get appBarHeight => _appBarHeight;

  double get screenHeight => _screenHeight;

  double get screenWidth => _screenWidth;

}