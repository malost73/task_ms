import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/temperature_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/weather_entity.dart';

class DailyForecastEntity {
  const DailyForecastEntity({this.dt, this.temp, this.weather});

  final int? dt;
  final TemperatureEntity? temp;
  final List<WeatherEntity>? weather;
}
