import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/repositories/city_name_repository.dart';

class SaveCityName {
  SaveCityName(this.cityNameRepository);

  final CityNameRepository cityNameRepository;

  void call(CityNameEntity? cityName) {
    return cityNameRepository.saveCityName(cityName: cityName);
  }
}
