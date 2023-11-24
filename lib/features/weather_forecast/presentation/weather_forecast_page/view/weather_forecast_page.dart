import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/core/services/app_router.gr.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/check_saved_city.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/delete_city_name.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/get_weather_forecast.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/save_city_name.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/bloc/weather_forecast_bloc.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/bloc/weather_forecast_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/bloc/weather_forecast_state.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/widgets/weather_forecast_builder.dart';
import 'package:task_ms/utilities/constants_colors.dart';
import 'package:task_ms/utilities/shared_preference.dart';

@RoutePage()
class WeatherForecastPage extends StatefulWidget {
  final CoordinatesEntity coordinates;

  const WeatherForecastPage({super.key, required this.coordinates});

  @override
  State<WeatherForecastPage> createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  @override
  void didChangeDependencies() {
    context
        .read<WeatherForecastBloc>()
        .add(CheckSavedCityEvent(coordinates: widget.coordinates));
    // context
    //     .read<WeatherForecastBloc>()
    //     .add(CheckSavedCityEvent(coordinates: widget.coordinates));
    super.didChangeDependencies();
  }

  // late bool _checkSavedCity = widget.cityInfo.saved;
  // late String _lat = widget.cityInfo.lat;
  // late String _lon = widget.cityInfo.lon;
  // late String _name = widget.cityInfo.name;
  //
  // void onPressedFunction() async {
  //   List<Map<String, dynamic>> savedCitiesList =
  //       await SharedPreferenceCity().getListCityInfo();
  //   if (_checkSavedCity) {
  //     savedCitiesList.removeWhere(
  //       (item) => mapEquals(
  //           item,
  //           ({
  //             'name': _name,
  //             'lat': double.parse(_lat),
  //             'lon': double.parse(_lon)
  //           })),
  //     );
  //     await SharedPreferenceCity().setListCityInfo(savedCitiesList);
  //   } else {
  //     savedCitiesList.add({
  //       'name': _name,
  //       'lat': double.parse(_lat),
  //       'lon': double.parse(_lon)
  //     });
  //     await SharedPreferenceCity().setListCityInfo(savedCitiesList);
  //   }
  //   setState(() {
  //     _checkSavedCity = !_checkSavedCity;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherForecastBloc(
          context.read<CheckSavedCity>(),
          context.read<GetWeatherForecast>(),
          context.read<SaveCityName>(),
          context.read<DeleteCityName>()),
      child: BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
        // buildWhen: (prevState, curState) {
        //
        // },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              excludeHeaderSemantics: true,
              title: FittedBox(fit: BoxFit.fitWidth, child: test(context)),
              backgroundColor: ProjectColors.containerCurrentTemp,
              elevation: 0,
              centerTitle: true,
              automaticallyImplyLeading: false,
              leading: test2(context),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.location_city),
                  onPressed: () async {
                    context.router.push(SavedCitiesRoute(isFirstStart: false));
                    // var returnParameters = await Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return const CityPage(isFirstStart: false);
                    // }));
                    // if (returnParameters != null) {
                    //   setState(() {
                    //     _checkSavedCity = returnParameters.saved;
                    //     _name = returnParameters.name;
                    //     _lat = returnParameters.lat;
                    //     _lon = returnParameters.lon;
                    //   });
                    // }
                  },
                ),
              ],
            ),
            body: WeatherForecastBuilder(coordinates: widget.coordinates),
          );
        },
      ),
    );
  }

  Widget test(BuildContext context) {
    final state = context.read<WeatherForecastBloc>().state;
    if (state.isLoading) {
      return const Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: CircularProgressIndicator(),
          ));
    } else {
      if (state.weatherForecast != null && state.cityNameSaved != null) {
        return Text(state.cityNameSaved?.localNames?.ru ??
            state.cityNameSaved?.name ??
            '');
      } else {
        return Text('weather is null');
      }
    }
  }

  Widget test2(BuildContext context) {
    final state = context.read<WeatherForecastBloc>().state;
    if (state.isLoading) {
      return const Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: CircularProgressIndicator(),
          ));
    } else {
      if (state.cityNameSaved != null) {
        return IconButton(
            onPressed: () {
              context
                  .read<WeatherForecastBloc>()
                  .add(const DeleteCityNameEvent());
            },
            icon: const Icon(Icons.star));
      } else {
        return IconButton(
            onPressed: () {
              context
                  .read<WeatherForecastBloc>()
                  .add(const SaveCityNameEvent());
            },
            icon: const Icon(Icons.star_border));
      }
    }
  }
}
