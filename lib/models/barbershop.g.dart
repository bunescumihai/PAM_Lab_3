// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barbershop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Barbershop _$BarbershopFromJson(Map<String, dynamic> json) => Barbershop(
      json['name'] as String,
      json['location_with_distance'] as String,
      (json['review_rate'] as num).toDouble(),
      json['image'] as String,
    );

Map<String, dynamic> _$BarbershopToJson(Barbershop instance) =>
    <String, dynamic>{
      'review_rate': instance.rating,
      'name': instance.title,
      'location_with_distance': instance.location,
      'image': instance.imagePath,
    };
