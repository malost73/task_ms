import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_ms/api/weather_api.dart';
import 'package:task_ms/models/weather_forecast_daily.dart';

class CityPage extends StatefulWidget {
  const CityPage({Key? key}) : super(key: key);

  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  String cityName = '';

  @override
  void initState() {
    super.initState();
    FocusManager.instance.primaryFocus?.unfocus();
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
        Navigator.pop(context);
        return Future.value(true);
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  cursorColor: Colors.blueGrey[800],
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Город',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.black87,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide.none),
                    icon: Icon(
                      Icons.location_city,
                      color: Colors.black87,
                      size: 50.0,
                    ),
                  ),
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              TextButton(
                child: const Text(
                  'Поиск',
                  style: TextStyle(fontSize: 30.0),
                ),
                onPressed: () {
                  checkCityName(cityName.trim()).then((value) {
                    if (value != null) {
                      Navigator.pop(context, value);
                    } else {
                      _showToast(
                          'Город не найден.\nПроверьте правильность введенных данных.');
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
