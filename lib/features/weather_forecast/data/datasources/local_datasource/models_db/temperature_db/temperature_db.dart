import 'package:realm/realm.dart';

part 'temperature_db.g.dart';

@RealmModel()
class $TemperatureDB {
  @PrimaryKey()
  late ObjectId id;
  late double? min;
  late double? max;
}
