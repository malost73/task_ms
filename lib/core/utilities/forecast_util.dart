import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_ms/core/constants/constants.dart';
import 'package:task_ms/core/constants/constants_api.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/weather_entity.dart';

class ForecastUtil {
  static String getFormattedDate(int? dt) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(
        (dt ?? 0) * Constants.fromMillisecondsSinceEpoch);
    var fullDate = DateFormat('EEE, MMM d, y').format(date);
    return '${fullDate.split(',')[0]}, ${fullDate.split(',')[1]}';
  }

  static String getFormattedTime(int? dt) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(
        (dt ?? 0) * Constants.fromMillisecondsSinceEpoch);
    var time = '${date.hour}:00';
    return time;
  }

  static String getImageUrl(WeatherEntity? weather) {
    return '${ConstantsApi.weatherImagesUrl}${weather?.icon}.png';
  }

  static String getSubtitle(String? country, String? state) {
    var result = country == null
        ? (state == null ? '' : state.toString())
        : country.toString() + (state == null ? '' : ', $state');
    return result;
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

  static String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Constants.serverFailureMessage;
      case CacheFailure:
        return Constants.serverFailureMessage;
      default:
        return Constants.unexpectedFailureMessage;
    }
  }
}
