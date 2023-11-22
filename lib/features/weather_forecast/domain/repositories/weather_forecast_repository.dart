import 'package:dartz/dartz.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/weather_forecast_entity.dart';

abstract class WeatherForecastRepository {
  Future<Either<Failure, WeatherForecastEntity?>> getWeatherForecast(
      {CoordinatesEntity? coordinates});
}
