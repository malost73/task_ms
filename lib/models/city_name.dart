import 'package:task_ms/models/local_names_city.dart';

class CityName {
  String? name;
  LocalNames? localNames;
  double? lat;
  double? lon;
  String? country;
  String? state;

  CityName(
      {this.name,
      this.localNames,
      this.lat,
      this.lon,
      this.country,
      this.state});

  CityName.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    localNames = json['local_names'] != null
        ? LocalNames.fromJson(json['local_names'])
        : null;
    lat = json['lat'].toDouble();
    lon = json['lon'].toDouble();
    country = json['country'];
    state = json['state'];
  }
}
