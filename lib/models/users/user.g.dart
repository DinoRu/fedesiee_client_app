// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      confirm_password: json['confirm_password'] as String?,
      number: json['number'] as String?,
      city: json['city'] as String?,
      profileUrl: json['profileUrl'] as String? ?? '',
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'city': instance.city,
      'number': instance.number,
      'password': instance.password,
      'confirm_password': instance.confirm_password,
      'profileUrl': instance.profileUrl,
    };
