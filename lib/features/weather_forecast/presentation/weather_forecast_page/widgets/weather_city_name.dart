import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/core/constants/constants.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/bloc/weather_forecast_bloc.dart';

class WeatherCityName extends StatelessWidget {
  final String cityName;

  const WeatherCityName({super.key, required this.cityName});

  @override
  Widget build(BuildContext context) {
    final state = context.read<WeatherForecastBloc>().state;
    if (state.isLoading) {
      return Transform.scale(
        scale: 0.6,
        child: const CircularProgressIndicator(),
      );
    } else {
      if (state.weatherForecast != null && !(state.isLoading)) {
        return Text(cityName);
      } else {
        return const Text(Constants.noWeather);
      }
    }
  }
}
