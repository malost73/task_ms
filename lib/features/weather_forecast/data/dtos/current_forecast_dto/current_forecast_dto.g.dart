// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_forecast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentForecastDTO _$CurrentForecastDTOFromJson(Map<String, dynamic> json) =>
    CurrentForecastDTO(
      dt: json['dt'] as int?,
      temp: (json['temp'] as num?)?.toDouble(),
      pressure: json['pressure'] as int?,
      humidity: json['humidity'] as int?,
      windSpeed: (json['wind_speed'] as num?)?.toDouble(),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CurrentForecastDTOToJson(CurrentForecastDTO instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'wind_speed': instance.windSpeed,
      'weather': instance.weather,
    };
