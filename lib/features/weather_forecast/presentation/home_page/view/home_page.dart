import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/core/services/app_router.gr.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';
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
            context.router.replace(
              WeatherForecastRoute(
                cityName: CityNameEntity(
                    name: state.cityName?.name,
                    localNames: state.cityName?.localNames,
                    lat: state.cityName?.lat,
                    lon: state.cityName?.lon,
                    country: state.cityName?.country,
                    state: state.cityName?.state),
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
