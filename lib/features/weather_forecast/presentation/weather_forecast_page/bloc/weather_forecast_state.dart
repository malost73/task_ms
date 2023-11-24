import 'package:equatable/equatable.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/weather_forecast_entity.dart';

class WeatherForecastState extends Equatable {
  const WeatherForecastState(
      {this.weatherForecast, this.cityNameSaved, this.isLoading = false});

  final WeatherForecastEntity? weatherForecast;
  final CityNameEntity? cityNameSaved;
  final bool isLoading;

  WeatherForecastState copyWith({
    WeatherForecastEntity? weatherForecast,
    CityNameEntity? cityNameSaved,
    bool isLoading = false,
  }) =>
      WeatherForecastState(
          weatherForecast: weatherForecast ?? this.weatherForecast,
          cityNameSaved: cityNameSaved ?? this.cityNameSaved,
          isLoading: isLoading);

  @override
  List<Object> get props =>
      [weatherForecast ?? 0, cityNameSaved ?? 0, isLoading ?? 0];
}

// abstract class WeatherForecastState extends Equatable {
//   const WeatherForecastState();
//
//   @override
//   List<Object> get props => [];
// }
//
// class WeatherForecastInitial extends WeatherForecastState {}
// //
// class WeatherForecastLoading extends WeatherForecastState {}
//
// class WeatherForecastLoaded extends WeatherForecastState {
//   final WeatherForecastEntity? weatherForecast;
//
//   const WeatherForecastLoaded({this.weatherForecast});
//
//   @override
//   List<Object> get props => [weatherForecast ?? 0];
// }
//
// class CityNameChecked extends WeatherForecastState {
//   final bool cityNameSaved;
//
//   const CityNameChecked({required this.cityNameSaved});
//
//   @override
//   List<Object> get props => [cityNameSaved];
// }
//
// class WeatherForecastError extends WeatherForecastState {
//   final String message;
//
//   const WeatherForecastError({required this.message});
//
//   @override
//   List<Object> get props => [message];
// }
