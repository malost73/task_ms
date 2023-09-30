import 'package:flutter/material.dart';
import 'package:task_ms/models/weather_forecast_daily.dart';
import 'package:task_ms/widgets/current_temperature.dart';
import 'package:task_ms/widgets/daily_forecast_list.dart';
import 'package:task_ms/widgets/current_weather_detail.dart';

Widget weatherForecastView(WeatherForecast weatherForecast) {
  return ListView(
    children: <Widget>[
      Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60)),
            child: Container(
              color: const Color(0xFF3E88CC),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 10.0),
                  CurrentTemperature(weatherForecast: weatherForecast),
                  const SizedBox(height: 50.0),
                  CurrentWeatherDetail(weatherForecast: weatherForecast),
                  const SizedBox(height: 30.0),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          DailyForecastList(weatherForecast: weatherForecast),
        ],
      )
    ],
  );
}
