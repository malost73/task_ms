// import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:task_ms/core/error/exceprion.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/core/services/network_info.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/weather_forecast_local/weather_forecast_local.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/remote_datasource/weather_forecast_remote/weather_forecast_remote.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/weather_forecast_mapper.dart';
import 'package:task_ms/features/weather_forecast/domain/models/coordinates_model.dart';
import 'package:task_ms/features/weather_forecast/domain/models/weather_forecast_model.dart';
import 'package:task_ms/features/weather_forecast/domain/repositories/weather_forecast_repository.dart';

// @Injectable(as: WeatherForecastRepository)
class WeatherForecastRepositoryImpl implements WeatherForecastRepository {
  WeatherForecastRepositoryImpl({
    required this.remoteWeatherForecast,
    required this.localWeatherForecast,
    required this.networkInfo,
  });

  final WeatherForecastRemote remoteWeatherForecast;
  final WeatherForecastLocal localWeatherForecast;
  final NetworkInfo networkInfo;

  // Future<ApiResultModel<WeatherForecastModel?>>
  //     _getLastLocalWeatherForecast() async {
  //   final WeatherForecastModel? localResult =
  //       await localDataSource.getLastWeatherForecast();
  //   return ApiResultModel<WeatherForecastModel?>.success(
  //     data: localResult,
  //   );
  // }

  // void _cacheLocalData(WeatherForecastDTO? weatherData) {
  //   localDataSource.cacheWeatherForecast(weatherData);
  // }

  // @override
  // Future<ApiResultModel<List<WeatherForecastModel?>?>>
  //     getAllLocalWeathers() async {
  //   final List<WeatherForecastModel?>? _result =
  //       await localDataSource.getAllLocalWeathers();
  //   return ApiResultModel<List<WeatherForecastModel?>?>.success(
  //     data: _result,
  //   );
  // }

  @override
  Future<Either<Failure, WeatherForecastModel?>> getWeatherForecast(
      {CoordinatesModel? coordinates}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteForecast = await remoteWeatherForecast.getWeatherForecast(
            coordinatesModel: coordinates);
        // _cacheLocalData(weatherForecastDTO);
        return Right(remoteForecast?.toDomain());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      // try {
      //   final WeatherForecastModel? localForecast =
      //       await localWeatherForecast.getLastWeatherForecast();
      //   return Right(localForecast);
      // } on CacheException {
      //   return Left(CacheFailure());
      // }
      throw CacheException();
    }
  }
}
