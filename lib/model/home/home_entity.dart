

class BannerEntity {
  String imagePath;
  int id;
  int isVisible;
  String title;
  int type;
  String url;
  String desc;
  int order;

  BannerEntity({this.imagePath, this.id, this.isVisible, this.title, this.type, this.url, this.desc, this.order});

  BannerEntity.fromJson(Map<String, dynamic> json) {
    imagePath = json['imagePath'];
    id = json['id'];
    isVisible = json['isVisible'];
    title = json['title'];
    type = json['type'];
    url = json['url'];
    desc = json['desc'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imagePath'] = this.imagePath;
    data['id'] = this.id;
    data['isVisible'] = this.isVisible;
    data['title'] = this.title;
    data['type'] = this.type;
    data['url'] = this.url;
    data['desc'] = this.desc;
    data['order'] = this.order;
    return data;
  }

  @override
  String toString() {
    return 'BannerEntity{imagePath: $imagePath, id: $id, isVisible: $isVisible, title: $title, type: $type, url: $url, desc: $desc, order: $order}';
  }


}



class HomeItemEntity{
  String title;
  String desc;
  String envelopePic;
  String author;
  bool collect;
  String niceDate;

  HomeItemEntity({this.title, this.desc, this.envelopePic, this.author, this.collect,
      this.niceDate});

  HomeItemEntity.fromJson(Map<String, dynamic> json){
    title = json['title'];
    desc = json['desc'];
    envelopePic = json['envelopePic'];
    author = json['author'];
    collect = json['collect'];
    niceDate = json['niceDate'];
  }

}