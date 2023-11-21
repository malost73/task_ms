import 'package:equatable/equatable.dart';

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
