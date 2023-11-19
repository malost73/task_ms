import 'package:task_ms/features/weather_forecast/data/dtos/daily_forecast_dto/daily_forecast_dto.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/weather_dto/weather_dto.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/temperature_mapper.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/weather_mapper.dart';
import 'package:task_ms/features/weather_forecast/domain/models/daily_forecast_model.dart';

extension DailyForecastMapper on DailyForecastDTO {
  DailyForecastModel toDomain() {
    return DailyForecastModel(
        dt: dt,
        temp: temp?.toDomain(),
        weather: weather?.map((WeatherDTO e) => e.toDomain()).toList());
  }
}
