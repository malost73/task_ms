import 'package:json_annotation/json_annotation.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/city_name_dto/city_name_dto.dart';

part 'city_name_list_dto.g.dart';

@JsonSerializable()
class CityNameListDTO {
  // @JsonKey(name: 'name')
  final List<CityNameDTO>? cityNameList;

  const CityNameListDTO({this.cityNameList});

  factory CityNameListDTO.fromJson(Map<String, dynamic> json) =>
      _$CityNameListDTOFromJson(json);
}
