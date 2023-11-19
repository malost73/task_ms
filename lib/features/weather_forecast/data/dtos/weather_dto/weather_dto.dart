import 'package:json_annotation/json_annotation.dart';

part 'weather_dto.g.dart';

@JsonSerializable()
class WeatherDTO {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'main')
  final String main;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'icon')
  final String icon;

  const WeatherDTO({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherDTOFromJson(json);
}
