import 'package:dartz/dartz.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/features/weather_forecast/domain/models/city_name_model.dart';

abstract class FirstStartCheckingRepository {
  Future<Either<Failure, CityNameModel?>> getCityName({String? cityName});
}
