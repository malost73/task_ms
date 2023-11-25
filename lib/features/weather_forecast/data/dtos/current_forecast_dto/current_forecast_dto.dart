import 'package:json_annotation/json_annotation.dart';
import 'package:task_ms/core/constants/constants_api.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/weather_dto/weather_dto.dart';

part 'current_forecast_dto.g.dart';

@JsonSerializable()
class CurrentForecastDTO {
  @JsonKey(name: 'dt')
  final int? dt;

  @JsonKey(name: 'temp')
  final double? temp;

  @JsonKey(name: 'pressure')
  final int? pressure;

  @JsonKey(name: 'humidity')
  final int? humidity;

  @JsonKey(name: 'wind_speed')
  final double? windSpeed;

  @JsonKey(name: 'weather')
  final List<WeatherDTO>? weather;

  const CurrentForecastDTO(
      {this.dt,
      this.temp,
      this.pressure,
      this.humidity,
      this.windSpeed,
      this.weather});

  factory CurrentForecastDTO.fromJson(Map<String, dynamic> json) =>
      _$CurrentForecastDTOFromJson(json);

// String getIconUrl() {
//   return '${ConstantsApi.weatherImagesUrl}${weather![0].icon}.png';
// }
}
