import 'package:task_ms/features/weather_forecast/data/dtos/coordinates_dto/coordinates_dto.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';

extension CoordinatesMapper on CoordinatesDTO {
  CoordinatesEntity toDomain() {
    return CoordinatesEntity(lon: lon, lat: lat);
  }
}
