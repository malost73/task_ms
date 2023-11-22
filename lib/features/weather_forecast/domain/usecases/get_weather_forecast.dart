import 'package:dartz/dartz.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/core/usecases/base_usecase.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/weather_forecast_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/repositories/weather_forecast_repository.dart';
// import 'package:injectable/injectable.dart';

// @injectable
class GetWeatherForecast
    implements BaseUseCase<WeatherForecastEntity?, CoordinatesEntity> {
  GetWeatherForecast(this.weatherForecastRepository);

  final WeatherForecastRepository weatherForecastRepository;

  @override
  Future<Either<Failure, WeatherForecastEntity?>> call(
      CoordinatesEntity? coordinatesEntity) {
    return weatherForecastRepository.getWeatherForecast(
        coordinates: coordinatesEntity);
  }
}
