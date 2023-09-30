import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_ms/api/weather_api.dart';
import 'package:task_ms/models/weather_forecast_daily.dart';
import 'package:task_ms/utilities/shared_preference.dart';

class CityPage extends StatefulWidget {
  const CityPage({Key? key}) : super(key: key);

  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  late String cityName;
  late bool checkSearchAction;

  @override
  void initState() {
    super.initState();
    cityName = '';
    checkSearchAction = true;
    FocusManager.instance.primaryFocus?.unfocus();
    // print(getSharedPreferenceCity());
  }

  _showToast(String msg) {
    Fluttertoast.cancel();
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
    );
  }

  Future<WeatherForecast?> checkCityName(String tappedName) async {
    if (tappedName != '') {
      String cityName = tappedName.trim();
      var weatherInfo = await WeatherApi().fetchWeatherForecast(city: cityName);
      if (weatherInfo != null) {
        return weatherInfo;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (checkSearchAction) {
          Navigator.pop(context);
          return Future.value(true);
        } else {
          setState(() {
            checkSearchAction = true;
          });
        }
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: checkSearchAction
              ? const Text('Мои города')
              : TextField(
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
                    cityName = value;
                  },
                ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () async {
                if (checkSearchAction) {
                  setState(() {
                    checkSearchAction = !checkSearchAction;
                  });
                } else {
                  var weatherInfo = await checkCityName(cityName);
                  if (weatherInfo != null) {
                    Navigator.pop(context, weatherInfo);
                  } else {
                    _showToast(
                        'Местоположение не найдено.\nПожалуйста проверьте введенные данные.');
                  }
                }
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            SafeArea(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 0, top: 20, bottom: 20),
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: ' Город или район',
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Color(0xFF343434),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide.none),
                        ),
                        onChanged: (value) {
                          cityName = value;
                        },
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        var weatherInfo = await checkCityName(cityName);
                        if (weatherInfo != null) {
                          Navigator.pop(context, weatherInfo);
                        } else {
                          _showToast(
                              'Местоположение не найдено.\nПожалуйста проверьте данные.');
                        }
                      },
                      icon: const Icon(Icons.search))
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.all(0),
              child: ListTile(
                onTap: () async {
                  var weatherInfo = await WeatherApi().fetchWeatherForecast();
                  if (weatherInfo != null) {
                    Navigator.pop(context, weatherInfo);
                  }
                },
                selected: true,
                leading: Icon(Icons.location_on),
                title: Text('Моё местоположение'),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            FutureBuilder(
              future: getSharedPreferenceCity(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                if (!snapshot.hasError && snapshot.hasData) {
                  if (snapshot.data!.isNotEmpty) {
                    final List<String> cityNameList = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      addAutomaticKeepAlives: true,
                      padding: const EdgeInsets.all(15),
                      itemCount: cityNameList.length,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            color: const Color(0xFF343434),
                            child: ListTile(
                              title: Text(
                                cityNameList[index],
                              ),
                            ),
                          ),
                        );
                      },
                    );
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
      ),
    );
  }

  Future<List<String>> getSharedPreferenceCity() async {
    List<String>? cityNameList = await SharedPreferenceCity().getListCityName();
    return cityNameList ?? [];
  }
}
