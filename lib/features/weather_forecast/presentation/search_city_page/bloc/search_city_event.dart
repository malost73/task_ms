import 'package:equatable/equatable.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';

abstract class SearchCityEvent extends Equatable {
  const SearchCityEvent();

  @override
  List<Object> get props => [];
}

class SearchCityToInitialEvent extends SearchCityEvent {}

class SearchCityNameListEvent extends SearchCityEvent {
  final String? cityName;

  const SearchCityNameListEvent({required this.cityName});

  @override
  List<Object> get props => [cityName ?? 0];
}

class SaveCityIfFirstStart extends SearchCityEvent {
  final CityNameEntity? cityName;

  const SaveCityIfFirstStart({required this.cityName});

  @override
  List<Object> get props => [cityName ?? 0];
}

class CheckSavedCityName extends SearchCityEvent {
  final CoordinatesEntity coordinates;

  const CheckSavedCityName({required this.coordinates});

  @override
  List<Object> get props => [coordinates];
}
