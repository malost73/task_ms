import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/features/weather_forecast/data/repositories/city_name_repository_impl.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/get_city_name_list.dart';
import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/bloc/saved_cities_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/bloc/saved_cities_state.dart';
import 'package:task_ms/features/weather_forecast/presentation/search_city_page/bloc/search_city_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/search_city_page/bloc/search_city_state.dart';
import 'package:task_ms/utilities/constants.dart';

class SearchCityBloc extends Bloc<SearchCityEvent, SearchCityState> {
  final GetCityNameList getCityNameList;

  // final CityNameRepositoryImpl cityNameRepository;

  SearchCityBloc(this.getCityNameList) : super(SearchCityInitial()) {
    on<SearchCityNameListEvent>(_searchCityNameListEvent);
    on<SearchCityToInitialEvent>(_searchCityToInitialEvent);
  }

  // _tapOnCityEvent(TapOnCityEvent event, Emitter<SavedCitiesState> emit) async {
  //   emit(());
  // }
  //
  // _tapOnSearchEvent(
  //     TapOnSearchEvent event, Emitter<SavedCitiesState> emit) async {
  //   emit(SavedCitiesLoading());
  // }

  _searchCityNameListEvent(
      SearchCityNameListEvent event, Emitter<SearchCityState> emit) async {
    emit(SearchCityLoading());
    final listSavedCities = await getCityNameList
        .call(GetCitiesParams(cityName: event.cityName, fromServer: true));
    emit(listSavedCities.fold(
        (failure) => SearchCityError(message: _mapFailureToMessage(failure)),
        (listCityNames) =>
            SearchCityLoaded(cityNameListEntity: listCityNames)));
  }

  _searchCityToInitialEvent(
      SearchCityToInitialEvent event, Emitter<SearchCityState> emit) async {
    emit(SearchCityInitial());
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Constants.serverFailureMessage;
      case CacheFailure:
        return Constants.serverFailureMessage;
      default:
        return 'Unexpected Error';
    }
  }
}
