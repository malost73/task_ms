// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:task_ms/api/constants_api.dart';
// import 'package:task_ms/entities/weather_forecast.dart';
//
// class WeatherApi {
//   Future<WeatherForecast?> fetchWeatherForecast(
//       {required String lat, required String lon}) async {
//     Map<String, String?> parameters;
//     var params = {
//       'appid': ConstantsApi.weatherAppId,
//       'lang': ConstantsApi.weatherLang,
//       'units': ConstantsApi.weatherUnits,
//       'exclude': ConstantsApi.weatherExclude,
//       'lat': lat.toString(),
//       'lon': lon.toString(),
//     };
//     parameters = params;
//
//     var uri = Uri.https(ConstantsApi.weatherBaseUrlDomain,
//         ConstantsApi.weatherForecastPath, parameters);
//     var response = await http.get(uri);
//
//     if (response.statusCode == ConstantsApi.successResponseCode) {
//       return WeatherForecast.fromJson(json.decode(response.body));
//     } else {
//       return null;
//     }
//   }
// }
