import 'package:dartz/dartz.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';

abstract class CityNameRepository {
  Future<Either<Failure, List<CityNameEntity>?>> getCityNameList(
      {String? cityName, required bool fromServer});

  Future<Either<Failure, CityNameEntity?>> getFirstCityName();

  void saveCityName({CityNameEntity? cityName});

  void deleteCityName({CoordinatesEntity? coordinates});

  Future<Either<Failure, bool>> checkSavedCityName(
      {required CoordinatesEntity coordinates});
}
