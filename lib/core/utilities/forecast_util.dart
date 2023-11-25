import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_ms/core/constants/constants_api.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/weather_entity.dart';

class ForecastUtil {
  static String getFormattedDate(int? dt) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch((dt ?? 0) * 1000);
    var fullDate = DateFormat('EEE, MMM d, y').format(date);
    return '${fullDate.split(',')[0]}, ${fullDate.split(',')[1]}';
  }

  static String getFormattedTime(int? dt) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch((dt ?? 0) * 1000);
    var time = '${date.hour}:00';
    return time;
  }

  static String getImageUrl(WeatherEntity? weather) {
    return '${ConstantsApi.weatherImagesUrl}${weather?.icon}.png';
  }

  static getItem(IconData iconData, int value, String units) {
    return Column(
      children: <Widget>[
        Icon(iconData, size: 28.0),
        const SizedBox(height: 10.0),
        Text(
          '$value',
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 10.0),
        Text(
          units,
          style: const TextStyle(fontSize: 15.0),
        ),
      ],
    );
  }
}
