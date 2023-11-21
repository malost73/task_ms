import 'package:task_ms/features/weather_forecast/data/dtos/city_name_dto/city_name_dto.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/remote_mappers/local_city_names_mapper.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';

extension CityNameMapper on CityNameDTO {
  CityNameEntity toDomain() {
    return CityNameEntity(
        name: name,
        localNames: localCityNames?.toDomain(),
        lon: lon,
        lat: lat,
        country: country,
        state: state);
  }
}
