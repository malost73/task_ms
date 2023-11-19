// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecastDTO _$WeatherForecastDTOFromJson(Map<String, dynamic> json) =>
    WeatherForecastDTO(
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      current: json['current'] == null
          ? null
          : CurrentForecastDTO.fromJson(
              json['current'] as Map<String, dynamic>),
      hourly: (json['hourly'] as List<dynamic>?)
          ?.map((e) => HourlyForecastDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      daily: (json['daily'] as List<dynamic>?)
          ?.map((e) => DailyForecastDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherForecastDTOToJson(WeatherForecastDTO instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'current': instance.current,
      'hourly': instance.hourly,
      'daily': instance.daily,
    };
