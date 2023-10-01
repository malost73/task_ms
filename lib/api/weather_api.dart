import 'dart:convert';
import 'dart:developer';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:task_ms/models/weather_forecast.dart';
import 'package:task_ms/utilities/constants.dart';
import 'package:task_ms/utilities/location_definition.dart';

class WeatherApi {
  Future<WeatherForecast?> fetchWeatherForecast({String? city}) async {
    Map<String, String?> parameters;

    if (city != null) {
      var params = {
        'appid': Strings.WEATHER_APP_ID,
        'lang': Strings.WEATHER_LANG,
        'units': 'metric',
        'q': city
      };
      parameters = params;
    } else {
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      Location location = Location();
      await location.getCurrentLocation();
      var params = {
        'appid': Strings.WEATHER_APP_ID,
        'lang': Strings.WEATHER_LANG,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
      };
      parameters = params;
    }

    var uri = Uri.https(Strings.WEATHER_BASE_URL_DOMAIN,
        Strings.WEATHER_FORECAST_PATH, parameters);
    log('request: ${uri.toString()}');

    var response = await http.get(uri);
    log('response: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
