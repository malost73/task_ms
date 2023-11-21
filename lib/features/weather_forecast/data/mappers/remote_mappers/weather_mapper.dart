import 'package:task_ms/features/weather_forecast/data/dtos/weather_dto/weather_dto.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/weather_entity.dart';

extension WeatherMapper on WeatherDTO {
  WeatherEntity toDomain() {
    return WeatherEntity(
        id: id, main: main, description: description, icon: icon);
  }
}
