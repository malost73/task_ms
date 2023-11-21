import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/core/usecases/base_usecase.dart';
import 'package:task_ms/features/weather_forecast/data/repositories/city_name_repository_impl.dart';
import 'package:task_ms/features/weather_forecast/domain/models/coordinates_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/get_city_name_list.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/get_first_city_name.dart';
import 'package:task_ms/features/weather_forecast/presentation/home_page/bloc/home_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/home_page/bloc/home_state.dart';
import 'package:task_ms/utilities/constants.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // final CityNameRepositoryImpl cityNameRepositoryImpl;
  final GetFirstCityName getFirstCityName;

  HomeBloc(this.getFirstCityName) : super(HomeInitial()) {
    on<FirstStartCheckingEvent>(_firstStartCheckingEvent);
  }

  _firstStartCheckingEvent(
      FirstStartCheckingEvent event, Emitter<HomeState> emit) async {
    emit(HomeFirstStartChecking());
    final firstCityName = await getFirstCityName.call(NoParams());
    emit(firstCityName
        .fold((failure) => HomeError(message: _mapFailureToMessage(failure)),
            (cityName) {
      return cityName != null
          ? HomeSavedCityNames(
              coordinates:
                  CoordinatesModel(lat: cityName.lat, lon: cityName.lon))
          : HomeFirstStart();
    }));
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
