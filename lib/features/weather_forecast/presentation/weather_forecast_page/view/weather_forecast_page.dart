import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/core/constants/constants_colors.dart';
import 'package:task_ms/core/routes/app_router.gr.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/bloc/weather_forecast_bloc.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/bloc/weather_forecast_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/bloc/weather_forecast_state.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/widgets/check_saved_icon.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/widgets/weather_city_name.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/widgets/weather_forecast_builder.dart';

@RoutePage()
class WeatherForecastPage extends StatefulWidget {
  final CityNameEntity cityName;

  const WeatherForecastPage({super.key, required this.cityName});

  @override
  State<WeatherForecastPage> createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  @override
  void didChangeDependencies() {
    context.read<WeatherForecastBloc>().add(GetWeatherEvent(
        coordinates: CoordinatesEntity(
            lon: widget.cityName.lon, lat: widget.cityName.lat)));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            excludeHeaderSemantics: true,
            title: FittedBox(
              fit: BoxFit.fitWidth,
              child: WeatherCityName(
                  cityName: widget.cityName.localNames?.ru ??
                      widget.cityName.name ??
                      ''),
            ),
            backgroundColor: ConstantsColors.containerCurrent,
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: CheckSavedIcon(cityName: widget.cityName),
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
    );
  }
}
