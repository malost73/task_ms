import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/features/weather_forecast/domain/models/coordinates_model.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/get_weather_forecast.dart';
import 'package:task_ms/features/weather_forecast/presentation/home_page/bloc/home_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/home_page/bloc/home_state.dart';
import 'package:task_ms/utilities/constants.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetWeatherForecast getWeatherForecast;

  HomeBloc(this.getWeatherForecast) : super(HomeInitial()) {
    on<SavedWeatherEvent>(_weatherForecastEvent);
  }

  _weatherForecastEvent(
      SavedWeatherEvent event, Emitter<HomeState> emit) async {
    emit(HomeFirstStartChecking());
    final weather = await getWeatherForecast.call(CoordinatesModel(
        lat: event.lat,
        lon: event.getWeatherForecast.lon));
    // final failureOrPerson =
    // await weatherForecast(CoordinatesModel(query: event.personQuery));
    emit(weather
        .fold((failure) => HomeError(message: _mapFailureToMessage(failure)),
            (weatherF) {
      return weatherF == null
          ? HomeSavedWeather(weatherForecastModel: weatherF)
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
