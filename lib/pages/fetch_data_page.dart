import 'package:flutter/material.dart';
import 'package:task_ms/api/weather_api.dart';
import 'package:task_ms/models/weather_forecast_daily.dart';
import 'package:task_ms/pages/city_page.dart';
import 'package:task_ms/pages/weather_forecast_page.dart';
import 'package:task_ms/utilities/shared_preference.dart';

class FetchDataPage extends StatefulWidget {
  const FetchDataPage({Key? key}) : super(key: key);

  @override
  _FetchDataPageState createState() => _FetchDataPageState();
}

class _FetchDataPageState extends State<FetchDataPage> {
  Future<String?> getSharedPreferenceCity() async {
    String? cityName = await SharedPreferenceCity().getCityName();
    return cityName;
  }

  Future<WeatherForecast?> getWeatherInfo() async {
    var cityName = await getSharedPreferenceCity();
    WeatherForecast? weatherInfo;
    if (cityName != null) {
      weatherInfo = await WeatherApi().fetchWeatherForecast(city: cityName);
    } else {
      weatherInfo =
          await Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const CityPage();
      }));
    }
    return weatherInfo;
  }

  Future<void> getWeatherData() async {
    var weatherForecast = await getWeatherInfo();
    if (weatherForecast != null) {
      await SharedPreferenceCity().setCityName(weatherForecast.city.name);
      await SharedPreferenceCity().setListCityName([weatherForecast.city.name]);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return WeatherForecastPage(weatherForecast: weatherForecast);
      }));
    }
  }

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
