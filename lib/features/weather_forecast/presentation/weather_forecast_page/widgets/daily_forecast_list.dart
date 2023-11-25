import 'package:flutter/material.dart';
import 'package:task_ms/core/constants/constants.dart';
import 'package:task_ms/core/constants/constants_colors.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/daily_forecast_entity.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/widgets/daily_forecast_card.dart';

class DailyForecastList extends StatelessWidget {
  final List<DailyForecastEntity>? dailyForecast;

  const DailyForecastList({super.key, required this.dailyForecast});

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
            itemCount: dailyForecast?.length ?? 0,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(3),
                color: ProjectColors.widgetComponent,
                child: DailyForecastCard(dailyForecast: dailyForecast?[index]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
