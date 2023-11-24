import 'package:dartz/dartz.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/core/usecases/base_usecase.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/repositories/city_name_repository.dart';
// import 'package:injectable/injectable.dart';

// @injectable
class SaveCityName
    // implements BaseUseCase<void, CityNameEntity>
{
  SaveCityName(this.cityNameRepository);

  final CityNameRepository cityNameRepository;

  void call(CityNameEntity? cityName) {
    return cityNameRepository.saveCityName(cityName: cityName);
  }
}
