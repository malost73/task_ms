import 'package:realm/realm.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/coordinates_db/coordinates_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/current_forecast_db/current_forecast_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/daily_forecast_db/daily_forecast_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/hourly_forecast_db/hourly_forecast_db.dart';

part 'weather_forecast_db.g.dart';

@RealmModel()
class $WeatherForecastDB {
  @PrimaryKey()
  late ObjectId id;
  late $CoordinatesDB? coordinates;
  late $CurrentForecastDB? current;
  late List<$HourlyForecastDB> hourly;
  late List<$DailyForecastDB> daily;
}
