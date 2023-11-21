import 'package:task_ms/features/weather_forecast/data/dtos/daily_forecast_dto/daily_forecast_dto.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/weather_dto/weather_dto.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/remote_mappers/temperature_mapper.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/remote_mappers/weather_mapper.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/daily_forecast_entity.dart';

extension DailyForecastMapper on DailyForecastDTO {
  DailyForecastEntity toDomain() {
    return DailyForecastEntity(
        dt: dt,
        temp: temp?.toDomain(),
        weather: weather?.map((WeatherDTO e) => e.toDomain()).toList());
  }
}
