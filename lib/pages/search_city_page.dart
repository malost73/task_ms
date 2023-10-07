import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task_ms/api/city_name_api.dart';
import 'package:task_ms/models/city_info.dart';
import 'package:task_ms/models/city_name.dart';
import 'package:task_ms/models/city_name_list.dart';
import 'package:task_ms/models/coordinates.dart';
import 'package:task_ms/pages/weather_forecast_page.dart';
import 'package:task_ms/utilities/check_saved_city.dart';
import 'package:task_ms/utilities/shared_preference.dart';

class SearchCityPage extends StatefulWidget {
  final bool? isFirstStart;

  const SearchCityPage({Key? key, this.isFirstStart}) : super(key: key);

  @override
  State<SearchCityPage> createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCityPage> {
  late TextEditingController _textEditingController;
  late String cityName;
  late bool isFirstStart;

  @override
  void initState() {
    super.initState();
    cityName = '';
    if (widget.isFirstStart != null) {
      isFirstStart = widget.isFirstStart!;
    }
    _textEditingController = TextEditingController();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void dispose() {
    FocusManager.instance.primaryFocus?.unfocus();
    super.dispose();
  }

  Future<CityNameList?> fetchCityName(String cityName) async {
    if (cityName.trim() != '') {
      var cityNames = await CityNameApi().fetchCityName(city: cityName);

      return cityNames;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _textEditingController,
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: ' Город или район',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                borderSide: BorderSide.none),
          ),
          onChanged: (value) {
            setState(() {
              cityName = value;
            });
          },
        ),
        actions: [
          cityName != ''
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      cityName = '';
                      _textEditingController.clear();
                    });
                  },
                  icon: const Icon(Icons.clear))
              : Container(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: fetchCityName(cityName),
            builder:
                (BuildContext context, AsyncSnapshot<CityNameList?> snapshot) {
              if (snapshot.hasData) {
                List<CityName>? cityNameList = snapshot.data?.cityName;
                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: cityNameList?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          onTap: () async {
                            bool saved;
                            String name = cityNameList![index].localNames?.ru ??
                                cityNameList[index].name!;
                            if (isFirstStart) {
                              // await SharedPreferenceCity().setCityInfo(
                              //     name,
                              //     cityNameList[index].lat.toString(),
                              //     cityNameList[index].lon.toString());
                              await SharedPreferenceCity().setListCityInfo([
                                {
                                  'name': name,
                                  'lat': cityNameList[index].lat,
                                  'lon': cityNameList[index].lon
                                }
                              ]);
                              saved = true;
                            } else {
                              saved = await CheckSavedCity().checkSavedCity(
                                  Coordinates(
                                      lat: cityNameList[index].lat,
                                      lon: cityNameList[index].lon));
                            }
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                              return WeatherForecastPage(
                                cityInfo: CityInfo(
                                    saved: saved,
                                    name: name,
                                    lat: cityNameList[index].lat.toString(),
                                    lon: cityNameList[index].lon.toString()),
                              );
                            }), (route) => false);
                          },
                          title: Text(cityNameList![index].localNames?.ru ??
                              cityNameList[index].name!),
                          subtitle: Text(
                              '${cityNameList[index].country}, ${cityNameList[index].state}'),
                        ),
                      );
                    },
                  ),
                );
              } else if (cityName == '') {
                return Container();
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
