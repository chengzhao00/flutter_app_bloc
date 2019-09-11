



import 'package:flutter/material.dart';
import 'package:flutter_app_bloc/utils/ScreenUtils.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 140.0,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(top: ScreenUtils().statusBarHeight,left: 10),
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.account_circle,size: 40,),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    Text('chengzhao',style: TextStyle(color: Colors.white60,fontSize: 14),),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    Text('个人简介',style: TextStyle(color: Colors.white60,fontSize: 10),)
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(Icons.edit,color: Colors.white,size: 20,),
                  ),
                )
              ],
            ),
          ),
          _itemInfo(icon: Icons.collections,title: '收藏', onPress: (){}),
          _itemInfo(icon: Icons.settings,title: '设置', onPress: (){}),
          _itemInfo(icon: Icons.info,title: '关于', onPress: (){})
        ],
      ),
    );
  }


  Widget _itemInfo({icon,title,onPress}){
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10,top: 10,right: 10),
              child: Icon(icon,size: 20 ,color: Colors.grey,),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10,top: 10,right: 10),
              child: Text(title,style: TextStyle(fontSize: 13 ,color: Colors.black54),)
            )
          ],
        ),
      ),
    );
  }
}
