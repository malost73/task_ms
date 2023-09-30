import 'package:flutter/material.dart';
import 'package:task_ms/models/return_parametrs.dart';
import 'package:task_ms/utilities/check_saved_city.dart';
import 'package:task_ms/api/weather_api.dart';
import 'package:task_ms/models/weather_forecast_daily.dart';
import 'package:task_ms/pages/weather_forecast_page.dart';
import 'package:task_ms/utilities/shared_preference.dart';
import 'package:task_ms/utilities/toast.dart';
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
      ShowToast().showToast(
          'Местоположение не найдено.\nПожалуйста проверьте данные.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Мои города')),
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
                      hintText: ' Город или район',
                      filled: true,
                      fillColor: Color(0xFF343434),
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
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: const Color(0xFF343434),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: ListTile(
                    onTap: () => onTapFunction(null),
                    leading: const Icon(Icons.location_on),
                    title: const Text('Моё местоположение'),
                  ),
                ),
              ),
            ),
          ),
          FutureBuilder(
            future: SavedCitiesList().getSharedPreferenceCity(),
            builder:
                (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
              if (!snapshot.hasError && snapshot.hasData) {
                if (snapshot.data!.isNotEmpty) {
                  final List<String> cityNameList = snapshot.data!;
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    addAutomaticKeepAlives: true,
                    padding: const EdgeInsets.all(15),
                    itemCount: cityNameList.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: const Color(0xFF343434),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: ListTile(
                              onTap: () => onTapFunction(cityNameList[index]),
                              title: Text(
                                cityNameList[index],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                  );
                } else {
                  return Container();
                }
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
