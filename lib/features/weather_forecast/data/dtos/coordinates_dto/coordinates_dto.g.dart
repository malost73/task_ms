// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordinatesDTO _$CoordinatesDTOFromJson(Map<String, dynamic> json) =>
    CoordinatesDTO(
      lon: (json['lon'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordinatesDTOToJson(CoordinatesDTO instance) =>
    <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };
