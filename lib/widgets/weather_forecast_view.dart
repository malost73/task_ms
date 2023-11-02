import 'package:flutter/material.dart';
import 'package:task_ms/models/weather_forecast.dart';
import 'package:task_ms/utilities/constants_colors.dart';
import 'package:task_ms/widgets/current_temperature.dart';
import 'package:task_ms/widgets/current_weather_detail.dart';
import 'package:task_ms/widgets/daily_forecast_list.dart';
import 'package:task_ms/widgets/hourly_forecast_list.dart';

class WeatherForecastView extends StatelessWidget {
  final WeatherForecast weatherForecast;

  const WeatherForecastView({super.key, required this.weatherForecast});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60)),
              child: Container(
                color: ProjectColors.containerCurrentTemp,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CurrentTemperature(weatherForecast: weatherForecast),
                    const SizedBox(height: 20.0),
                    CurrentWeatherDetail(weatherForecast: weatherForecast),
                    HourlyForecastList(weatherForecast: weatherForecast),
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
}
