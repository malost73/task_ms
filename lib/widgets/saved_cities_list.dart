import 'package:task_ms/utilities/shared_preference.dart';

class SavedCitiesList {
  Future<List<String>> getSharedPreferenceCity() async {
    List<String>? cityNameList = await SharedPreferenceCity().getListCityName();
    return cityNameList ?? [];
  }
}
