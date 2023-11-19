// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_forecast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyForecastDTO _$HourlyForecastDTOFromJson(Map<String, dynamic> json) =>
    HourlyForecastDTO(
      dt: json['dt'] as int?,
      temp: (json['temp'] as num?)?.toDouble(),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HourlyForecastDTOToJson(HourlyForecastDTO instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'weather': instance.weather,
    };
