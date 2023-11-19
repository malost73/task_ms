import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/features/weather_forecast/presentation/home_page/bloc/home_bloc.dart';
import 'package:task_ms/features/weather_forecast/presentation/home_page/bloc/home_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/home_page/bloc/home_state.dart';
import 'package:task_ms/pages/city_page.dart';
import 'package:task_ms/pages/weather_forecast_page.dart';
import 'package:task_ms/utilities/check_saved_city.dart';
import 'package:task_ms/utilities/shared_preference.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(FirstStartCheckingEvent());
  }
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

  void _navigatorCityPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const CityPage(isFirstStart: true);
    }));
  }

  void _navigatorWeatherForecastPage(CityInfo cityInfo) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return WeatherForecastPage(
        cityInfo: cityInfo,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
