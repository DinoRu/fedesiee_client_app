// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'office.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfficeMember _$OfficeMemberFromJson(Map<String, dynamic> json) => OfficeMember(
      id: json['id'] as String?,
      name: json['name'] as String?,
      post: json['post'] as String?,
      avatar: json['avatar'] as String?,
      bio: json['bio'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$OfficeMemberToJson(OfficeMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'post': instance.post,
      'avatar': instance.avatar,
      'bio': instance.bio,
      'city': instance.city,
    };
