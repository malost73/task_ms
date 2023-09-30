import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceCity {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String?> getCityName() async {
    final SharedPreferences prefs = await _prefs;
    final String? cityName = prefs.getString('general_city_name');
    return cityName;
  }

  Future<void> setCityName(String cityName) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('general_city_name', cityName);
  }

  Future<void> setListCityName(List<String> listCityName) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setStringList("city_name_list", listCityName);
  }

  Future<List<String>?> getListCityName() async {
    final SharedPreferences prefs = await _prefs;
    final List<String>? listCityName = prefs.getStringList('city_name_list');
    return listCityName;
  }
}
