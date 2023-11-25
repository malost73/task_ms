import 'package:flutter/material.dart';
import 'package:task_ms/core/utilities/forecast_util.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/hourly_forecast_entity.dart';

class HourlyForecastCard extends StatelessWidget {
  final HourlyForecastEntity? hourlyForecast;

  const HourlyForecastCard({super.key, required this.hourlyForecast});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              ForecastUtil.getFormattedTime(hourlyForecast?.dt),
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
          Center(
            child: Image.network(
                ForecastUtil.getImageUrl(hourlyForecast?.weather?[0]),
                scale: 1.3),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${hourlyForecast?.temp?.toStringAsFixed(0)}° ',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
