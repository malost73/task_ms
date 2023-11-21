import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/weather_entity.dart';

class HourlyForecastEntity {
  const HourlyForecastEntity({this.dt, this.temp, this.weather});

  final int? dt;
  final double? temp;
  final List<WeatherEntity>? weather;

// String getIconUrl() {
//   return '${ConstantsApi.weatherImagesUrl}${weather![0].icon}.png';
// }
}
