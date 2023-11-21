import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/weather_entity.dart';

class CurrentForecastEntity {
  const CurrentForecastEntity(
      {this.dt,
      this.temp,
      this.pressure,
      this.humidity,
      this.windSpeed,
      this.weather});

  final int? dt;
  final double? temp;
  final int? pressure;
  final int? humidity;
  final double? windSpeed;
  final List<WeatherEntity>? weather;

// String getIconUrl() {
//   return '${ConstantsApi.weatherImagesUrl}${weather![0].icon}.png';
// }
}
