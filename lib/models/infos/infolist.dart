import 'package:json_annotation/json_annotation.dart';
part 'infolist.g.dart';

@JsonSerializable()
class InfoList {

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'thumbnail')
  String? thumbnail;


  InfoList({
    this.id,
    this.title,
    this.thumbnail,
    this.description,
  });

  factory InfoList.fromJson(Map<String, dynamic> json) => _$InfoListFromJson(json);
  Map<String, dynamic> toJson() => _$InfoListToJson(this);


}