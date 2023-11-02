import 'package:flutter/material.dart';
import 'package:task_ms/models/city_info.dart';
import 'package:task_ms/models/city_name.dart';
import 'package:task_ms/models/coordinates.dart';
import 'package:task_ms/pages/weather_forecast_page.dart';
import 'package:task_ms/utilities/check_saved_city.dart';
import 'package:task_ms/utilities/shared_preference.dart';

class SearchCityList extends StatelessWidget {
  final List<CityName> cityNameList;
  final bool isFirstStart;

  const SearchCityList(
      {super.key, required this.cityNameList, required this.isFirstStart});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: cityNameList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              onTap: () async {
                bool saved;
                String name = cityNameList[index].localNames?.ru ??
                    cityNameList[index].name!;
                double? lat = cityNameList[index].lat;
                double? lon = cityNameList[index].lon;
                if (isFirstStart) {
                  await SharedPreferenceCity().setListCityInfo([
                    {'name': name, 'lat': lat, 'lon': lon}
                  ]);
                  saved = true;
                } else {
                  saved = await CheckSavedCity()
                      .checkSavedCity(Coordinates(lat: lat, lon: lon));
                }
                if (context.mounted) {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return WeatherForecastPage(
                      cityInfo: CityInfo(
                          saved: saved,
                          name: name,
                          lat: lat.toString(),
                          lon: lon.toString()),
                    );
                  }), (route) => false);
                }
              },
              title: Text(cityNameList[index].localNames?.ru ??
                  cityNameList[index].name!),
              subtitle: Text(
                  '${cityNameList[index].country}, ${cityNameList[index].state}'),
            ),
          );
        },
      ),
    );
  }
}
