import 'package:flutter/material.dart';
import 'package:task_ms/models/city_info.dart';
import 'package:task_ms/models/coordinates.dart';
import 'package:task_ms/pages/city_page.dart';
import 'package:task_ms/pages/weather_forecast_page.dart';
import 'package:task_ms/utilities/check_saved_city.dart';
import 'package:task_ms/utilities/shared_preference.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _checkSavedCity();
  }

  Future<void> _checkSavedCity() async {
    var cityList = await SharedPreferenceCity().getListCityInfo();
    if (cityList.isEmpty) {
      _navigatorCityPage();
    } else {
      var cityInfo = cityList[0];
      double lat = cityInfo['lat'];
      double lon = cityInfo['lon'];
      String name = cityInfo['name'];
      var saved = await CheckSavedCity()
          .checkSavedCity(Coordinates(lat: lat, lon: lon));
      _navigatorWeatherForecastPage(
          name, lat.toString(), lon.toString(), saved);
    }
  }

  void _navigatorCityPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const CityPage(isFirstStart: true);
    }));
  }

  void _navigatorWeatherForecastPage(
      String name, String lat, String lon, bool saved) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return WeatherForecastPage(
        cityInfo: CityInfo(name: name, lat: lat, lon: lon, saved: saved),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
