import 'package:json_annotation/json_annotation.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/current_forecast_dto/current_forecast_dto.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/daily_forecast_dto/daily_forecast_dto.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/hourly_forecast_dto/hourly_forecast_dto.dart';

part 'weather_forecast_dto.g.dart';

@JsonSerializable()
class WeatherForecastDTO {
  @JsonKey(name: 'lat')
  final double? lat;

  @JsonKey(name: 'lon')
  final double? lon;

  @JsonKey(name: 'current')
  final CurrentForecastDTO? current;

  @JsonKey(name: 'hourly')
  final List<HourlyForecastDTO>? hourly;

  @JsonKey(name: 'daily')
  final List<DailyForecastDTO>? daily;

  const WeatherForecastDTO(
      {this.lat, this.lon, this.current, this.hourly, this.daily});

  factory WeatherForecastDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastDTOFromJson(json);
}
