import 'package:task_ms/api/constants_api.dart';
import 'package:task_ms/models/feels_like.dart';
import 'package:task_ms/models/temperature.dart';
import 'package:task_ms/models/weather.dart';

class Daily {
  int? dt;
  int? sunrise;
  int? sunset;
  int? moonrise;
  int? moonset;
  double? moonPhase;
  Temperature? temp;
  FeelsLike? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather>? weather;
  int? clouds;
  double? pop;
  double? uvi;

  Daily(
      {this.dt,
      this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonset,
      this.moonPhase,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.windSpeed,
      this.windDeg,
      this.windGust,
      this.weather,
      this.clouds,
      this.pop,
      this.uvi});

  Daily.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'].toDouble();
    temp = json['temp'] != null ? Temperature.fromJson(json['temp']) : null;
    feelsLike = json['feels_like'] != null
        ? FeelsLike.fromJson(json['feels_like'])
        : null;
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dew_point'].toDouble();
    windSpeed = json['wind_speed'].toDouble();
    windDeg = json['wind_deg'];
    windGust = json['wind_gust'].toDouble();
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    clouds = json['clouds'];
    pop = json['pop'].toDouble();
    uvi = json['uvi'].toDouble();
  }

  String getIconUrl() {
    return '${ConstantsApi.weatherImagesUrl}${weather![0].icon}.png';
  }
}
