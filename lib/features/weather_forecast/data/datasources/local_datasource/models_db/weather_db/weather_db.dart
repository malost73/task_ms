import 'package:realm/realm.dart';

part 'weather_db.g.dart';

@RealmModel()
class $WeatherDB {
  @PrimaryKey()
  late int id;
  late String? main;
  late String? description;
  late String? icon;
}
