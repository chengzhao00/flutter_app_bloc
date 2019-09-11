


import 'package:flutter/material.dart';
import 'package:flutter_app_bloc/pages/project/project_page.dart';
import 'package:flutter_app_bloc/res/strings.dart';

import 'dynamic/dynamic_page.dart';
import 'home/home_page.dart';
import 'main_drawer.dart';
import 'sytem/system_page.dart';

class MyMainPage extends StatefulWidget {
  @override
  _MyMainPageState createState() => _MyMainPageState();
}


class _MyMainPageState extends State<MyMainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _pageList.length,
        child:  Scaffold(
          drawer: Drawer(
            child: MainDrawer(),
          ),
          appBar: AppBar(
            leading: Builder(
              builder: (context) =>InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Icon(Icons.account_circle),
              ),
            ),
            centerTitle: true,
            title: TabLayout(),
          ),
          body: TabViewLayout(),
        )
    );

  }
}


class TabLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: _pageList.map((page){
        return Tab(text: page.title,);
      }).toList(),
      isScrollable: true,
      labelPadding: EdgeInsets.all(12),
      indicatorSize: TabBarIndicatorSize.label,
    );
  }

}


class TabViewLayout extends StatelessWidget{
  Widget buildTabView(BuildContext context, _Page _page){
    switch(_page.title){
      case StringInfo.home_page:
        return HomePage();
      case StringInfo.project_page:
        return ProjectPage();
      case StringInfo.dynamic_page:
        return DynamicPage();
      case StringInfo.system_page:
        return SystemPage();
      default:
        return Container();
    }
  }
  @override
  Widget build(BuildContext context) {
    return TabBarView(children: _pageList.map((page) => buildTabView(context, page)).toList());
  }

}

class _Page {
   final String title;

   _Page(this.title);

}

final List<_Page> _pageList = [
  _Page(StringInfo.home_page),
  _Page(StringInfo.project_page),
  _Page(StringInfo.dynamic_page),
  _Page(StringInfo.system_page),

];
