import 'package:task_ms/features/weather_forecast/data/dtos/local_city_names_dto/local_city_names_dto.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/local_city_names_entity.dart';

extension LocalCityNamesMapper on LocalCityNamesDTO {
  LocalCityNamesEntity toDomain() {
    return LocalCityNamesEntity(ru: ru, en: en);
  }
}
