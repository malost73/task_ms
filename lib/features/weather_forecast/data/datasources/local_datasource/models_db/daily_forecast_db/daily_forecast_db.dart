import 'package:realm/realm.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/temperature_db/temperature_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/weather_db/weather_db.dart';

part 'daily_forecast_db.g.dart';

@RealmModel()
class $DailyForecastDB {
  @PrimaryKey()
  late ObjectId id;
  late int? dt;
  late $TemperatureDB? temp;
  late List<$WeatherDB> weather;

// String getIconUrl() {
//   return '${ConstantsApi.weatherImagesUrl}${weather![0].icon}.png';
// }
}
