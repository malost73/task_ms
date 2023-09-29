import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:task_ms/api/weather_api.dart';
import 'package:task_ms/pages/city_page.dart';
import 'package:task_ms/pages/weather_forecast_page.dart';
import 'package:task_ms/utilities/shared_preference.dart';

class FetchDataPage extends StatefulWidget {
  const FetchDataPage({Key? key}) : super(key: key);

  @override
  _FetchDataPageState createState() => _FetchDataPageState();
}

class _FetchDataPageState extends State<FetchDataPage> {
  void getLocationData() async {
    try {
      var cityName = await SharedPreferenceCity().getCityName();
      if (cityName == null) {
        var tappedName =
            await Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const CityPage();
        }));
        if (tappedName != null) {
          cityName = tappedName.toString().trim();
          await SharedPreferenceCity().setCityName(cityName);
        }
      }
      var weatherInfo =
          await WeatherApi().fetchWeatherForecast(city: cityName, isCity: true);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WeatherForecastPage(locationWeather: weatherInfo);
      }));
    } catch (e) {
      // print('$e');
      log('$e');
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.blue),
      ),
    );
  }
}
