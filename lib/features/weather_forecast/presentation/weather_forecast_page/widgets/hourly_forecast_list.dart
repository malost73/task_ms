import 'package:flutter/material.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/weather_forecast_entity.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/widgets/hourly_forecast_card.dart';

class HourlyForecastList extends StatelessWidget {
  final WeatherForecastEntity weatherForecast;

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
