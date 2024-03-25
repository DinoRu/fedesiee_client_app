import 'package:json_annotation/json_annotation.dart';
part 'office.g.dart';

@JsonSerializable()
class OfficeMember {

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'post')
  String? post;

  @JsonKey(name: 'avatar')
  String? avatar;

  @JsonKey(name: 'bio')
  String? bio;

  @JsonKey(name: 'city')
  String? city;


  OfficeMember({
    this.id,
    this.name,
    this.post,
    this.avatar,
    this.bio,
    this.city
  });

  factory OfficeMember.fromJson(Map<String, dynamic> json) => _$OfficeMemberFromJson(json);
  Map<String, dynamic> toJson() => _$OfficeMemberToJson(this);

}