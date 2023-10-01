import 'package:flutter/material.dart';
import 'package:task_ms/models/weather_forecast.dart';
import 'package:task_ms/utilities/constants.dart';
import 'package:task_ms/widgets/daily_forecast_card.dart';

class DailyForecastList extends StatelessWidget {
  final WeatherForecast weatherForecast;

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
            Strings.weekForecast,
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
            itemCount: weatherForecast.list!.length,
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
