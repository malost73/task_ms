import 'package:realm/realm.dart';

part 'coordinates_db.g.dart';

@RealmModel()
class $CoordinatesDB {
  @PrimaryKey()
  late ObjectId id;
  late double? lon;
  late double? lat;
}
