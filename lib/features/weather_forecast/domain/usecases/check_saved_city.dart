import 'package:dartz/dartz.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/repositories/city_name_repository.dart';

class CheckSavedCity {
  CheckSavedCity(this.cityNameRepository);

  final CityNameRepository cityNameRepository;

  Future<Either<Failure, bool>> call(CoordinatesEntity coordinates) {
    return cityNameRepository.checkSavedCityName(coordinates: coordinates);
  }
}
