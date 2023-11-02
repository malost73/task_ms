import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_ms/models/weather_forecast.dart';
import 'package:task_ms/utilities/constants.dart';
import 'package:task_ms/utilities/forecast_util.dart';

class CurrentWeatherDetail extends StatelessWidget {
  final WeatherForecast weatherForecast;

  const CurrentWeatherDetail({super.key, required this.weatherForecast});

  @override
  Widget build(BuildContext context) {
    var forecastList = weatherForecast.current;
    var pressure =
        forecastList!.pressure! * Constants.hectopascalToMillimetreOfMercury;
    var humidity = forecastList.humidity;
    var wind = forecastList.windSpeed;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ForecastUtil.getItem(FontAwesomeIcons.thermometerThreeQuarters,
            pressure.round(), 'mm Hg'),
        ForecastUtil.getItem(FontAwesomeIcons.cloudRain, humidity!, '%'),
        ForecastUtil.getItem(FontAwesomeIcons.wind, wind!.toInt(), 'm/s'),
      ],
    );
  }
}
