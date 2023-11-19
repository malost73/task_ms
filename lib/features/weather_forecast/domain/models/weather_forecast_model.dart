import 'package:task_ms/features/weather_forecast/domain/models/current_forecast_model.dart';
import 'package:task_ms/features/weather_forecast/domain/models/daily_forecast_model.dart';
import 'package:task_ms/features/weather_forecast/domain/models/hourly_forecast_model.dart';

class WeatherForecastModel {
  const WeatherForecastModel(
      {this.lat, this.lon, this.current, this.hourly, this.daily});

  final double? lat;
  final double? lon;
  final CurrentForecastModel? current;
  final List<HourlyForecastModel>? hourly;
  final List<DailyForecastModel>? daily;
}
