import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/local_city_names_db/local_city_names_db.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/local_city_names_dto/local_city_names_dto.dart';
import 'package:task_ms/features/weather_forecast/domain/models/local_city_names_model.dart';

extension LocalCityNamesMapperDB on $LocalCityNamesDB {
  LocalCityNamesModel toDomain() {
    return LocalCityNamesModel(ru: ru, en: en);
  }
}
