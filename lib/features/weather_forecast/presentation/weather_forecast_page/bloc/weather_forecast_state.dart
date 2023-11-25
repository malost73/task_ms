import 'package:equatable/equatable.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/weather_forecast_entity.dart';

class WeatherForecastState extends Equatable {
  const WeatherForecastState(
      {this.weatherForecast,
      this.cityNameSaved = false,
      this.isLoading = false});

  final WeatherForecastEntity? weatherForecast;
  final bool cityNameSaved;
  final bool isLoading;

  WeatherForecastState copyWith({
    WeatherForecastEntity? weatherForecast,
    bool? cityNameSaved,
    bool isLoading = false,
  }) =>
      WeatherForecastState(
          weatherForecast: weatherForecast ?? this.weatherForecast,
          cityNameSaved: cityNameSaved ?? this.cityNameSaved,
          isLoading: isLoading);

  @override
  List<Object> get props =>
      [weatherForecast ?? 0, cityNameSaved, isLoading];
}
