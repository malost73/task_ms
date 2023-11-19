import 'package:dartz/dartz.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/features/weather_forecast/domain/models/city_name_list_model.dart';

abstract class CityNameListRepository {
  Future<Either<Failure, CityNameListModel?>> getCityNameList(
      {String? cityName});
}
