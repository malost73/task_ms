import 'package:json_annotation/json_annotation.dart';

part 'coordinates_dto.g.dart';

@JsonSerializable()
class CoordinatesDTO {
  @JsonKey(name: 'lon')
  final double? lon;

  @JsonKey(name: 'lat')
  final double? lat;

  const CoordinatesDTO({this.lon, this.lat});

  factory CoordinatesDTO.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesDTOFromJson(json);
}
