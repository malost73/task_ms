import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task_ms/models/city_info.dart';
import 'package:task_ms/pages/city_page.dart';
import 'package:task_ms/utilities/constants_colors.dart';
import 'package:task_ms/utilities/shared_preference.dart';
import 'package:task_ms/widgets/weather_forecast_builder.dart';

class WeatherForecastPage extends StatefulWidget {
  final CityInfo cityInfo;

  const WeatherForecastPage({super.key, required this.cityInfo});

  @override
  State<WeatherForecastPage> createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  late bool _checkSavedCity = widget.cityInfo.saved;
  late String _lat = widget.cityInfo.lat;
  late String _lon = widget.cityInfo.lon;
  late String _name = widget.cityInfo.name;

  void onPressedFunction() async {
    List<Map<String, dynamic>> savedCitiesList =
        await SharedPreferenceCity().getListCityInfo();
    if (_checkSavedCity) {
      savedCitiesList.removeWhere(
        (item) => mapEquals(
            item,
            ({
              'name': _name,
              'lat': double.parse(_lat),
              'lon': double.parse(_lon)
            })),
      );
      await SharedPreferenceCity().setListCityInfo(savedCitiesList);
    } else {
      savedCitiesList.add({
        'name': _name,
        'lat': double.parse(_lat),
        'lon': double.parse(_lon)
      });
      await SharedPreferenceCity().setListCityInfo(savedCitiesList);
    }
    setState(() {
      _checkSavedCity = !_checkSavedCity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        excludeHeaderSemantics: true,
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(_name),
        ),
        backgroundColor: ProjectColors.containerCurrentTemp,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: _checkSavedCity
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border),
            onPressed: () => onPressedFunction()),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.location_city),
            onPressed: () async {
              var returnParameters = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return const CityPage(isFirstStart: false);
              }));
              if (returnParameters != null) {
                setState(() {
                  _checkSavedCity = returnParameters.saved;
                  _name = returnParameters.name;
                  _lat = returnParameters.lat;
                  _lon = returnParameters.lon;
                });
              }
            },
          ),
        ],
      ),
      body: WeatherForecastBuilder(lat: _lat, lon: _lon),
    );
  }
}
