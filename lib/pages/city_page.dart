import 'package:flutter/material.dart';
import 'package:task_ms/models/city_info.dart';
import 'package:task_ms/models/coordinates.dart';
import 'package:task_ms/pages/search_city_page.dart';
import 'package:task_ms/pages/weather_forecast_page.dart';
import 'package:task_ms/utilities/check_saved_city.dart';
import 'package:task_ms/utilities/constants.dart';
import 'package:task_ms/widgets/saved_cities_list.dart';

class CityPage extends StatefulWidget {
  final bool isFirstStart;

  const CityPage({Key? key, required this.isFirstStart}) : super(key: key);

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  late bool _isFirstStart;

  @override
  void initState() {
    super.initState();
    _isFirstStart = widget.isFirstStart;
  }

  void navigatorWeatherForecastPage(Map<String, dynamic> cityInfo, bool saved) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return WeatherForecastPage(
          cityInfo: CityInfo(
              saved: saved,
              name: cityInfo['name'],
              lat: cityInfo['lat'].toString(),
              lon: cityInfo['lon'].toString()));
    }), (route) => false);
  }

  void onTapFunction(Map<String, dynamic> cityInfo) async {
    var saved = await CheckSavedCity().checkSavedCity(
        Coordinates(lat: cityInfo['lat'], lon: cityInfo['lon']));
    navigatorWeatherForecastPage(cityInfo, saved);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.titleCityPage),
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchCityPage(isFirstStart: _isFirstStart);
                }));
              }),
        ],
      ),
      body: ListView(
        children: [
          SavedCitiesList(
              onTap: (Map<String, dynamic> info) => onTapFunction(info)),
        ],
      ),
    );
  }
}
