import 'package:task_ms/features/weather_forecast/data/dtos/temperature_dto/temperature_dto.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/temperature_entity.dart';

extension TemperatureMapper on TemperatureDTO {
  TemperatureEntity toDomain() {
    return TemperatureEntity(min: min, max: max);
  }
}
