import 'package:task_ms/models/city_name.dart';

class CityNameList {
  List<CityName>? cityName;

  CityNameList({this.cityName});

  CityNameList.fromJson(List<dynamic> json) {
    cityName = <CityName>[];
    for (var v in json) {
      cityName!.add(CityName.fromJson(v));
    }
  }
}
