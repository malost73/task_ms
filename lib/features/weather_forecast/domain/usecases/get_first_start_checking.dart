import 'package:dartz/dartz.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/core/usecases/base_usecase.dart';
import 'package:task_ms/features/weather_forecast/domain/models/city_name_model.dart';
import 'package:task_ms/features/weather_forecast/domain/repositories/city_name_list_repository.dart';
// import 'package:injectable/injectable.dart';

// @injectable
class GetFirstStartChecking implements BaseUseCase<CityNameModel?, String> {
  GetFirstStartChecking(this.cityNameListRepository);

  final CityNameListRepository cityNameListRepository;

  @override
  Future<Either<Failure, CityNameModel?>> call(String? cityName) {
    return cityNameListRepository.getCityNameList(cityName: cityName);
  }
}
