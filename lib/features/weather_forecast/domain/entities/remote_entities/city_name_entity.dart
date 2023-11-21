import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/local_city_names_entity.dart';

class CityNameEntity {
  const CityNameEntity(
      {this.name,
      this.localNames,
      this.lat,
      this.lon,
      this.country,
      this.state});

  final String? name;
  final LocalCityNamesEntity? localNames;
  final double? lat;
  final double? lon;
  final String? country;
  final String? state;
}
