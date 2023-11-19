import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/city_name_db/city_name_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/mappers_db/local_city_names_mapper_db.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/city_name_dto/city_name_dto.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/local_city_names_mapper.dart';
import 'package:task_ms/features/weather_forecast/domain/models/city_name_model.dart';

extension CityNameMapperDB on $CityNameDB {
  CityNameModel toDomain() {
    return CityNameModel(
        name: name,
        localNames: localNames?.toDomain(),
        lon: lon,
        lat: lat,
        country: country,
        state: state);
  }
}
