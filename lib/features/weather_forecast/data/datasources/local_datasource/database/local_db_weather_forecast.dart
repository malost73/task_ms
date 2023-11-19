import 'package:realm/realm.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/city_name_db/city_name_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/coordinates_db/coordinates_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/current_forecast_db/current_forecast_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/daily_forecast_db/daily_forecast_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/hourly_forecast_db/hourly_forecast_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/local_city_names_db/local_city_names_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/temperature_db/temperature_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/weather_db/weather_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/weather_forecast_db/weather_forecast_db.dart';
import 'package:task_ms/features/weather_forecast/domain/models/weather_forecast_model.dart';

// class LocalDatabase implements BaseDB<WeatherForecastDB, Function> {
class LocalDatabase {
  final Configuration _config = Configuration.local([
    CityNameDB.schema,
    CoordinatesDB.schema,
    CurrentForecastDB.schema,
    DailyForecastDB.schema,
    HourlyForecastDB.schema,
    LocalCityNamesDB.schema,
    TemperatureDB.schema,
    WeatherDB.schema,
    WeatherForecastDB.schema,
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

  void addItem(WeatherForecastDB weatherForecastDB) {
    try {
      _realm.write(() {
        _realm.add(weatherForecastDB);
      });
    } on RealmException catch (e) {
      print(e.message);
    }
  }

  RealmResults<WeatherForecastDB> getItems() {
    return _realm.all();
  }

  RealmObject getFirstItem(String? params) {
    return _realm.all<WeatherForecastDB>().first;
  }

  void deleteItem(WeatherForecastDB weatherForecastDB) {
    try {
      _realm.write(() {
        _realm.delete(weatherForecastDB);
      });
    } on RealmException catch (e) {
      print(e.message);
    }
  }

  void updateItem(WeatherForecastDB weatherForecastDB) {
    try {
      _realm.write(() {
        weatherForecastDB.id = ObjectId();
      });
    } on RealmException catch (e) {
      print(e.message);
    }
  }
}
