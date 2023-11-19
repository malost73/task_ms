// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_name_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityNameDTO _$CityNameDTOFromJson(Map<String, dynamic> json) => CityNameDTO(
      name: json['name'] as String?,
      localCityNames: json['local_names'] == null
          ? null
          : LocalCityNamesDTO.fromJson(
              json['local_names'] as Map<String, dynamic>),
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      country: json['country'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$CityNameDTOToJson(CityNameDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'local_names': instance.localCityNames,
      'lat': instance.lat,
      'lon': instance.lon,
      'country': instance.country,
      'state': instance.state,
    };
