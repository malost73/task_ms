import 'package:task_ms/features/weather_forecast/data/dtos/current_forecast_dto/current_forecast_dto.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/weather_dto/weather_dto.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/weather_mapper.dart';
import 'package:task_ms/features/weather_forecast/domain/models/current_forecast_model.dart';

extension CurrentForecastMapper on CurrentForecastDTO {
  CurrentForecastModel toDomain() {
    return CurrentForecastModel(
        dt: dt,
        temp: temp,
        pressure: pressure,
        humidity: humidity,
        windSpeed: windSpeed,
        weather: weather?.map((WeatherDTO e) => e.toDomain()).toList());
  }
}
