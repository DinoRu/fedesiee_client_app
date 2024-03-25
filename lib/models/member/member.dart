import 'package:json_annotation/json_annotation.dart';
part 'member.g.dart';

@JsonSerializable()
class Member {

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'post')
  String? post;

  @JsonKey(name: 'photo')
  String? photo;

  @JsonKey(name: 'communityId')
  String? communityId;


  Member({
    this.id,
    this.name,
    this.post,
    this.photo,
    this.communityId,
  });

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
  Map<String, dynamic> toJson() => _$MemberToJson(this);


}