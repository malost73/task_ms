import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_ms/models/weather_forecast.dart';
import 'package:task_ms/utilities/forecast_util.dart';

class CurrentWeatherDetail extends StatelessWidget {
  final WeatherForecast weatherForecast;

  const CurrentWeatherDetail({Key? key, required this.weatherForecast})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = weatherForecast.list;
    var pressure = forecastList![0].pressure * 0.75006375542;
    var humidity = forecastList[0].humidity;
    var wind = forecastList[0].speed;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ForecastUtil.getItem(FontAwesomeIcons.thermometerThreeQuarters,
            pressure.round(), 'mm Hg'),
        ForecastUtil.getItem(FontAwesomeIcons.cloudRain, humidity, '%'),
        ForecastUtil.getItem(FontAwesomeIcons.wind, wind.toInt(), 'm/s'),
      ],
    );
  }
}
