import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/core/services/app_router.gr.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/city_info_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/get_first_city_name.dart';
import 'package:task_ms/features/weather_forecast/presentation/home_page/bloc/home_bloc.dart';
import 'package:task_ms/features/weather_forecast/presentation/home_page/bloc/home_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/home_page/bloc/home_state.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(context.read<GetFirstCityName>()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            context.read<HomeBloc>().add(FirstStartCheckingEvent());
          } else if (state is HomeFirstStart) {
            context.replaceRoute(
              SavedCitiesRoute(isFirstStart: true),
            );
          } else if (state is HomeSavedCityNames) {
            // context.router.push(
            //   // WeatherForecastRoute(coordinates: CoordinatesEntity(lat: null, lon: null))
            //
            // );
            context.router.replace(
              WeatherForecastRoute(
                coordinates: CoordinatesEntity(
                  lat: state.coordinates?.lat,
                  lon: state.coordinates?.lon,
                ),
              ),
            );
          } else if (state is HomeError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
