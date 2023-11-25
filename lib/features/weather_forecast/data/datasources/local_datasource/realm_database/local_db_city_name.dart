import 'package:flutter/foundation.dart';
import 'package:realm/realm.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/local_entities/city_name_db/city_name_db.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/local_entities/local_city_names_db/local_city_names_db.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';

class LocalDatabase {
  final Configuration _config = Configuration.local([
    CityNameDB.schema,
    LocalCityNamesDB.schema,
  ]);
  late Realm _realm;

  LocalDatabase() {
    openRealm();
  }

  openRealm() {
    _realm = Realm(_config);
  }

  closeRealm() {
    if (!_realm.isClosed) {
      _realm.close();
    }
  }

  void addItem(CityNameDB cityNameDB) {
    try {
      _realm.write(() {
        _realm.add(cityNameDB);
      });
    } on RealmException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
  }

  List<CityNameDB>? getItems() {
    final list = _realm.all<CityNameDB>().toList();
    if (list.isNotEmpty) {
      return list;
    }
    return null;
  }

  CityNameDB? getFirstItem() {
    final list = _realm.all<CityNameDB>().toList();
    if (list.isNotEmpty) {
      return list.first;
    }
    return null;
  }

  void deleteItem(CityNameDB cityNameDB) {
    var cityNameModel = _realm.query<CityNameDB>(
        r'lat == $0 and lon == $1', [cityNameDB.lat, cityNameDB.lon]).toList();
    if (cityNameModel.isNotEmpty) {
      try {
        _realm.write(() {
          _realm.delete(cityNameModel.first);
        });
      } on RealmException catch (e) {
        if (kDebugMode) {
          print(e.message);
        }
      }
    }
  }

  bool checkSaved(CoordinatesEntity coordinates) {
    double? lat = coordinates.lat;
    double? lon = coordinates.lon;
    final saved = _realm
        .query<CityNameDB>(r'lat == $0 and lon == $1', [lat, lon]).toList();
    if (saved.isNotEmpty) {
      return true;
    }
    return false;
  }
}
