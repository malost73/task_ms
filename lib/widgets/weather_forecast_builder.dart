import 'package:flutter/material.dart';
import 'package:task_ms/api/weather_api.dart';
import 'package:task_ms/models/weather_forecast.dart';
import 'package:task_ms/widgets/weather_forecast_view.dart';

class WeatherForecastBuilder extends StatelessWidget {
  final String lat;
  final String lon;

  const WeatherForecastBuilder({Key? key, required this.lat, required this.lon})
      : super(key: key);

  Future<WeatherForecast?> _fetchWeatherForecast(String lat, String lon) async {
    var weatherInfo =
        await WeatherApi().fetchWeatherForecast(lat: lat, lon: lon);
    return weatherInfo;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchWeatherForecast(lat.toString(), lon.toString()),
      builder:
          (BuildContext context, AsyncSnapshot<WeatherForecast?> snapshot) {
        if (snapshot.hasData) {
          return WeatherForecastView(weatherForecast: snapshot.data!);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
