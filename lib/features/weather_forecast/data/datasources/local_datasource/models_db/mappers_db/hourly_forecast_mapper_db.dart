import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/hourly_forecast_db/hourly_forecast_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/mappers_db/weather_mapper_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/weather_db/weather_db.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/hourly_forecast_dto/hourly_forecast_dto.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/weather_dto/weather_dto.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/weather_mapper.dart';
import 'package:task_ms/features/weather_forecast/domain/models/hourly_forecast_model.dart';

extension HourlyForecastMapperDB on $HourlyForecastDB {
  HourlyForecastModel toDomain() {
    return HourlyForecastModel(
        dt: dt,
        temp: temp,
        weather: weather.map(($WeatherDB e) => e.toDomain()).toList());
  }
}
