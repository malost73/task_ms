import 'package:flutter/material.dart';

class Strings {
  static const String WEATHER_APP_ID = '';
  static const String WEATHER_UNITS = 'metric';
  static const String WEATHER_LANG = 'ru';
  static const String WEATHER_EXCLUDE = 'minutely';
  static const String WEATHER_BASE_SCHEME = 'https://';
  static const String WEATHER_BASE_URL_DOMAIN = 'api.openweathermap.org';
  static const String WEATHER_FORECAST_PATH = '/data/2.5/onecall';
  static const String CITY_NAME_PATH = '/geo/1.0/direct';

  static const String WEATHER_IMAGES_PATH = '/img/w/';
  static const String WEATHER_IMAGES_URL =
      WEATHER_BASE_SCHEME + WEATHER_BASE_URL_DOMAIN + WEATHER_IMAGES_PATH;

  static const String locationError =
      'Местоположение не найдено.\nПожалуйста проверьте данные.';

  static const String titleCityPage = 'Мои города';
  static const String hintSearchField = ' Город или район';
  static const String myLocation = 'Моё местоположение';
  static const String weekForecast = 'Прогноз на 7 дней';
}

class ProjectColors {
  static const Color widgetComponent = Color(0xFF343434);
  static const Color hintText = Colors.grey;
  static const Color containerCurrentTemp = Color(0xFF3E88CC);
}
