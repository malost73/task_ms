import 'package:dartz/dartz.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/weather_forecast_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/repositories/weather_forecast_repository.dart';

class GetWeatherForecast {
  GetWeatherForecast(this.weatherForecastRepository);

  final WeatherForecastRepository weatherForecastRepository;

  Future<Either<Failure, WeatherForecastEntity?>> call(
      {CoordinatesEntity? coordinates}) {
    return weatherForecastRepository.getWeatherForecast(
        coordinates: coordinates);
  }
}
