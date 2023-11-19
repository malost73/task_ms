import 'package:task_ms/features/weather_forecast/domain/models/local_city_names_model.dart';

class CityNameModel {
  const CityNameModel(
      {this.name,
      this.localNames,
      this.lat,
      this.lon,
      this.country,
      this.state});

  final String? name;
  final LocalCityNamesModel? localNames;
  final double? lat;
  final double? lon;
  final String? country;
  final String? state;
}
