import 'package:task_ms/features/weather_forecast/data/dtos/hourly_forecast_dto/hourly_forecast_dto.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/weather_forecast_dto/weather_forecast_dto.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/current_forecast_mapper.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/hourly_forecast_mapper.dart';
import 'package:task_ms/features/weather_forecast/domain/models/weather_forecast_model.dart';

extension WeatherForecastMapper on WeatherForecastDTO {
  WeatherForecastModel toDomain() {
    return WeatherForecastModel(
        lat: lat,
        lon: lon,
        current: current?.toDomain(),
        hourly: hourly?.map((HourlyForecastDTO e) => e.toDomain()).toList());
  }
}
