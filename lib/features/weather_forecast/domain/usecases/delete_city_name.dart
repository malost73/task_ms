import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/repositories/city_name_repository.dart';

class DeleteCityName {
  DeleteCityName(this.cityNameRepository);

  final CityNameRepository cityNameRepository;

  void call(CoordinatesEntity? coordinates) {
    return cityNameRepository.deleteCityName(coordinates: coordinates);
  }
}
