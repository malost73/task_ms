import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/bloc/weather_forecast_bloc.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/widgets/weather_forecast_view.dart';

class WeatherForecastBuilder extends StatelessWidget {
  const WeatherForecastBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<WeatherForecastBloc>(context).state;

    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      if (state.weatherForecast != null) {
        return WeatherForecastView(weatherForecast: state.weatherForecast!);
      } else {
        return const Text('weather is null');
      }
    }
  }
}
