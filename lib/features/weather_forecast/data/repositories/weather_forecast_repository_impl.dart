// import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:task_ms/core/error/exceprion.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/remote_datasource/weather_forecast_remote/weather_forecast_remote.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/remote_datasource/weather_forecast_remote/weather_forecast_remote_impl.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/remote_mappers/weather_forecast_mapper.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/weather_forecast_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/repositories/weather_forecast_repository.dart';

// @Injectable(as: WeatherForecastRepository)
class WeatherForecastRepositoryImpl implements WeatherForecastRepository {
  WeatherForecastRepositoryImpl({
    required this.remoteWeatherForecast,
  });

  final WeatherForecastRemote remoteWeatherForecast;

  @override
  Future<Either<Failure, WeatherForecastEntity?>> getWeatherForecast(
      {CoordinatesEntity? coordinates}) async {
    try {
      final remoteForecast = await remoteWeatherForecast.getWeatherForecast(
          coordinatesEntity: coordinates);
      return Right(remoteForecast?.toDomain());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
