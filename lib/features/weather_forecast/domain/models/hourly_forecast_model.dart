import 'package:task_ms/api/constants_api.dart';
import 'package:task_ms/features/weather_forecast/domain/models/weather_model.dart';

class HourlyForecastModel {
  const HourlyForecastModel({this.dt, this.temp, this.weather});

  final int? dt;
  final double? temp;
  final List<WeatherModel>? weather;

// String getIconUrl() {
//   return '${ConstantsApi.weatherImagesUrl}${weather![0].icon}.png';
// }
}
