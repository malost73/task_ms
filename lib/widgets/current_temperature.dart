import 'package:flutter/material.dart';
import 'package:task_ms/models/weather_forecast.dart';

class CurrentTemperature extends StatelessWidget {
  final WeatherForecast weatherForecast;

  const CurrentTemperature({Key? key, required this.weatherForecast})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = weatherForecast.current;
    var icon = forecastList?.getIconUrl();
    var temp = forecastList?.temp?.toStringAsFixed(0);
    var description = forecastList!.weather![0].description.toUpperCase();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  '$temp°',
                  style: const TextStyle(
                    fontSize: 48.0,
                  ),
                ),
                Image.network(icon!, scale: 0.7),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
