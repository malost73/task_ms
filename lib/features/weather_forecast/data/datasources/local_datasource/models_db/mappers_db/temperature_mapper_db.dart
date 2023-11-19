import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/temperature_db/temperature_db.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/temperature_dto/temperature_dto.dart';
import 'package:task_ms/features/weather_forecast/domain/models/temperature_model.dart';

extension TemperatureMapperDB on $TemperatureDB {
  TemperatureModel toDomain() {
    return TemperatureModel(min: min, max: max);
  }
}
