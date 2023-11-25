import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/bloc/weather_forecast_bloc.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/bloc/weather_forecast_event.dart';

class CheckSavedIcon extends StatelessWidget {
  final CityNameEntity cityName;

  const CheckSavedIcon({super.key, required this.cityName});

  @override
  Widget build(BuildContext context) {
    final state = context.read<WeatherForecastBloc>().state;
    if (state.isLoading) {
      return const Padding(
        padding: EdgeInsets.all(17),
        child: CircularProgressIndicator(strokeWidth: 2.3),
      );
    } else {
      if (state.weatherForecast != null) {
        if (state.cityNameSaved) {
          return IconButton(
              onPressed: () {
                context.read<WeatherForecastBloc>().add(DeleteCityNameEvent(
                    coordinates: CoordinatesEntity(
                        lat: cityName.lat, lon: cityName.lon)));
              },
              icon: const Icon(Icons.star));
        } else {
          return IconButton(
              onPressed: () {
                context
                    .read<WeatherForecastBloc>()
                    .add(SaveCityNameEvent(cityName: cityName));
              },
              icon: const Icon(Icons.star_border));
        }
      } else {
        return Container();
      }
    }
  }
}
