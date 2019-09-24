

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebPluginPage extends StatefulWidget {
  static const ROUTER_NAME = '/WebPluginPage';
  final String title;
  final String url;


  WebPluginPage({this.title, this.url});

  @override
  _WebPluginPageState createState() => _WebPluginPageState();
}

class _WebPluginPageState extends State<WebPluginPage> {
  FlutterWebviewPlugin flutterWebviewPlugin;
  bool showLoading = false;
  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin = FlutterWebviewPlugin();
    //initialChild只有第一网页加载时会显示，网页内部页面跳转不会再显示，所以要手动加上页面内跳转监听
    flutterWebviewPlugin.onStateChanged.listen((state) {
      print('_WebViewPageState.initState  state = ${state.type}');
      if (state.type == WebViewState.shouldStart) {
//        setState(() {
//          showLoading = true;
//        });
      } else if (state.type == WebViewState.finishLoad ||
          state.type == WebViewState.abortLoad) {
//        setState(() {
//          showLoading = false;
//        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebviewScaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            maxLines: 1,
            style: TextStyle(color: Colors.white, fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
          centerTitle: true,
        ),
        url: widget.url,
        hidden: true,
        withJavascript: true,
        withZoom: true,
        withLocalStorage: true,
      ),
    );
  }
}
