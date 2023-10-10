import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_ms/models/city_name_list.dart';
import 'package:task_ms/utilities/constants.dart';

class CityNameApi {
  Future<CityNameList?> fetchCityName({String? city}) async {
    Map<String, String?> parameters;

    var params = {'appid': Strings.WEATHER_APP_ID, 'q': city, 'limit': '5'};
    parameters = params;

    var uri = Uri.https(
        Strings.WEATHER_BASE_URL_DOMAIN, Strings.CITY_NAME_PATH, parameters);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      return CityNameList.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
