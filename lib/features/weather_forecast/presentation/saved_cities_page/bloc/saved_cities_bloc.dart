import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/features/weather_forecast/data/repositories/city_name_repository_impl.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/get_city_name_list.dart';
import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/bloc/saved_cities_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/bloc/saved_cities_state.dart';
import 'package:task_ms/utilities/constants.dart';

class SavedCitiesBloc extends Bloc<SavedCitiesEvent, SavedCitiesState> {
  final GetCityNameList getSavedCityNames;

  // final CityNameRepositoryImpl cityNameRepository;

  SavedCitiesBloc(this.getSavedCityNames) : super(SavedCitiesInitial()) {
    on<GetSavedCitiesEvent>(_getSavedCitiesEvent);
    // on<TapOnCityEvent>(_tapOnCityEvent);
    // on<TapOnSearchEvent>(_tapOnSearchEvent);
  }

  // _tapOnCityEvent(TapOnCityEvent event, Emitter<SavedCitiesState> emit) async {
  //   emit(());
  // }
  //
  // _tapOnSearchEvent(
  //     TapOnSearchEvent event, Emitter<SavedCitiesState> emit) async {
  //   emit(SavedCitiesLoading());
  // }

  _getSavedCitiesEvent(
      GetSavedCitiesEvent event, Emitter<SavedCitiesState> emit) async {
    emit(SavedCitiesLoading());
    final listSavedCities = await getSavedCityNames
        .call(const GetCitiesParams(cityName: '', fromServer: false));
    emit(listSavedCities.fold(
        (failure) => SavedCitiesError(message: _mapFailureToMessage(failure)),
        (listCityNames) =>
            SavedCitiesLoaded(cityNameListModel: listCityNames)));
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
