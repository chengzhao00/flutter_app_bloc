// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_project_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeProjectEntity _$HomeProjectEntityFromJson(Map<String, dynamic> json) {
  return HomeProjectEntity(
    json['title'] as String,
    json['desc'] as String,
    json['envelopePic'] as String,
    json['author'] as String,
    json['collect'] as bool,
    json['niceDate'] as String,
  );
}

Map<String, dynamic> _$HomeProjectEntityToJson(HomeProjectEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'desc': instance.desc,
      'envelopePic': instance.envelopePic,
      'author': instance.author,
      'collect': instance.collect,
      'niceDate': instance.niceDate,
    };
