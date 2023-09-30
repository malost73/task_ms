import 'package:flutter/material.dart';
import 'package:task_ms/models/return_parametrs.dart';
import 'package:task_ms/models/weather_forecast_daily.dart';
import 'package:task_ms/pages/city_page.dart';
import 'package:task_ms/utilities/shared_preference.dart';
import 'package:task_ms/widgets/saved_cities_list.dart';
import 'package:task_ms/widgets/weather_forecast_view.dart';

class WeatherForecastPage extends StatefulWidget {
  final WeatherForecast? weatherInfo;
  final bool? checkSavedCity;

  const WeatherForecastPage({Key? key, this.weatherInfo, this.checkSavedCity})
      : super(key: key);

  @override
  State<WeatherForecastPage> createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  late WeatherForecast weatherForecast;
  late String cityName;
  late String title;
  late bool checkSavedCity;

  @override
  void initState() {
    initVariables();
    super.initState();
  }

  initVariables() async {
    cityName = '';
    if (widget.weatherInfo != null) {
      checkSavedCity = widget.checkSavedCity!;
      weatherForecast = widget.weatherInfo!;
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
          backgroundColor: const Color(0xFF3E88CC),
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: checkSavedCity
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border),
            onPressed: () async {
              List<String> savedCitiesList =
                  await SavedCitiesList().getSharedPreferenceCity();
              if (checkSavedCity) {
                savedCitiesList.remove(weatherForecast.city.name);
                await SharedPreferenceCity().setListCityName(savedCitiesList);
                // print(savedCitiesList);
              } else {
                savedCitiesList.add(weatherForecast.city.name);
                await SharedPreferenceCity().setListCityName(savedCitiesList);
                // print(savedCitiesList);
              }
              setState(() {
                checkSavedCity = !checkSavedCity;
              });
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.location_city),
              onPressed: () async {
                ReturnParameters returnParameters = await Navigator.push(
                    context, MaterialPageRoute(builder: (context) {
                  return const CityPage();
                }));
                if (returnParameters != null) {
                  setState(() {
                    checkSavedCity = returnParameters.savedCity;
                    title =
                        '${returnParameters.weatherForecast.city.name}, ${returnParameters.weatherForecast.city.country}';
                    weatherForecast = returnParameters.weatherForecast;
                  });
                }
              },
            ),
          ],
        ),
        body: weatherForecastView(weatherForecast));
  }
}
