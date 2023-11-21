import 'package:realm/realm.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/local_city_names_db/local_city_names_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/city_name_db/city_name_db.dart';

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
      print(e.message);
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
    try {
      _realm.write(() {
        _realm.delete(cityNameDB);
      });
    } on RealmException catch (e) {
      print(e.message);
    }
  }
}
