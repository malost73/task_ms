// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemperatureDTO _$TemperatureDTOFromJson(Map<String, dynamic> json) =>
    TemperatureDTO(
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
    );

Map<String, dynamic> _$TemperatureDTOToJson(TemperatureDTO instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };
