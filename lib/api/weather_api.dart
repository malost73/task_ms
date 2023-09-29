import 'dart:convert';
import 'dart:developer';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:task_ms/models/weather_forecast_daily.dart';
import 'package:task_ms/utilities/constants.dart';
import 'package:task_ms/utilities/location.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String? city, bool? isCity}) async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Location location = Location();
    await location.getCurrentLocation();
    Map<String, String?> parameters;

    if (isCity == true) {
      var params = {
        'appid': Constants.WEATHER_APP_ID,
        'lang': Constants.WEATHER_LANG,
        'units': 'metric',
        'q': city
      };
      parameters = params;
    } else {
      var params = {
        'appid': Constants.WEATHER_APP_ID,
        'lang': Constants.WEATHER_LANG,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
      };
      parameters = params;
    }

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, parameters);
    log('request: ${uri.toString()}');

    var response = await http.get(uri);
    log('response: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}
