import 'package:realm/realm.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/city_name_local/city_name_local.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/realm_database/local_db_city_name.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/local_mappers/city_name_mapper_db.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/local_entities/city_name_db/city_name_db.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/local_entities/local_city_names_db/local_city_names_db.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';

// @Injectable(as: WeatherLocalDataSource)
class CityNameLocalImpl implements CityNameLocal {
  // CityNameLocalImpl(this.localDatabase);

  static final LocalDatabase localDatabase = LocalDatabase();

  @override
  void addItem(CityNameEntity? cityNameEntity) async {
    final CityNameDB cityNameDB = CityNameDB(
      ObjectId(),
      lat: cityNameEntity?.lat,
      lon: cityNameEntity?.lon,
      localNames: LocalCityNamesDB(ObjectId(),
          ru: cityNameEntity?.localNames?.ru,
          en: cityNameEntity?.localNames?.en),
      country: cityNameEntity?.country,
      state: cityNameEntity?.state,
    );

    localDatabase.addItem(cityNameDB);
  }

  @override
  void deleteItem(CityNameEntity? cityNameEntity) {
    final CityNameDB cityNameDB = CityNameDB(
      ObjectId(),
      lat: cityNameEntity?.lat,
      lon: cityNameEntity?.lon,
      localNames: LocalCityNamesDB(ObjectId(),
          ru: cityNameEntity?.localNames?.ru,
          en: cityNameEntity?.localNames?.en),
      country: cityNameEntity?.country,
      state: cityNameEntity?.state,
    );
    localDatabase.deleteItem(cityNameDB);
  }

  @override
  CityNameEntity? getFirstItem() {
    final CityNameDB? cityNameDB = localDatabase.getFirstItem();
    if (cityNameDB != null) {
      return cityNameDB.toDomain();
    }
    return null;
  }

  @override
  List<CityNameEntity>? getItems() {
    final List<CityNameDB>? listCityNameDB = localDatabase.getItems()?.toList();
    if ((listCityNameDB?.length ?? 0) > 0) {
      final listCityNameEntity = listCityNameDB
          ?.map((CityNameDB element) => element.toDomain())
          .toList();
      return listCityNameEntity;
    }
    return null;
  }

  @override
  CityNameEntity? checkSavedItem(CoordinatesEntity coordinates) {
    final CityNameDB? cityNameDB = localDatabase.checkSaved(coordinates);
    if (cityNameDB != null) {
      return cityNameDB.toDomain();
    }
    return null;
  }
}
