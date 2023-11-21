import 'package:equatable/equatable.dart';

abstract class SavedCitiesEvent extends Equatable {
  const SavedCitiesEvent();

  @override
  List<Object> get props => [];
}

class GetSavedCitiesEvent extends SavedCitiesEvent {}

class TapOnCityEvent extends SavedCitiesEvent {}

class TapOnSearchEvent extends SavedCitiesEvent {}
