import 'package:flutter/material.dart';
import 'package:task_ms/core/utilities/forecast_util.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/current_forecast_entity.dart';

class CurrentTemperature extends StatelessWidget {
  final CurrentForecastEntity? currentForecast;

  const CurrentTemperature({super.key, required this.currentForecast});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  '${currentForecast?.temp?.toStringAsFixed(0)}°',
                  style: const TextStyle(
                    fontSize: 42.0,
                  ),
                ),
                Image.network(
                    ForecastUtil.getImageUrl(currentForecast?.weather?[0]),
                    scale: 0.8),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  currentForecast?.weather?[0].description?.toUpperCase() ?? '',
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
