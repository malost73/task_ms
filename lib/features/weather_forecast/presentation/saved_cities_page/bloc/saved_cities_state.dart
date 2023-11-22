import 'package:equatable/equatable.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_list_entity.dart';

abstract class SavedCitiesState extends Equatable {
  const SavedCitiesState();

  @override
  List<Object> get props => [];
}

class SavedCitiesInitial extends SavedCitiesState {}

class SavedCitiesLoading extends SavedCitiesState {}

class SavedCitiesLoaded extends SavedCitiesState {
  final List<CityNameEntity>? cityNameListEntity;

  const SavedCitiesLoaded({required this.cityNameListEntity});

  @override
  List<Object> get props => [cityNameListEntity ?? []];
}

class SavedCitiesError extends SavedCitiesState {
  final String message;

  const SavedCitiesError({required this.message});

  @override
  List<Object> get props => [message];
}
