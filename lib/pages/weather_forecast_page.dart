import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task_ms/api/weather_api.dart';
import 'package:task_ms/models/city_info.dart';
import 'package:task_ms/models/coordinates.dart';
import 'package:task_ms/models/weather_forecast.dart';
import 'package:task_ms/pages/city_page.dart';
import 'package:task_ms/utilities/check_saved_city.dart';
import 'package:task_ms/utilities/constants.dart';
import 'package:task_ms/utilities/shared_preference.dart';
import 'package:task_ms/widgets/weather_forecast_view.dart';

class WeatherForecastPage extends StatefulWidget {
  final CityInfo cityInfo;

  const WeatherForecastPage({Key? key, required this.cityInfo})
      : super(key: key);

  @override
  State<WeatherForecastPage> createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  late WeatherForecast weatherForecast;
  late String cityName;
  late bool checkSavedCity;
  late String lat;
  late String lon;
  late String name;
  String title = '';

  @override
  void initState() {
    initVariables();
    super.initState();
  }

  initVariables() async {
    title = name = widget.cityInfo.name;
    lat = widget.cityInfo.lat;
    lon = widget.cityInfo.lon;
    checkSavedCity = widget.cityInfo.saved;
  }

  Future<WeatherForecast?> fetchWeatherForecast(String lat, String lon) async {
    var weatherInfo =
        await WeatherApi().fetchWeatherForecast(lat: lat, lon: lon);
    return weatherInfo;
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
        backgroundColor: ProjectColors.containerCurrentTemp,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: checkSavedCity
              ? const Icon(Icons.star)
              : const Icon(Icons.star_border),
          onPressed: () async {
            List<Map<String, dynamic>> savedCitiesList =
                await SharedPreferenceCity().getListCityInfo();
            if (checkSavedCity) {
              print(savedCitiesList);
              savedCitiesList.removeWhere(
                (item) => mapEquals(
                    item,
                    ({
                      'name': name,
                      'lat': double.parse(lat),
                      'lon': double.parse(lon)
                    })),
              );

              print(savedCitiesList);
              await SharedPreferenceCity().setListCityInfo(savedCitiesList);
            } else {
              savedCitiesList.add({
                'name': name,
                'lat': double.parse(lat),
                'lon': double.parse(lon)
              });
              await SharedPreferenceCity().setListCityInfo(savedCitiesList);
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
              var returnParameters = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return const CityPage();
              }));
              if (returnParameters != null) {
                setState(() {
                  checkSavedCity = returnParameters.saved;
                  title = name = returnParameters.name;
                  lat = returnParameters.lat;
                  lon = returnParameters.lon;
                });
              }
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: fetchWeatherForecast(lat.toString(), lon.toString()),
        builder:
            (BuildContext context, AsyncSnapshot<WeatherForecast?> snapshot) {
          if (snapshot.hasData) {
            return WeatherForecastView(weatherForecast: snapshot.data!);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
