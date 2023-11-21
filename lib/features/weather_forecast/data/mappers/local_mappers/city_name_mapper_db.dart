import 'package:task_ms/features/weather_forecast/data/mappers/local_mappers/local_city_names_mapper_db.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/local_entities/city_name_db/city_name_db.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';

extension CityNameMapperDB on $CityNameDB {
  CityNameEntity toDomain() {
    return CityNameEntity(
        name: name,
        localNames: localNames?.toDomain(),
        lon: lon,
        lat: lat,
        country: country,
        state: state);
  }
}
