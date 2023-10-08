import 'package:flutter/material.dart';
import 'package:task_ms/models/city_info.dart';
import 'package:task_ms/models/city_name.dart';
import 'package:task_ms/models/coordinates.dart';
import 'package:task_ms/pages/weather_forecast_page.dart';
import 'package:task_ms/utilities/check_saved_city.dart';
import 'package:task_ms/utilities/shared_preference.dart';

class SearchCityList extends StatefulWidget {
  final List<CityName> cityNameList;
  final bool isFirstStart;

  const SearchCityList(
      {Key? key, required this.cityNameList, required this.isFirstStart})
      : super(key: key);

  @override
  State<SearchCityList> createState() => _SearchCityListState();
}

class _SearchCityListState extends State<SearchCityList> {
  late List<CityName>? _cityNameList;
  late bool _isFirstStart;

  @override
  void initState() {
    super.initState();
    _cityNameList = widget.cityNameList;
    _isFirstStart = widget.isFirstStart;
  }

  void navigatorWeatherForecastPage(
      bool saved, String name, String lat, String lon) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return WeatherForecastPage(
        cityInfo: CityInfo(saved: saved, name: name, lat: lat, lon: lon),
      );
    }), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: _cityNameList?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              onTap: () async {
                bool saved;
                String name = _cityNameList![index].localNames?.ru ??
                    _cityNameList![index].name!;
                double? lat = _cityNameList![index].lat;
                double? lon = _cityNameList![index].lon;
                if (_isFirstStart) {
                  await SharedPreferenceCity().setListCityInfo([
                    {'name': name, 'lat': lat, 'lon': lon}
                  ]);
                  saved = true;
                } else {
                  saved = await CheckSavedCity()
                      .checkSavedCity(Coordinates(lat: lat, lon: lon));
                }
                navigatorWeatherForecastPage(
                    saved, name, lat.toString(), lon.toString());
              },
              title: Text(_cityNameList![index].localNames?.ru ??
                  _cityNameList![index].name!),
              subtitle: Text(
                  '${_cityNameList![index].country}, ${_cityNameList![index].state}'),
            ),
          );
        },
      ),
    );
  }
}
