import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/core/error/failure.dart';
import 'package:task_ms/features/weather_forecast/data/repositories/city_name_repository_impl.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/check_saved_city.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/delete_city_name.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/get_city_name_list.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/get_weather_forecast.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/save_city_name.dart';
import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/bloc/saved_cities_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/bloc/saved_cities_state.dart';
import 'package:task_ms/features/weather_forecast/presentation/search_city_page/bloc/search_city_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/search_city_page/bloc/search_city_state.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/bloc/weather_forecast_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/bloc/weather_forecast_state.dart';
import 'package:task_ms/utilities/constants.dart';

class WeatherForecastBloc
    extends Bloc<WeatherForecastEvent, WeatherForecastState> {
  final CheckSavedCity checkSavedCity;
  final GetWeatherForecast getWeatherForecast;
  final DeleteCityName deleteCityName;
  final SaveCityName saveCityName;

  // final CityNameRepositoryImpl cityNameRepository;

  WeatherForecastBloc(this.checkSavedCity, this.getWeatherForecast,
      this.saveCityName, this.deleteCityName)
      : super(const WeatherForecastState()) {
    // on<WeatherForecastLoadingEvent>(_weatherLoadingEvent);
    on<DeleteCityNameEvent>(_deleteCityNameEvent);
    on<SaveCityNameEvent>(_saveCityName);
    on<CheckSavedCityEvent>(_checkSavedCityName);
  }

  // _weatherLoadingEvent(WeatherForecastLoadingEvent event,
  //     Emitter<WeatherForecastState> emit) async {
  //   // emit(WeatherForecastLoading());
  //   emit(state.copyWith(isLoading: true));
  //   final weatherForecast =
  //       await getWeatherForecast.call(coordinates: event.coordinates);
  //   emit(state.copyWith(
  //       weatherForecast:
  //           weatherForecast.fold((failure) => null, (weather) => weather)));
  // }

  _deleteCityNameEvent(
      DeleteCityNameEvent event, Emitter<WeatherForecastState> emit) async {
    // emit(WeatherForecastInitial());
    deleteCityName.call(event.cityName);
  }

  _saveCityName(SaveCityNameEvent event, Emitter<WeatherForecastState> emit) {
    saveCityName.call(event.cityName);
  }

  _checkSavedCityName(
      CheckSavedCityEvent event, Emitter<WeatherForecastState> emit) async {
    emit(state.copyWith(isLoading: true));
    final saved = await checkSavedCity.call(event.coordinates);
    final weatherForecast =
        await getWeatherForecast.call(coordinates: event.coordinates);
    emit(state.copyWith(
        weatherForecast:
            weatherForecast.fold((failure) => null, (weather) => weather),
        cityNameSaved: saved.fold((failure) => null, (saved) => saved)));
    // emit(state.copyWith(
    //     cityNameSaved: saved.fold((failure) => null, (saved) => saved)));
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
