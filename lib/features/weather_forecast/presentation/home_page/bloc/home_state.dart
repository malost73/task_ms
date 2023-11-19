import 'package:equatable/equatable.dart';
import 'package:task_ms/features/weather_forecast/domain/models/weather_forecast_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeFirstStartChecking extends HomeState {}

class HomeFirstStart extends HomeState {}

class HomeSavedWeather extends HomeState {
  final WeatherForecastModel? weatherForecastModel;

  const HomeSavedWeather({required this.weatherForecastModel});

  @override
  List<Object> get props => [weatherForecastModel ?? 0];
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}
