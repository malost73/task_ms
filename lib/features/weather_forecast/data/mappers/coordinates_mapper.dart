import 'package:task_ms/features/weather_forecast/data/dtos/coordinates_dto/coordinates_dto.dart';
import 'package:task_ms/features/weather_forecast/domain/models/coordinates_model.dart';

extension CoordinatesMapper on CoordinatesDTO {
  CoordinatesModel toDomain() {
    return CoordinatesModel(lon: lon, lat: lat);
  }
}
