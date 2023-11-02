import 'package:task_ms/api/constants_api.dart';
import 'package:task_ms/models/weather.dart';

class Current {
  int? dt;
  int? sunrise;
  int? sunset;
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

  Current(
      {this.dt,
      this.sunrise,
      this.sunset,
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
      this.weather});

  Current.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
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
    windGust = json['wind_gust'];
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
  }

  String getIconUrl() {
    return '${ConstantsApi.weatherImagesUrl}${weather![0].icon}.png';
  }
}
