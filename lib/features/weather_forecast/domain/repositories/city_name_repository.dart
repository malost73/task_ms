import 'package:dartz/dartz.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/features/weather_forecast/domain/models/city_name_list_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/models/city_name_entity.dart';

abstract class CityNameRepository {
  Future<Either<Failure, CityNameListModel?>> getCityNameList(
      {String? cityName, required bool fromServer});

  Future<Either<Failure, CityNameModel?>> getFirstCityName();
}
