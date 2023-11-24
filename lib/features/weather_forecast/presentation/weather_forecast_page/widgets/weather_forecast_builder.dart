import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/bloc/weather_forecast_bloc.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/bloc/weather_forecast_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/bloc/weather_forecast_state.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/widgets/weather_forecast_view.dart';

class WeatherForecastBuilder extends StatelessWidget {
  const WeatherForecastBuilder({super.key, required this.coordinates});

  final CoordinatesEntity coordinates;

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
        return Text('weather is null');
      }
    }
    // final state = BlocProvider.of<WeatherForecastBloc>(context).state;
    // if (state.weatherForecast) {
    //   context
    //       .read<WeatherForecastBloc>()
    //       .add(CheckSavedCityEvent(coordinates: coordinates));
    //   // return Container();
    // } else if (state is WeatherForecastLoading) {
    //   return const Center(
    //     child: CircularProgressIndicator(),
    //   );
    // } else if (state is CityNameChecked) {
    //   context
    //       .read<WeatherForecastBloc>()
    //       .add(WeatherForecastLoadingEvent(coordinates: coordinates));
    // } else if (state is WeatherForecastLoaded) {
    //   if (state.weatherForecast != null) {
    //     return WeatherForecastView(weatherForecast: state.weatherForecast!);
    //   } else {
    //     return const Center(child: Text('Weather is null'));
    //   }
    // } else if (state is WeatherForecastError) {
    //   return Center(child: Text(state.message));
    // }
    // return Container();
  }
}
