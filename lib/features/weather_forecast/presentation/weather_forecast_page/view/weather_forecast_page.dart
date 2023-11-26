import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/core/constants/constants_colors.dart';
import 'package:task_ms/core/routes/app_router.gr.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/check_saved_city.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/delete_city_name.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/get_weather_forecast.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/save_city_name.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/bloc/weather_forecast_bloc.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/bloc/weather_forecast_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/bloc/weather_forecast_state.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/widgets/check_saved_icon.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/widgets/weather_city_name.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/widgets/weather_forecast_builder.dart';

@RoutePage()
class WeatherForecastPage extends StatelessWidget {
  final CityNameEntity cityName;

  const WeatherForecastPage({super.key, required this.cityName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherForecastBloc(
          context.read<CheckSavedCity>(),
          context.read<GetWeatherForecast>(),
          context.read<SaveCityName>(),
          context.read<DeleteCityName>())
        ..add((GetWeatherEvent(
            coordinates:
                CoordinatesEntity(lon: cityName.lon, lat: cityName.lat)))),
      child: BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              excludeHeaderSemantics: true,
              title: FittedBox(
                fit: BoxFit.fitWidth,
                child: WeatherCityName(
                    cityName: cityName.localNames?.ru ?? cityName.name ?? ''),
              ),
              backgroundColor: ConstantsColors.containerCurrent,
              elevation: 0,
              centerTitle: true,
              automaticallyImplyLeading: false,
              leading: CheckSavedIcon(cityName: cityName),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.location_city),
                  onPressed: () async {
                    context.router.push(
                      SavedCitiesRoute(isFirstStart: false),
                    );
                  },
                ),
              ],
            ),
            body: WeatherForecastBuilder(),
          );
        },
      ),
    );
  }
}
