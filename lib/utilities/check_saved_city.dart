import 'package:task_ms/models/weather_forecast.dart';
import 'package:task_ms/utilities/shared_preference.dart';

class CheckSavedCity {
  Future<bool> checkSavedCity(WeatherForecast weatherForecast) async {
    List<String>? cityNameList = await SharedPreferenceCity().getListCityName();
    if (cityNameList != null) {
      if (cityNameList.isNotEmpty) {
        if (cityNameList.contains(weatherForecast.city.name)) {
          return true;
        }
      }
    }
    return false;
  }
}
