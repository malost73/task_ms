import 'package:task_ms/features/weather_forecast/data/dtos/city_name_dto/city_name_dto.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/local_city_names_mapper.dart';
import 'package:task_ms/features/weather_forecast/domain/models/city_name_model.dart';

extension CityNameMapper on CityNameDTO {
  CityNameModel toDomain() {
    return CityNameModel(
        name: name,
        localNames: localCityNames?.toDomain(),
        lon: lon,
        lat: lat,
        country: country,
        state: state);
  }
}
