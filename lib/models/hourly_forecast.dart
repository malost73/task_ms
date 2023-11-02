import 'package:task_ms/api/constants_api.dart';
import 'package:task_ms/models/weather.dart';

class Hourly {
  int? dt;
  double? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? uvi;
  int? clouds;
  int? visibility;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather>? weather;
  double? pop;

  Hourly(
      {this.dt,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.uvi,
      this.clouds,
      this.visibility,
      this.windSpeed,
      this.windDeg,
      this.windGust,
      this.weather,
      this.pop});

  Hourly.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    temp = json['temp'].toDouble();
    feelsLike = json['feels_like'].toDouble();
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dew_point'].toDouble();
    uvi = json['uvi'].toDouble();
    clouds = json['clouds'];
    visibility = json['visibility'];
    windSpeed = json['wind_speed'].toDouble();
    windDeg = json['wind_deg'];
    windGust = json['wind_gust'].toDouble();
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    pop = json['pop'].toDouble();
  }

  String getIconUrl() {
    return '${ConstantsApi.weatherImagesUrl}${weather![0].icon}.png';
  }
}
