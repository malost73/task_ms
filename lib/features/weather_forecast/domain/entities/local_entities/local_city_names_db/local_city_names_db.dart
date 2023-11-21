import 'package:realm/realm.dart';

part 'local_city_names_db.g.dart';

@RealmModel()
class $LocalCityNamesDB {
  @PrimaryKey()
  late ObjectId id;
  late String? ru;
  late String? en;
}
