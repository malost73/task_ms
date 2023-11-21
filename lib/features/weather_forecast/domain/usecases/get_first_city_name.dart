import 'package:dartz/dartz.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/core/usecases/base_usecase.dart';
import 'package:task_ms/features/weather_forecast/domain/models/city_name_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/repositories/city_name_repository.dart';
// import 'package:injectable/injectable.dart';

// @injectable
class GetFirstCityName implements BaseUseCase<CityNameModel?, NoParams?> {
  GetFirstCityName(this.cityNameRepository);

  final CityNameRepository cityNameRepository;

  @override
  Future<Either<Failure, CityNameModel?>> call(NoParams? noParams) {
    return cityNameRepository.getFirstCityName();
  }
}
