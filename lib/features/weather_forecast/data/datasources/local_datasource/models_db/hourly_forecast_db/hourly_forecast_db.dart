import 'package:realm/realm.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/weather_db/weather_db.dart';

part 'hourly_forecast_db.g.dart';

@RealmModel()
class $HourlyForecastDB {
  @PrimaryKey()
  late ObjectId id;
  late int? dt;
  late double? temp;
  late List<$WeatherDB> weather;

// String getIconUrl() {
//   return '${ConstantsApi.weatherImagesUrl}${weather![0].icon}.png';
// }
}
