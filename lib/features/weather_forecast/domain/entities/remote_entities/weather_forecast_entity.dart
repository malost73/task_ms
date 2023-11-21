import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/current_forecast_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/daily_forecast_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/hourly_forecast_entity.dart';

class WeatherForecastEntity {
  const WeatherForecastEntity(
      {this.lat, this.lon, this.current, this.hourly, this.daily});

  final double? lat;
  final double? lon;
  final CurrentForecastEntity? current;
  final List<HourlyForecastEntity>? hourly;
  final List<DailyForecastEntity>? daily;
}
