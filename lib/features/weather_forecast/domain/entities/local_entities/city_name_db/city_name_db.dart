import 'package:realm/realm.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/local_entities/local_city_names_db/local_city_names_db.dart';

part 'city_name_db.g.dart';

@RealmModel()
class $CityNameDB {
  @PrimaryKey()
  late ObjectId id;
  late String? name;
  late $LocalCityNamesDB? localNames;
  late double? lat;
  late double? lon;
  late String? country;
  late String? state;
}
