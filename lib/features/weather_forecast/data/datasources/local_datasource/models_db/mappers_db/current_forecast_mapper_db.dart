import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/current_forecast_db/current_forecast_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/mappers_db/weather_mapper_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/weather_db/weather_db.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/current_forecast_dto/current_forecast_dto.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/weather_dto/weather_dto.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/weather_mapper.dart';
import 'package:task_ms/features/weather_forecast/domain/models/current_forecast_model.dart';

extension CurrentForecastMapperDB on $CurrentForecastDB {
  CurrentForecastModel toDomain() {
    return CurrentForecastModel(
        dt: dt,
        temp: temp,
        pressure: pressure,
        humidity: humidity,
        windSpeed: windSpeed,
        weather: weather.map(($WeatherDB e) => e.toDomain()).toList());
  }
}
