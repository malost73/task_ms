import 'package:task_ms/features/weather_forecast/domain/entities/local_entities/local_city_names_db/local_city_names_db.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/local_city_names_entity.dart';

extension LocalCityNamesMapperDB on $LocalCityNamesDB {
  LocalCityNamesEntity toDomain() {
    return LocalCityNamesEntity(ru: ru, en: en);
  }
}
