import 'package:equatable/equatable.dart';
import 'package:task_ms/features/weather_forecast/domain/models/city_name_list_entity.dart';

abstract class SearchCityState extends Equatable {
  const SearchCityState();

  @override
  List<Object> get props => [];
}

class SearchCityInitial extends SearchCityState {}

class SearchCityLoading extends SearchCityState {
  // final String? cityName;
  //
  // const SearchCityLoading({required this.cityName});
  //
  // @override
  // List<Object> get props => [cityName ?? 0];
}

class SearchCityLoaded extends SearchCityState {
  final CityNameListModel? cityNameListModel;

  const SearchCityLoaded({required this.cityNameListModel});

  @override
  List<Object> get props => [cityNameListModel ?? 0];
}

class SearchCityError extends SearchCityState {
  final String message;

  const SearchCityError({required this.message});

  @override
  List<Object> get props => [message];
}
