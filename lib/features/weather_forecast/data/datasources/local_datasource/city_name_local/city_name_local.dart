import 'package:task_ms/features/weather_forecast/domain/entities/local_entities/city_name_db/city_name_db.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';

abstract class CityNameLocal {
  // void addItem(CityNameDTO? cityNameEntity);

  void addItem(CityNameEntity cityNameEntity);

  List<CityNameEntity>? getItems();

  CityNameEntity? getFirstItem();

  void deleteItem(CityNameDB cityNameDB);
}
