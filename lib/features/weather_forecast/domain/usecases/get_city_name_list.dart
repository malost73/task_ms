import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/core/usecases/base_usecase.dart';
import 'package:task_ms/features/weather_forecast/domain/models/city_name_list_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/repositories/city_name_repository.dart';
// import 'package:injectable/injectable.dart';

// @injectable
class GetCityNameList
    implements BaseUseCase<CityNameListModel?, GetCitiesParams> {
  GetCityNameList(this.cityNameRepository);

  final CityNameRepository cityNameRepository;

  @override
  Future<Either<Failure, CityNameListModel?>> call(GetCitiesParams params) {
    return cityNameRepository.getCityNameList(
        cityName: params.cityName, fromServer: params.fromServer);
  }
}

class GetCitiesParams extends Equatable {
  final String? cityName;
  final bool fromServer;

  const GetCitiesParams({required this.cityName, required this.fromServer});

  @override
  List<Object> get props => [cityName ?? '', fromServer];
}
