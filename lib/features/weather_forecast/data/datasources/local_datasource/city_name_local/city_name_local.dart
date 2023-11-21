import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/city_name_db/city_name_db.dart';
import 'package:task_ms/features/weather_forecast/domain/models/city_name_entity.dart';

abstract class CityNameLocal {
  // void addItem(CityNameDTO? cityNameModel);

  void addItem(CityNameModel cityNameModel);

  List<CityNameModel>? getItems();

  CityNameModel? getFirstItem();

  void deleteItem(CityNameDB cityNameDB);
}
