import 'package:task_ms/models/weather_forecast_daily.dart';

class ReturnParameters{
  final WeatherForecast weatherForecast;
  final bool savedCity;

  ReturnParameters(this.weatherForecast, this.savedCity);
}