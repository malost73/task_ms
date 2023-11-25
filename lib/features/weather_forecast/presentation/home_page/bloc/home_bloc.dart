import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/core/utilities/forecast_util.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/get_first_city_name.dart';
import 'package:task_ms/features/weather_forecast/presentation/home_page/bloc/home_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/home_page/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetFirstCityName getFirstCityName;

  HomeBloc(this.getFirstCityName) : super(HomeInitial()) {
    on<FirstStartCheckingEvent>(_firstStartCheckingEvent);
  }

  _firstStartCheckingEvent(
      FirstStartCheckingEvent event, Emitter<HomeState> emit) async {
    final firstCityName = await getFirstCityName.call();
    emit(
      firstCityName.fold(
        (failure) =>
            HomeError(message: ForecastUtil.mapFailureToMessage(failure)),
        (cityName) {
          return cityName != null
              ? HomeSavedCityNames(
                  cityName: CityNameEntity(
                      localNames: cityName.localNames,
                      name: cityName.name,
                      lat: cityName.lat,
                      lon: cityName.lon))
              : HomeFirstStart();
        },
      ),
    );
  }
}
