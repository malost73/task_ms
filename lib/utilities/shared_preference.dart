import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceCity {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // Future<Map<String, dynamic>?> getCityInfo() async {
  //   final SharedPreferences prefs = await _prefs;
  //   final String? cityInfo = prefs.getString('general_city_info');
  //   if (cityInfo != null) {
  //     Map<String, dynamic> cityInfoMap = jsonDecode(cityInfo);
  //     return cityInfoMap;
  //   }
  //   return null;
  // }
  //
  // Future<void> setCityInfo(String name, String lat, String lon) async {
  //   final SharedPreferences prefs = await _prefs;
  //   Map<String, dynamic> cityInfo = {'name': name, 'lat': lat, 'lon': lon};
  //   prefs.setString('general_city_info', jsonEncode(cityInfo));
  // }

  Future<void> setListCityInfo(List<Map<String, dynamic>> listInfo) async {
    final SharedPreferences prefs = await _prefs;
    List<String> cityInfoList = [];
    for (int i = 0; i < listInfo.length; i++) {
      cityInfoList.add(jsonEncode(listInfo[i]));
    }
    prefs.setStringList("city_info_list", cityInfoList);
  }

  Future<List<Map<String, dynamic>>> getListCityInfo() async {
    final SharedPreferences prefs = await _prefs;
    final List<String>? listCityName = prefs.getStringList('city_info_list');
    if (listCityName != null) {
      List<Map<String, dynamic>> dataList = [];
      for (int i = 0; i < listCityName.length; i++) {
        Map<String, dynamic> data = jsonDecode(listCityName[i]);
        dataList.add(data);
      }
      return dataList;
    }
    return [];
  }
}
