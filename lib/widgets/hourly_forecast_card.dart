import 'package:flutter/material.dart';
import 'package:task_ms/utilities/constants.dart';
import 'package:task_ms/models/weather_forecast.dart';

class HourlyForecastCard extends StatelessWidget {
  final WeatherForecast weatherForecast;
  final int index;

  const HourlyForecastCard(
      {super.key, required this.weatherForecast, required this.index});

  @override
  Widget build(BuildContext context) {
    var forecastList = weatherForecast.hourly;
    DateTime date = DateTime.fromMillisecondsSinceEpoch(
        forecastList![index].dt! * Constants.fromMillisecondsSinceEpoch);
    var time = '${date.hour}:00';
    var temp = forecastList[index].temp!.toStringAsFixed(0);
    var icon = forecastList[index].getIconUrl();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              time,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
        Image.network(icon, scale: 1.2),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                '$temp° ',
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
