import 'package:task_ms/models/coordinates.dart';

class City {
  late int id;
  late String name;
  late Coordinates coordinates;
  late String country;
  late int population;
  late int timezone;

  City({
    required this.id,
    required this.name,
    required this.coordinates,
    required this.country,
    required this.population,
    required this.timezone,
  });

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coordinates = (json['coord'] != null
        ? Coordinates.fromJson(json['coord'])
        : null) as Coordinates;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['coord'] = coordinates.toJson();
    data['country'] = country;
    data['population'] = population;
    data['timezone'] = timezone;
    return data;
  }
}
