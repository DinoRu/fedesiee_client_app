import 'package:json_annotation/json_annotation.dart';
part 'community.g.dart';

@JsonSerializable()
class Community {

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'bio')
  String? bio;

  @JsonKey(name: 'name_presi')
  String? name_presi;

  @JsonKey(name: 'thumbnail')
  String? thumbnail;

  @JsonKey(name: 'secretary')
  String? secretary;

  @JsonKey(name: 'social_contact')
  String? social_contact;



  Community({
    this.id,
    this.name,
    this.bio,
    this.thumbnail,
    this.name_presi,
    this.secretary,
    this.social_contact,
  });

  factory Community.fromJson(Map<String, dynamic> json) => _$CommunityFromJson(json);
  Map<String, dynamic> toJson() => _$CommunityToJson(this);


}