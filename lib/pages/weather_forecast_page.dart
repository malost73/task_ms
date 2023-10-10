import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task_ms/models/city_info.dart';
import 'package:task_ms/pages/city_page.dart';
import 'package:task_ms/utilities/constants.dart';
import 'package:task_ms/utilities/shared_preference.dart';
import 'package:task_ms/widgets/weather_forecast_builder.dart';

class WeatherForecastPage extends StatefulWidget {
  final CityInfo cityInfo;

  const WeatherForecastPage({Key? key, required this.cityInfo})
      : super(key: key);

  @override
  State<WeatherForecastPage> createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  late bool _checkSavedCity;
  late String _lat;
  late String _lon;
  late String _name;
  String _title = '';

  @override
  void initState() {
    _title = _name = widget.cityInfo.name;
    _lat = widget.cityInfo.lat;
    _lon = widget.cityInfo.lon;
    _checkSavedCity = widget.cityInfo.saved;
    super.initState();
  }

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
          child: Text(_title),
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
                  _title = _name = returnParameters.name;
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
