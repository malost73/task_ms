import 'package:flutter/material.dart';
import 'package:task_ms/core/constants/constants_colors.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/weather_forecast_entity.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/widgets/current_forecast_detail.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/widgets/current_temperature.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/widgets/daily_forecast_list.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/widgets/hourly_forecast_list.dart';

class WeatherForecastView extends StatelessWidget {
  final WeatherForecastEntity weatherForecast;

  const WeatherForecastView({super.key, required this.weatherForecast});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60)),
              child: Container(
                color: ConstantsColors.containerCurrent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CurrentTemperature(
                        currentForecast: weatherForecast.current),
                    const SizedBox(height: 20.0),
                    CurrentWeatherDetail(
                        currentForecast: weatherForecast.current),
                    HourlyForecastList(hourlyForecast: weatherForecast.hourly),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            DailyForecastList(dailyForecast: weatherForecast.daily),
          ],
        )
      ],
    );
  }
}
