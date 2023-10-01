import 'package:flutter/material.dart';
import 'package:task_ms/models/return_parameters.dart';
import 'package:task_ms/utilities/check_saved_city.dart';
import 'package:task_ms/api/weather_api.dart';
import 'package:task_ms/models/weather_forecast.dart';
import 'package:task_ms/pages/weather_forecast_page.dart';
import 'package:task_ms/utilities/constants.dart';
import 'package:task_ms/utilities/shared_preference.dart';
import 'package:task_ms/utilities/show_toast.dart';
import 'package:task_ms/widgets/current_location.dart';
import 'package:task_ms/widgets/saved_cities_list.dart';

class CityPage extends StatefulWidget {
  final bool? isFirstStart;

  const CityPage({Key? key, this.isFirstStart = false}) : super(key: key);

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  late String cityName;
  late bool isFirstStart;

  @override
  void initState() {
    super.initState();
    cityName = '';
    if (widget.isFirstStart != null) {
      isFirstStart = widget.isFirstStart!;
    }
    FocusManager.instance.primaryFocus?.unfocus();
  }

  navigatorIsFirstStart(WeatherForecast weatherInfo, bool checkSavedCity) {
    if (isFirstStart) {
      SharedPreferenceCity().setCityName(weatherInfo.city.name);
      SharedPreferenceCity().setListCityName([weatherInfo.city.name]);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return WeatherForecastPage(
            weatherInfo: weatherInfo, checkSavedCity: true);
      }));
    } else {
      Navigator.pop(context, ReturnParameters(weatherInfo, checkSavedCity));
    }
  }

  void onTapFunction(String? cityName) async {
    var weatherInfo = await WeatherApi().fetchWeatherForecast(city: cityName);
    if (weatherInfo != null) {
      bool savedCity = await CheckSavedCity().checkSavedCity(weatherInfo);
      navigatorIsFirstStart(weatherInfo, savedCity);
    } else {
      ShowToast().showToast(Strings.locationError);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.titleCityPage)),
      body: ListView(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 0, top: 20, bottom: 20),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: Strings.hintSearchField,
                      filled: true,
                      fillColor: ProjectColors.widgetComponent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
              ),
              IconButton(
                  onPressed: () => onTapFunction(cityName.trim()),
                  icon: const Icon(Icons.search))
            ],
          ),
          const Divider(
            color: ProjectColors.hintText,
          ),
          CurrentLocation(onTap: (String? cityName) => onTapFunction(cityName)),
          SavedCitiesList(onTap: (String? cityName) => onTapFunction(cityName)),
        ],
      ),
    );
  }
}
