import 'package:task_ms/features/weather_forecast/data/dtos/weather_dto/weather_dto.dart';
import 'package:task_ms/features/weather_forecast/domain/models/weather_model.dart';

extension WeatherMapper on WeatherDTO {
  WeatherModel toDomain() {
    return WeatherModel(
        id: id, main: main, description: description, icon: icon);
  }
}
