import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceCity {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String?> getCityName() async {
    final SharedPreferences prefs = await _prefs;
    final String? cityName = prefs.getString('city_name');
    return cityName;
  }

  Future<void> setCityName(String cityName) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('city_name', cityName);
  }
}
