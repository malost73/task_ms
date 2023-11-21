import 'package:task_ms/features/weather_forecast/data/dtos/hourly_forecast_dto/hourly_forecast_dto.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/weather_dto/weather_dto.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/remote_mappers/weather_mapper.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/hourly_forecast_entity.dart';

extension HourlyForecastMapper on HourlyForecastDTO {
  HourlyForecastEntity toDomain() {
    return HourlyForecastEntity(
        dt: dt,
        temp: temp,
        weather: weather?.map((WeatherDTO e) => e.toDomain()).toList());
  }
}
