import 'package:task_ms/models/feels_like.dart';
import 'package:task_ms/models/temperature.dart';
import 'package:task_ms/models/weather.dart';
import 'package:task_ms/utilities/constants.dart';

class WeatherList {
  late int dt;
  late int sunrise;
  late int sunset;
  late Temperature temperature;
  late FeelsLike feelsLike;
  late int pressure;
  late int humidity;
  late List<Weather> weather;
  late double speed;
  late int deg;
  late int clouds;

  WeatherList({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temperature,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.weather,
    required this.speed,
    required this.deg,
    required this.clouds,
    //required this.rain,
  });

  WeatherList.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temperature = (json['temp'] != null
        ? Temperature.fromJson(json['temp'])
        : null) as Temperature;
    feelsLike = (json['feels_like'] != null
        ? FeelsLike.fromJson(json['feels_like'])
        : null) as FeelsLike;
    pressure = json['pressure'];
    humidity = json['humidity'];
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather.add(Weather.fromJson(v));
      });
    }
    speed = json['speed'].toDouble();
    deg = json['deg'];
    clouds = json['clouds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['temp'] = temperature.toJson();
    data['feels_like'] = feelsLike.toJson();
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['weather'] = weather.map((v) => v.toJson()).toList();
    data['speed'] = speed;
    data['deg'] = deg;
    data['clouds'] = clouds;
    //data['rain'] = this.rain;
    return data;
  }

  String getIconUrl() {
    return '${Strings.WEATHER_IMAGES_URL}${weather[0].icon}.png';
  }
}
