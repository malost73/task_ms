import 'package:json_annotation/json_annotation.dart';
import 'package:task_ms/api/constants_api.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/weather_dto/weather_dto.dart';

part 'hourly_forecast_dto.g.dart';

@JsonSerializable()
class HourlyForecastDTO {
  @JsonKey(name: 'dt')
  final int? dt;

  @JsonKey(name: 'temp')
  final double? temp;

  @JsonKey(name: 'weather')
  final List<WeatherDTO>? weather;

  const HourlyForecastDTO({this.dt, this.temp, this.weather});

  factory HourlyForecastDTO.fromJson(Map<String, dynamic> json) =>
      _$HourlyForecastDTOFromJson(json);

// String getIconUrl() {
//   return '${ConstantsApi.weatherImagesUrl}${weather![0].icon}.png';
// }
}
