// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_forecast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyForecastDTO _$DailyForecastDTOFromJson(Map<String, dynamic> json) =>
    DailyForecastDTO(
      dt: json['dt'] as int?,
      temp: json['temp'] == null
          ? null
          : TemperatureDTO.fromJson(json['temp'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DailyForecastDTOToJson(DailyForecastDTO instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'weather': instance.weather,
    };
