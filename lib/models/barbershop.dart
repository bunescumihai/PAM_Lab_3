import 'package:json_annotation/json_annotation.dart';

part 'barbershop.g.dart';

@JsonSerializable()
class Barbershop{

  @JsonKey(name: 'review_rate')
  double rating;

  @JsonKey(name: 'name')
  String title;

  @JsonKey(name: 'location_with_distance')
  String location;

  @JsonKey(name: 'image')
  String imagePath;

  Barbershop(this.title, this.location,this.rating, this.imagePath);


  factory Barbershop.fromJson(Map<String, dynamic> json) => _$BarbershopFromJson(json);

  Map<String, dynamic> toJson() => _$BarbershopToJson(this);
}