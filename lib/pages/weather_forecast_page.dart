import 'package:flutter/material.dart';
import 'package:task_ms/api/weather_api.dart';
import 'package:task_ms/models/weather_forecast_daily.dart';
import 'package:task_ms/pages/city_page.dart';
import 'package:task_ms/widgets/bottom_list_view.dart';
import 'package:task_ms/widgets/detail_view.dart';
import 'package:task_ms/widgets/temp_view.dart';

class WeatherForecastPage extends StatefulWidget {
  final WeatherForecast? weatherForecast;

  const WeatherForecastPage({Key? key, this.weatherForecast}) : super(key: key);

  @override
  _WeatherForecastPageState createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  late Future<WeatherForecast> forecastObject;

  late String cityName;
  late String title;

  @override
  void initState() {
    super.initState();
    cityName = '';
    if (widget.weatherForecast != null) {
      title =
          '${widget.weatherForecast?.city.name}, ${widget.weatherForecast?.city.country}';
      forecastObject = Future.value(widget.weatherForecast);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        excludeHeaderSemantics: true,
        title: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
        // backgroundColor: Colors.transparent,
        backgroundColor: const Color(0xFF2C6996),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.my_location),
          onPressed: () async {
            var test = await WeatherApi().fetchWeatherForecast();
            setState(() {
              if (test != null) {
                title = '${test.city.name}, ${test.city.country}';
                forecastObject = Future.value(test);
              }
            });
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
                  forecastObject = Future.value(weatherInfo);
                });
              } else {
                var test =
                    await WeatherApi().fetchWeatherForecast(city: cityName);

                setState(() {
                  if (test != null) {
                    forecastObject = Future.value(test);
                  }
                });
              }
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[futureBuilderData()],
      ),
    );
  }

  Widget futureBuilderData() {
    return FutureBuilder<WeatherForecast>(
      future: forecastObject,
      builder: (BuildContext context, AsyncSnapshot<WeatherForecast> snapshot) {
        if (!snapshot.hasError &&
            snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data != null) {
            title =
                '${snapshot.data!.city.name}, ${snapshot.data!.city.country}';
            return Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60)),
                  child: Container(
                    color: const Color(0xFF2C6996),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 10.0),
                        TempView(snapshot: snapshot),
                        const SizedBox(height: 50.0),
                        DetailView(snapshot: snapshot),
                        const SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                BottomListView(snapshot: snapshot),
              ],
            );
          } else {
            return const Center(
              child: Text(
                'City not found\nPlease, enter correct city',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            );
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
