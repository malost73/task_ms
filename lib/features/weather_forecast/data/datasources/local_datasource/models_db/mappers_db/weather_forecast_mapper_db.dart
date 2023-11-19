import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/hourly_forecast_db/hourly_forecast_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/mappers_db/current_forecast_mapper_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/mappers_db/hourly_forecast_mapper_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/weather_forecast_db/weather_forecast_db.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/hourly_forecast_dto/hourly_forecast_dto.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/weather_forecast_dto/weather_forecast_dto.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/current_forecast_mapper.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/hourly_forecast_mapper.dart';
import 'package:task_ms/features/weather_forecast/domain/models/weather_forecast_model.dart';

extension WeatherForecastMapperDB on $WeatherForecastDB {
  WeatherForecastModel toDomain() {
    return WeatherForecastModel(
        lat: coordinates?.lat,
        lon: coordinates?.lon,
        current: current?.toDomain(),
        hourly: hourly.map(($HourlyForecastDB e) => e.toDomain()).toList());
  }
}
