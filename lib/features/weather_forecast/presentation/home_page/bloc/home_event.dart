import 'package:equatable/equatable.dart';
import 'package:task_ms/features/weather_forecast/domain/models/weather_forecast_model.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SavedWeatherEvent extends HomeEvent {
  // final WeatherForecastModel weatherForecastModel;
  //
  // const SavedWeatherEvent(this.weatherForecastModel);
}

class FirstStartEvent extends HomeEvent {}

class FirstStartCheckingEvent extends HomeEvent {}
