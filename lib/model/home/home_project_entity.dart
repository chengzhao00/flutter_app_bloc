
import 'package:json_annotation/json_annotation.dart';

part 'home_project_entity.g.dart';


/// flutter packages pub run build_runner build --delete-conflicting-outputs 生成命令
/// flutter packages pub run build_runner build
@JsonSerializable()
class HomeProjectEntity{

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'envelopePic')
  String envelopePic;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'collect')
  bool collect;

  @JsonKey(name: 'niceDate')
  String niceDate;


  @JsonKey(name: 'link')
  String link;


  HomeProjectEntity(this.title, this.desc, this.envelopePic, this.author,
      this.collect, this.niceDate,this.link);

   factory HomeProjectEntity.fromJson( Map<String, dynamic> json) => _$HomeProjectEntityFromJson(json);


   Map<String,dynamic> toJson () => _$HomeProjectEntityToJson(this);



}