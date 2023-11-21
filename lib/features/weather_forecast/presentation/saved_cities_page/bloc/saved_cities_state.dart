import 'package:equatable/equatable.dart';
import 'package:task_ms/features/weather_forecast/domain/models/city_name_list_entity.dart';

abstract class SavedCitiesState extends Equatable {
  const SavedCitiesState();

  @override
  List<Object> get props => [];
}

class SavedCitiesInitial extends SavedCitiesState {}

class SavedCitiesLoading extends SavedCitiesState {}

// class TapOnSearchState extends SavedCitiesState {}
//
// class TapOnItemState extends SavedCitiesState {}

class SavedCitiesLoaded extends SavedCitiesState {
  final CityNameListModel? cityNameListModel;

  const SavedCitiesLoaded({required this.cityNameListModel});

  @override
  List<Object> get props => [cityNameListModel ?? []];
}

class SavedCitiesError extends SavedCitiesState {
  final String message;

  const SavedCitiesError({required this.message});

  @override
  List<Object> get props => [message];
}
