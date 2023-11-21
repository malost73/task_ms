import 'package:realm/realm.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/city_name_local/city_name_local.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/city_name_db/city_name_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/local_city_names_db/local_city_names_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/mappers_db/city_name_mapper_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/realm_database/local_db_city_name.dart';
import 'package:task_ms/features/weather_forecast/domain/models/city_name_entity.dart';

// @Injectable(as: WeatherLocalDataSource)
class CityNameLocalImpl implements CityNameLocal {
  // CityNameLocalImpl(this.localDatabase);

  static final LocalDatabase localDatabase = LocalDatabase();

  @override
  Future<void> addItem(CityNameModel cityNameModel) async {
    // final CityNameModel? weatherForecast =
    //     weatherForecastDTO?.toDomain();
    final CityNameDB cityNameDB = CityNameDB(
      ObjectId(),
      lat: cityNameModel.lat,
      lon: cityNameModel.lon,
      localNames: LocalCityNamesDB(ObjectId(),
          ru: cityNameModel.localNames?.ru, en: cityNameModel.localNames?.en),
      country: cityNameModel.country,
      state: cityNameModel.state,
    );

    localDatabase.addItem(cityNameDB);
  }

  @override
  void deleteItem(CityNameDB cityNameDB) {
    localDatabase.deleteItem(cityNameDB);
  }

  @override
  CityNameModel? getFirstItem() {
    final CityNameDB? cityNameDB = localDatabase.getFirstItem();
    if (cityNameDB != null) {
      return cityNameDB.toDomain();
    }
    return null;
  }

  @override
  List<CityNameModel>? getItems() {
    final List<CityNameDB>? listCityNameDB = localDatabase.getItems()?.toList();
    if ((listCityNameDB?.length ?? 0) > 0) {
      final listCityNameModel = listCityNameDB
          ?.map((CityNameDB element) => element.toDomain())
          .toList();
      return listCityNameModel;
    }
    return null;
  }
}
