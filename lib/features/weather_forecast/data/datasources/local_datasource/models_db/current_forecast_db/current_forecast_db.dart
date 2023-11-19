import 'package:realm/realm.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/weather_db/weather_db.dart';

part 'current_forecast_db.g.dart';

@RealmModel()
class $CurrentForecastDB {
  @PrimaryKey()
  late ObjectId id;
  late int? dt;
  late double? temp;
  late int? pressure;
  late int? humidity;
  late double? windSpeed;
  late List<$WeatherDB> weather;

// String getIconUrl() {
//   return '${ConstantsApi.weatherImagesUrl}${weather![0].icon}.png';
// }
}
