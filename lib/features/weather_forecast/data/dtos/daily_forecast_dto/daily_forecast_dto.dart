import 'package:json_annotation/json_annotation.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/temperature_dto/temperature_dto.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/weather_dto/weather_dto.dart';

part 'daily_forecast_dto.g.dart';

@JsonSerializable()
class DailyForecastDTO {
  @JsonKey(name: 'dt')
  final int? dt;

  @JsonKey(name: 'temp')
  final TemperatureDTO? temp;

  @JsonKey(name: 'weather')
  final List<WeatherDTO>? weather;

  const DailyForecastDTO({this.dt, this.temp, this.weather});

  factory DailyForecastDTO.fromJson(Map<String, dynamic> json) =>
      _$DailyForecastDTOFromJson(json);
}
