import 'package:dartz/dartz.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/repositories/city_name_repository.dart';

class GetFirstCityName {
  GetFirstCityName(this.cityNameRepository);

  final CityNameRepository cityNameRepository;

  Future<Either<Failure, CityNameEntity?>> call() {
    return cityNameRepository.getFirstCityName();
  }
}
