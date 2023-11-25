import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_ms/core/constants/constants.dart';
import 'package:task_ms/core/utilities/forecast_util.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/current_forecast_entity.dart';

class CurrentWeatherDetail extends StatelessWidget {
  final CurrentForecastEntity? currentForecast;

  const CurrentWeatherDetail({super.key, required this.currentForecast});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ForecastUtil.getItem(
            FontAwesomeIcons.thermometerThreeQuarters,
            ((currentForecast?.pressure ?? 0) *
                    Constants.hectopascalToMillimetreOfMercury)
                .round(),
            'mm Hg'),
        ForecastUtil.getItem(
            FontAwesomeIcons.cloudRain, currentForecast?.humidity ?? 0, '%'),
        ForecastUtil.getItem(FontAwesomeIcons.wind,
            currentForecast?.windSpeed?.toInt() ?? 0, 'm/s'),
      ],
    );
  }
}
