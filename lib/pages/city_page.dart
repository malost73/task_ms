import 'package:flutter/material.dart';
import 'package:task_ms/models/city_info.dart';
import 'package:task_ms/models/coordinates.dart';
import 'package:task_ms/pages/search_city_page.dart';
import 'package:task_ms/pages/weather_forecast_page.dart';
import 'package:task_ms/utilities/check_saved_city.dart';
import 'package:task_ms/utilities/constants.dart';
import 'package:task_ms/utilities/shared_preference.dart';
import 'package:task_ms/widgets/saved_cities_list.dart';

class CityPage extends StatefulWidget {
  final bool? isFirstStart;

  const CityPage({Key? key, this.isFirstStart = false}) : super(key: key);

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  late bool _isFirstStart;

  @override
  void initState() {
    super.initState();
    if (widget.isFirstStart != null) {
      _isFirstStart = widget.isFirstStart!;
    }
    FocusManager.instance.primaryFocus?.unfocus();
  }

  // navigatorIsFirstStart(WeatherForecast weatherInfo, bool checkSavedCity) {
  //   if (isFirstStart) {
  //     SharedPreferenceCity().setCityName(weatherInfo.city.name);
  //     SharedPreferenceCity().setListCityName([weatherInfo.city.name]);
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  //       return WeatherForecastPage(
  //           weatherInfo: weatherInfo, checkSavedCity: true);
  //     }));
  //   } else {
  //     Navigator.pop(context, ReturnParameters(weatherInfo, checkSavedCity));
  //   }
  // }

  void onTapFunction(Map<String, dynamic> cityInfo) async {
    var saved = await CheckSavedCity().checkSavedCity(
        Coordinates(lat: cityInfo['lat'], lon: cityInfo['lon']));
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return WeatherForecastPage(
          cityInfo: CityInfo(
              saved: saved,
              name: cityInfo['name'],
              lat: cityInfo['lat'].toString(),
              lon: cityInfo['lon'].toString()));
    }), (route) => false);
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
          // const Divider(
          //   color: ProjectColors.hintText,
          // ),
          // CurrentLocation(
          //     onTap: (String? lat, String? lon) => onTapFunction(lat, lon)),
          SavedCitiesList(
              onTap: (Map<String, dynamic> info) => onTapFunction(info)),
        ],
      ),
    );
  }
}
