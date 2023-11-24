import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/weather_forecast_entity.dart';
import 'package:task_ms/utilities/forecast_util.dart';

class CurrentWeatherDetail extends StatelessWidget {
  final WeatherForecastEntity weatherForecast;

  const CurrentWeatherDetail({Key? key, required this.weatherForecast})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = weatherForecast.current;
    var pressure = forecastList!.pressure! * 0.75006375542;
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