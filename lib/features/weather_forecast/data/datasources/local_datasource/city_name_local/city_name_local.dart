import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';

abstract class CityNameLocal {
  void addItem(CityNameEntity? cityNameEntity);

  List<CityNameEntity>? getItems();

  CityNameEntity? getFirstItem();

  void deleteItem(CoordinatesEntity? coordinates);

  bool checkSavedItem(CoordinatesEntity coordinatesEntity);
}
