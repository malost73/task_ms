import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/coordinates_db/coordinates_db.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/coordinates_dto/coordinates_dto.dart';
import 'package:task_ms/features/weather_forecast/domain/models/coordinates_model.dart';

extension CoordinatesMapperDB on $CoordinatesDB {
  CoordinatesModel toDomain() {
    return CoordinatesModel(lon: lon, lat: lat);
  }
}
