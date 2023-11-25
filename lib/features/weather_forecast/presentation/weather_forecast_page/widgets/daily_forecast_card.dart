import 'package:flutter/material.dart';
import 'package:task_ms/core/constants/constants_colors.dart';
import 'package:task_ms/core/utilities/forecast_util.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/daily_forecast_entity.dart';

class DailyForecastCard extends StatelessWidget {
  final DailyForecastEntity? dailyForecast;

  const DailyForecastCard({super.key, required this.dailyForecast});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Text(
                ForecastUtil.getFormattedDate(dailyForecast?.dt),
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Flexible(
              child: Image.network(
                  ForecastUtil.getImageUrl(dailyForecast?.weather?[0]),
                  scale: 1.3),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '${dailyForecast?.temp?.max?.toStringAsFixed(0)}° ',
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '/ ${dailyForecast?.temp?.min?.toStringAsFixed(0)}°',
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: ConstantsColors.hintText,
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
