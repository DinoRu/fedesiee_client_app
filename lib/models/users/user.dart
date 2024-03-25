import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'city')
  String? city;

  @JsonKey(name: 'number')
  String? number;

  @JsonKey(name: 'password')
  String? password;

  @JsonKey(name: 'confirm_password')
  String? confirm_password;

  @JsonKey(name: 'profileUrl')
  String? profileUrl;


  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.confirm_password,
    this.number,
    this.city,
    this.profileUrl = '',
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  void updateProfileImageUrl(String newImageUrl) {
    profileUrl = newImageUrl;
  }
}