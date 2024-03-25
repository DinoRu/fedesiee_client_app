import 'package:json_annotation/json_annotation.dart';
part 'annonce.g.dart';

@JsonSerializable()
class Annonce {

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'thumbnail')
  String? thumbnail;


  Annonce({
    this.id,
    this.thumbnail,
  });

  factory Annonce.fromJson(Map<String, dynamic> json) => _$AnnonceFromJson(json);
  Map<String, dynamic> toJson() => _$AnnonceToJson(this);

}