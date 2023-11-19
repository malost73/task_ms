import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/weather_db/weather_db.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/weather_dto/weather_dto.dart';
import 'package:task_ms/features/weather_forecast/domain/models/weather_model.dart';

extension WeatherMapperDB on $WeatherDB {
  WeatherModel toDomain() {
    return WeatherModel(
        id: id, main: main, description: description, icon: icon);
  }
}
