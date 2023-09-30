import 'package:flutter/material.dart';
import 'package:task_ms/utilities/check_saved_city.dart';
import 'package:task_ms/api/weather_api.dart';
import 'package:task_ms/models/weather_forecast_daily.dart';
import 'package:task_ms/pages/city_page.dart';
import 'package:task_ms/pages/weather_forecast_page.dart';
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
    checkSavedCity();
  }

  Future<void> checkSavedCity()  async {
    String? cityName = await SharedPreferenceCity().getCityName();
    if (cityName == null) {
      navigatorCityPage();
    } else {
      var weatherInfo = await WeatherApi().fetchWeatherForecast(city: cityName);
      if (weatherInfo != null) {
        bool checkSavedCity =
            await CheckSavedCity().checkSavedCity(weatherInfo);
        navigatorWeatherForecastPage(weatherInfo, checkSavedCity);
      }
    }
  }

  void navigatorCityPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const CityPage(isFirstStart: true);
    }));
  }

  void navigatorWeatherForecastPage(
      WeatherForecast weatherForecast, bool checkSavedCity) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return WeatherForecastPage(
        weatherInfo: weatherForecast,
        checkSavedCity: checkSavedCity,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
