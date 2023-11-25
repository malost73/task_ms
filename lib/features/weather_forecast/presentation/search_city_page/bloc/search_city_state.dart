import 'package:equatable/equatable.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';

abstract class SearchCityState extends Equatable {
  const SearchCityState();

  @override
  List<Object> get props => [];
}

class SearchCityInitial extends SearchCityState {}

class SearchCityLoading extends SearchCityState {}

class SearchCityLoaded extends SearchCityState {
  final List<CityNameEntity>? cityNameListEntity;

  const SearchCityLoaded({required this.cityNameListEntity});

  @override
  List<Object> get props => [cityNameListEntity ?? 0];
}

// class CityNameChecked extends SearchCityState {
//   final bool? cityNameSaved;
//
//   const CityNameChecked({required this.cityNameSaved});
//
//   @override
//   List<Object> get props => [cityNameSaved ?? 0];
// }

class SearchCityError extends SearchCityState {
  final String message;

  const SearchCityError({required this.message});

  @override
  List<Object> get props => [message];
}
