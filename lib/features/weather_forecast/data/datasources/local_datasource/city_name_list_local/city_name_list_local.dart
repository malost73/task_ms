import 'package:realm/realm.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/city_name_dto/city_name_dto.dart';
import 'package:task_ms/features/weather_forecast/domain/models/city_name_model.dart';

abstract class CityNameListLocal {
  // Future<CityNameModel> addItem(Params? params);

  Future<void> addItem(CityNameDTO? cityNameDTO);

  RealmResults<CityNameModel> getItems();

  RealmList<CityNameModel> getFirstItem();

  Future<void> deleteItem(String? id);

// Future<WeatherForecastModel?> getFirstItem();

// Future<List<WeatherForecastModel?>?> getAllLocalWeathers();
}
