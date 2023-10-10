import 'package:task_ms/models/current_forecast.dart';
import 'package:task_ms/models/daily_forecast.dart';
import 'package:task_ms/models/hourly_forecast.dart';

class WeatherForecast {
  double? lat;
  double? lon;
  String? timezone;
  int? timezoneOffset;
  Current? current;
  List<Hourly>? hourly;
  List<Daily>? daily;

  WeatherForecast(
      {this.lat,
      this.lon,
      this.timezone,
      this.timezoneOffset,
      this.current,
      this.hourly,
      this.daily});

  WeatherForecast.fromJson(Map<String, dynamic> json) {
    lat = json['lat'].toDouble();
    lon = json['lon'].toDouble();
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
    if (json['hourly'] != null) {
      hourly = <Hourly>[];
      json['hourly'].forEach((v) {
        hourly!.add(Hourly.fromJson(v));
      });
    }
    if (json['daily'] != null) {
      daily = <Daily>[];
      json['daily'].forEach((v) {
        daily!.add(Daily.fromJson(v));
      });
    }
  }
}
