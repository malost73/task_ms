import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/core/services/app_router.gr.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/city_info_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/get_first_city_name.dart';
import 'package:task_ms/features/weather_forecast/presentation/home_page/bloc/home_bloc.dart';
import 'package:task_ms/features/weather_forecast/presentation/home_page/bloc/home_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/home_page/bloc/home_state.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //
  // Future<void> _checkSavedCity() async {
  //   var cityList = await SharedPreferenceCity().getListCityInfo();
  //   if (cityList.isEmpty) {
  //     _navigatorCityPage();
  //   } else {
  //     var cityInfo = cityList[0];
  //     double lat = cityInfo['lat'];
  //     double lon = cityInfo['lon'];
  //     String name = cityInfo['name'];
  //     var saved = await CheckSavedCity()
  //         .checkSavedCity(Coordinates(lat: lat, lon: lon));
  //     _navigatorWeatherForecastPage(CityInfo(
  //         name: name, lat: lat.toString(), lon: lon.toString(), saved: saved));
  //   }
  // }

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
                  cityInfo: CityInfo(
                      name: 'name',
                      lat: state.coordinates!.lat.toString(),
                      lon: state.coordinates!.lon.toString(),
                      saved: false)),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
