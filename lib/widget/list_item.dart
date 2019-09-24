import 'package:flutter/material.dart';
import 'package:flutter_app_bloc/res/style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_app_bloc/widget/progres_view.dart';

typedef GestureItemTapCallback = void Function();

class ListItem<T> extends StatelessWidget {
  final ListItemEntity entity;
  final Key key;
  final GestureItemTapCallback onTap;
  final bool isColl;

  ListItem(this.entity, {this.key, @required this.onTap, this.isColl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 160,
        padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
        decoration: BoxStyles.boxDecoration,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                   Text(
                    entity.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyles.listTitle,
                  ),
                Gaps.heightSpace,
                Expanded(
                    flex: 1,
                    child: Text(
                      entity.content,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      softWrap: true,
                      style: TextStyles.listContent,
                    )),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    CollBtn(
                      isColl: isColl,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      entity.author,
                      style: TextStyles.listAuthor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      entity.date,
                      style: TextStyles.listAuthor,
                    )
                  ],
                )
              ],
            )),
            Container(
              width: 70,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 10),
              child: CachedNetworkImage(
                  imageUrl: entity.networkImage,
                width: 70,
                height: 120,
                fit: BoxFit.fill,
                placeholder: (BuildContext context,String url) => ProgressView(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CollBtn extends StatelessWidget {
  final bool isColl;

  CollBtn({this.isColl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Icon(
        Icons.favorite,
        color: isColl == true ? Colors.red : Colors.grey,
      ),
    );
  }
}

class ListItemEntity {
  String title;

  String content;

  String networkImage;

  String author;

  String date;

  ListItemEntity( this.title,this.content,this.networkImage,  this.author,
    this.date );

}
