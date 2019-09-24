//import 'package:flutter/material.dart';
//import 'package:flutter_app_bloc/res/style.dart';
//import 'package:flutter_app_bloc/widget/progres_view.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:toast/toast.dart';
//import 'package:webview_flutter/webview_flutter.dart';
//
//import 'bloc/web_bloc.dart';
//import 'bloc/web_index.dart';
//
//class WebViewPage extends StatefulWidget {
//  static const ROUTER_NAME = '/WebViewPage';
//
//  final String title;
//  final String url;
//
//  WebViewPage({@required this.title, @required this.url});
//
//  @override
//  _WebViewPageState createState() => _WebViewPageState();
//}
//
//class _WebViewPageState extends State<WebViewPage> {
//  WebBloc webBloc;
//
//  @override
//  void initState() {
//    super.initState();
//    webBloc = WebBloc();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: Text(
//            widget.title,
//            maxLines: 1,
//            style: TextStyle(color: Colors.white, fontSize: 16),
//            overflow: TextOverflow.ellipsis,
//          ),
//          centerTitle: true,
//        ),
//        body:
//         WebView(
//            initialUrl: 'https://flutter-io.cn/',
//           javascriptMode: JavascriptMode.unrestricted,
//          ),
//
//      );
//  }
//
//}


import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Browser extends StatelessWidget {
  const Browser({Key key, this.url, this.title}) : super(key: key);

  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
          )
        ],
      ),
    );
  }
}
