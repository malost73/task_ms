import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_ms/api/constants_api.dart';
import 'package:task_ms/models/city_name_list.dart';

class CityNameApi {
  Future<CityNameList?> fetchCityName({String? city}) async {
    Map<String, String?> parameters;

    var params = {
      'appid': ConstantsApi.weatherAppId,
      'q': city,
      'limit': ConstantsApi.cityLimit
    };
    parameters = params;

    var uri = Uri.https(ConstantsApi.weatherBaseUrlDomain,
        ConstantsApi.cityNamePath, parameters);
    var response = await http.get(uri);

    if (response.statusCode == ConstantsApi.successResponseCode) {
      return CityNameList.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
