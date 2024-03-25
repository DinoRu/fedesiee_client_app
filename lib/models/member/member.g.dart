// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      id: json['id'] as String?,
      name: json['name'] as String?,
      post: json['post'] as String?,
      photo: json['photo'] as String?,
      communityId: json['communityId'] as String?,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'post': instance.post,
      'photo': instance.photo,
      'communityId': instance.communityId,
    };
