import 'package:flutter/material.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/weather_forecast_entity.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/widgets/daily_forecast_card.dart';
import 'package:task_ms/utilities/constants.dart';
import 'package:task_ms/utilities/constants_colors.dart';

class DailyForecastList extends StatelessWidget {
  final WeatherForecastEntity weatherForecast;

  const DailyForecastList({Key? key, required this.weatherForecast})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Text(
            Constants.weekForecast,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemCount: weatherForecast.daily!.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(3),
                color: ProjectColors.widgetComponent,
                child: DailyForecastCard(
                    weatherForecast: weatherForecast, index: index),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
