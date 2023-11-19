import 'package:json_annotation/json_annotation.dart';

part 'local_city_names_dto.g.dart';

@JsonSerializable()
class LocalCityNamesDTO {
  @JsonKey(name: 'ru')
  final String? ru;
  @JsonKey(name: 'en')
  final String? en;

  const LocalCityNamesDTO({this.ru, this.en});

  factory LocalCityNamesDTO.fromJson(Map<String, dynamic> json) =>
      _$LocalCityNamesDTOFromJson(json);
}
