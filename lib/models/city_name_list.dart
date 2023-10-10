import 'package:task_ms/models/city_name.dart';

class CityNameList {
  List<CityName>? cityName;

  CityNameList({this.cityName});

  CityNameList.fromJson(List<dynamic> json) {
    if (json != null) {
      cityName = <CityName>[];
      json.forEach((v) {
        cityName!.add(CityName.fromJson(v));
      });
    }
  }
}
