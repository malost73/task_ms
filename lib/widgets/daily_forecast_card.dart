import 'package:flutter/material.dart';
import 'package:task_ms/models/weather_forecast.dart';
import 'package:task_ms/utilities/constants.dart';
import 'package:task_ms/utilities/constants_colors.dart';
import 'package:task_ms/utilities/forecast_util.dart';

class DailyForecastCard extends StatelessWidget {
  final WeatherForecast weatherForecast;
  final int index;

  const DailyForecastCard(
      {super.key, required this.weatherForecast, required this.index});

  @override
  Widget build(BuildContext context) {
    var forecastList = weatherForecast.daily;
    DateTime date = DateTime.fromMillisecondsSinceEpoch(
        forecastList![index].dt! * Constants.fromMillisecondsSinceEpoch);
    var fullDate = ForecastUtil.getFormattedDate(date);
    var dayOfWeek = '${fullDate.split(',')[0]}, ${fullDate.split(',')[1]}';
    var tempMax = forecastList[index].temp!.max.toStringAsFixed(0);
    var tempMin = forecastList[index].temp!.min.toStringAsFixed(0);
    var icon = forecastList[index].getIconUrl();
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Text(
                dayOfWeek,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Flexible(
              child: Image.network(icon, scale: 1.3),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '$tempMax° ',
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '/ $tempMin°',
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: ProjectColors.hintText,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
