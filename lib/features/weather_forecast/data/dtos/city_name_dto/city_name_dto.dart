import 'package:json_annotation/json_annotation.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/local_city_names_dto/local_city_names_dto.dart';

part 'city_name_dto.g.dart';

@JsonSerializable()
class CityNameDTO {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'local_names')
  final LocalCityNamesDTO? localCityNames;

  @JsonKey(name: 'lat')
  final double? lat;

  @JsonKey(name: 'lon')
  final double? lon;

  @JsonKey(name: 'country')
  final String? country;

  @JsonKey(name: 'state')
  final String? state;

  const CityNameDTO(
      {this.name,
      this.localCityNames,
      this.lat,
      this.lon,
      this.country,
      this.state});

  factory CityNameDTO.fromJson(Map<String, dynamic> json) =>
      _$CityNameDTOFromJson(json);
}
