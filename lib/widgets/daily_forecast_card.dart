import 'package:flutter/material.dart';
import 'package:task_ms/models/weather_forecast.dart';
import 'package:task_ms/utilities/constants.dart';
import 'package:task_ms/utilities/forecast_util.dart';

class DailyForecastCard extends StatelessWidget {
  final WeatherForecast weatherForecast;
  final int index;

  const DailyForecastCard(
      {Key? key, required this.weatherForecast, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = weatherForecast.daily;
    var dayOfWeek = '';
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt! * 1000);
    var fullDate = ForecastUtil.getFormattedDate(date);
    dayOfWeek = '${fullDate.split(',')[0]}, ${fullDate.split(',')[1]}';
    var tempMax = forecastList[index].temp!.max.toStringAsFixed(0);
    var tempMin = forecastList[index].temp!.min.toStringAsFixed(0);
    var icon = forecastList[index].getIconUrl();
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  dayOfWeek,
                  style: const TextStyle(fontSize: 18),
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
