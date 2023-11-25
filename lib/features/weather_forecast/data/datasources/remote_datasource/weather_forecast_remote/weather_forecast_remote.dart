import 'package:task_ms/features/weather_forecast/data/dtos/weather_forecast_dto/weather_forecast_dto.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';

abstract class WeatherForecastRemote {
  Future<WeatherForecastDTO?> getWeatherForecast(
      {CoordinatesEntity? coordinatesEntity});
}
