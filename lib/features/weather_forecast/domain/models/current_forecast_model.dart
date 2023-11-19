import 'package:task_ms/api/constants_api.dart';
import 'package:task_ms/features/weather_forecast/domain/models/weather_model.dart';

class CurrentForecastModel {
  const CurrentForecastModel(
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
  final List<WeatherModel>? weather;

// String getIconUrl() {
//   return '${ConstantsApi.weatherImagesUrl}${weather![0].icon}.png';
// }
}
