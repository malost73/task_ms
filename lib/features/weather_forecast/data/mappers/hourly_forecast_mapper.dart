import 'package:task_ms/features/weather_forecast/data/dtos/hourly_forecast_dto/hourly_forecast_dto.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/weather_dto/weather_dto.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/weather_mapper.dart';
import 'package:task_ms/features/weather_forecast/domain/models/hourly_forecast_model.dart';

extension HourlyForecastMapper on HourlyForecastDTO {
  HourlyForecastModel toDomain() {
    return HourlyForecastModel(
        dt: dt,
        temp: temp,
        weather: weather?.map((WeatherDTO e) => e.toDomain()).toList());
  }
}
