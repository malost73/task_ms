// import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:task_ms/core/error/exceprion.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/core/services/network_info.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/remote_datasource/city_name_list_remote/city_name_list_remote.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/city_name_list_mapper.dart';
import 'package:task_ms/features/weather_forecast/domain/models/city_name_list_model.dart';
import 'package:task_ms/features/weather_forecast/domain/repositories/city_name_list_repository.dart';

// @Injectable(as: WeatherForecastRepository)
class CityNameListRepositoryImpl implements CityNameListRepository {
  CityNameListRepositoryImpl({
    required this.remoteCityNameList,
    // required this.localCityNameList,
    required this.networkInfo,
  });

  final CityNameListRemote remoteCityNameList;

  // final CityNameListLocal localCityNameList;
  final NetworkInfo networkInfo;

  // Future<Either<Failure, WeatherForecastModel?>>
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
  Future<Either<Failure, CityNameListModel?>> getCityNameList(
      {String? cityName}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteForecast =
            await remoteCityNameList.getCityNameList(cityName: cityName);
        // _cacheLocalData(weatherForecastDTO);
        return Right(remoteForecast?.toDomain());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      // try {
      //   final CityNameListModel? localForecast =
      //       await localCityNameList.getLastWeatherForecast();
      //   return Right(localForecast);
      // } on CacheException {
      //   return Left(CacheFailure());
      // }
      throw CacheException();
    }
  }
}
