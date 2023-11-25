import 'package:task_ms/features/weather_forecast/data/dtos/daily_forecast_dto/daily_forecast_dto.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/hourly_forecast_dto/hourly_forecast_dto.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/weather_forecast_dto/weather_forecast_dto.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/remote_mappers/current_forecast_mapper.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/remote_mappers/daily_forecast_mapper.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/remote_mappers/hourly_forecast_mapper.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/weather_forecast_entity.dart';

extension WeatherForecastMapper on WeatherForecastDTO {
  WeatherForecastEntity toDomain() {
    return WeatherForecastEntity(
        lat: lat,
        lon: lon,
        current: current?.toDomain(),
        hourly: hourly?.map((HourlyForecastDTO e) => e.toDomain()).toList(),
        daily: daily?.map((DailyForecastDTO e) => e.toDomain()).toList());
  }
}
