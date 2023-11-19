import 'package:task_ms/features/weather_forecast/data/dtos/temperature_dto/temperature_dto.dart';
import 'package:task_ms/features/weather_forecast/domain/models/temperature_model.dart';

extension TemperatureMapper on TemperatureDTO {
  TemperatureModel toDomain() {
    return TemperatureModel(min: min, max: max);
  }
}
