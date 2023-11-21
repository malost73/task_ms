import 'package:dartz/dartz.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/features/weather_forecast/domain/models/coordinates_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/models/weather_forecast_entity.dart';

abstract class WeatherForecastRepository {
  Future<Either<Failure, WeatherForecastModel?>> getWeatherForecast(
      {CoordinatesModel? coordinates});
}
