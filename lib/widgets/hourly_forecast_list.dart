import 'package:flutter/material.dart';
import 'package:task_ms/models/weather_forecast.dart';
import 'package:task_ms/widgets/hourly_forecast_card.dart';

class HourlyForecastList extends StatelessWidget {
  final WeatherForecast weatherForecast;

  const HourlyForecastList({Key? key, required this.weatherForecast})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          constraints: const BoxConstraints(minHeight: 150, maxHeight: 170),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemCount: 25,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(3),
              child: HourlyForecastCard(
                  weatherForecast: weatherForecast, index: index),
            ),
          ),
        ),
      ],
    );
  }
}
