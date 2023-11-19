import 'package:task_ms/api/constants_api.dart';
import 'package:task_ms/features/weather_forecast/domain/models/temperature_model.dart';
import 'package:task_ms/features/weather_forecast/domain/models/weather_model.dart';

class DailyForecastModel {
  const DailyForecastModel({this.dt, this.temp, this.weather});

  final int? dt;
  final TemperatureModel? temp;
  final List<WeatherModel>? weather;

// String getIconUrl() {
//   return '${ConstantsApi.weatherImagesUrl}${weather![0].icon}.png';
// }
}
