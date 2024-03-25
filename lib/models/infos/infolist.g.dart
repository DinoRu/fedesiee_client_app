// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infolist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoList _$InfoListFromJson(Map<String, dynamic> json) => InfoList(
      id: json['id'] as String?,
      title: json['title'] as String?,
      thumbnail: json['thumbnail'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$InfoListToJson(InfoList instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
    };
