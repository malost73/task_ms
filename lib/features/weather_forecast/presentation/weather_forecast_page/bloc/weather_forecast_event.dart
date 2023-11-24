import 'package:equatable/equatable.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';

abstract class WeatherForecastEvent extends Equatable {
  const WeatherForecastEvent();

  @override
  List<Object> get props => [];
}

class WeatherForecastLoadingEvent extends WeatherForecastEvent {
  final CoordinatesEntity? coordinates;

  const WeatherForecastLoadingEvent({required this.coordinates});

  @override
  List<Object> get props => [coordinates ?? 0];
}

class CheckSavedCityEvent extends WeatherForecastEvent {
  final CoordinatesEntity coordinates;

  const CheckSavedCityEvent({required this.coordinates});

  @override
  List<Object> get props => [coordinates];
}

class SaveCityNameEvent extends WeatherForecastEvent {
  final CityNameEntity? cityName;

  const SaveCityNameEvent({this.cityName});

  @override
  List<Object> get props => [cityName ?? 0];
}

class DeleteCityNameEvent extends WeatherForecastEvent {
  final CityNameEntity? cityName;

  const DeleteCityNameEvent({this.cityName});

  @override
  List<Object> get props => [cityName ?? 0];
}
