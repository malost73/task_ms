import 'package:flutter/material.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/hourly_forecast_entity.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/widgets/hourly_forecast_card.dart';

class HourlyForecastList extends StatelessWidget {
  final List<HourlyForecastEntity>? hourlyForecast;

  const HourlyForecastList({super.key, required this.hourlyForecast});

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
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemCount: 25,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(3),
              child: HourlyForecastCard(hourlyForecast: hourlyForecast?[index]),
            ),
          ),
        ),
      ],
    );
  }
}
