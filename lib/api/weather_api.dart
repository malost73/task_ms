import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:task_ms/models/weather_forecast.dart';
import 'package:task_ms/utilities/constants.dart';

class WeatherApi {
  Future<WeatherForecast?> fetchWeatherForecast(
      {required String lat, required String lon}) async {
    Map<String, String?> parameters;
    var params = {
      'appid': Strings.WEATHER_APP_ID,
      'lang': Strings.WEATHER_LANG,
      'units': Strings.WEATHER_UNITS,
      'exclude': Strings.WEATHER_EXCLUDE,
      'lat': lat.toString(),
      'lon': lon.toString(),
    };
    parameters = params;

    var uri = Uri.https(Strings.WEATHER_BASE_URL_DOMAIN,
        Strings.WEATHER_FORECAST_PATH, parameters);
    var response = await http.get(uri);
    log('response: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
