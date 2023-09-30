import 'package:flutter/material.dart';
import 'package:task_ms/api/weather_api.dart';
import 'package:task_ms/models/weather_forecast_daily.dart';
import 'package:task_ms/pages/city_page.dart';
import 'package:task_ms/widgets/weather_forecast_view.dart';

class WeatherForecastPage extends StatefulWidget {
  final WeatherForecast? weatherForecast;

  const WeatherForecastPage({Key? key, this.weatherForecast}) : super(key: key);

  @override
  _WeatherForecastPageState createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  late WeatherForecast weatherForecast;
  late String cityName;
  late String title;

  @override
  void initState() {
    super.initState();
    cityName = '';
    _putTitle();
  }

  void _putTitle() {
    if (widget.weatherForecast != null) {
      weatherForecast = widget.weatherForecast!;
      title = '${weatherForecast.city.name}, ${weatherForecast.city.country}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          excludeHeaderSemantics: true,
          title: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(title),
          ),
          // backgroundColor: Colors.transparent,
          // backgroundColor: const Color(0xFF2C6996),
          // backgroundColor: const Color(0xFF3586C4),
          // backgroundColor: const Color(0xFF3895EE),
          backgroundColor: const Color(0xFF3E88CC),
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading:
          IconButton(
            icon: const Icon(Icons.star),
            onPressed: () async {
              // var weatherInfo = await WeatherApi().fetchWeatherForecast();
              //
              // if (weatherInfo != null) {
              //   setState(() {
              //     title =
              //         '${weatherInfo.city.name}, ${weatherInfo.city.country}';
              //     weatherForecast = weatherInfo;
              //   });
              // }
            },
          ),

          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.location_city),
              onPressed: () async {
                var weatherInfo = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return const CityPage();
                }));
                if (weatherInfo != null) {
                  setState(() {
                    title =
                        '${weatherInfo.city.name}, ${weatherInfo.city.country}';
                    weatherForecast = weatherInfo;
                  });
                }
              },
            ),
          ],
        ),
        body: weatherForecastView(weatherForecast));
  }
}
