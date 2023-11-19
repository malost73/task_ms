import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/daily_forecast_db/daily_forecast_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/mappers_db/temperature_mapper_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/mappers_db/weather_mapper_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/weather_db/weather_db.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/daily_forecast_dto/daily_forecast_dto.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/weather_dto/weather_dto.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/temperature_mapper.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/weather_mapper.dart';
import 'package:task_ms/features/weather_forecast/domain/models/daily_forecast_model.dart';

extension DailyForecastMapperDB on $DailyForecastDB {
  DailyForecastModel toDomain() {
    return DailyForecastModel(
        dt: dt,
        temp: temp?.toDomain(),
        weather: weather.map(($WeatherDB e) => e.toDomain()).toList());
  }
}
