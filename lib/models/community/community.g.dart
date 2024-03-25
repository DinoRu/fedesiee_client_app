// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Community _$CommunityFromJson(Map<String, dynamic> json) => Community(
      id: json['id'] as String?,
      name: json['name'] as String?,
      bio: json['bio'] as String?,
      thumbnail: json['thumbnail'] as String?,
      name_presi: json['name_presi'] as String?,
      secretary: json['secretary'] as String?,
      social_contact: json['social_contact'] as String?,
    );

Map<String, dynamic> _$CommunityToJson(Community instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bio': instance.bio,
      'name_presi': instance.name_presi,
      'thumbnail': instance.thumbnail,
      'secretary': instance.secretary,
      'social_contact': instance.social_contact,
    };
