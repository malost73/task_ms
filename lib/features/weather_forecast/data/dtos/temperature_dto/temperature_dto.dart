import 'package:json_annotation/json_annotation.dart';

part 'temperature_dto.g.dart';

@JsonSerializable()
class TemperatureDTO {
  @JsonKey(name: 'min')
  final double min;

  @JsonKey(name: 'max')
  final double max;

  const TemperatureDTO({required this.min, required this.max});

  factory TemperatureDTO.fromJson(Map<String, dynamic> json) =>
      _$TemperatureDTOFromJson(json);
}
