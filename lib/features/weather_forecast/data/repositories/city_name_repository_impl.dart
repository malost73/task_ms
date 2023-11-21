// import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:task_ms/core/error/exceprion.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/city_name_local/city_name_local.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/city_name_local/city_name_local_impl.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/remote_datasource/city_name_list_remote/city_name_list_remote.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/remote_datasource/city_name_list_remote/city_name_list_remote_impl.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/remote_mappers/city_name_list_mapper.dart';
import 'package:task_ms/features/weather_forecast/domain/models/city_name_list_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/models/city_name_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/repositories/city_name_repository.dart';

// @Injectable(as: WeatherForecastRepository)
class CityNameRepositoryImpl implements CityNameRepository {
  CityNameRepositoryImpl({
    required this.remoteCityNameList,
    required this.localCityNameList,
  });

  final CityNameListRemote remoteCityNameList;
  final CityNameLocal localCityNameList;

  @override
  Future<Either<Failure, CityNameListModel?>> getCityNameList(
      {String? cityName, required bool fromServer}) async {
    if (fromServer) {
      try {
        final remoteForecast =
            await remoteCityNameList.getCityNameList(cityName: cityName);
        return Right(remoteForecast?.toDomain());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final List<CityNameModel>? localForecast = localCityNameList.getItems();
        return Right(CityNameListModel(cityNameList: localForecast));
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, CityNameModel?>> getFirstCityName() async {
    try {
      final CityNameModel? cityNameModel = localCityNameList.getFirstItem();
      return Right(cityNameModel);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
