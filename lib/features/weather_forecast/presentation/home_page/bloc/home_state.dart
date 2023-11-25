import 'package:equatable/equatable.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/city_info_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeFirstStart extends HomeState {}

class HomeSavedCityNames extends HomeState {
  final CityNameEntity? cityName;

  const HomeSavedCityNames({required this.cityName});

  @override
  List<Object> get props => [cityName ?? 0];
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}
