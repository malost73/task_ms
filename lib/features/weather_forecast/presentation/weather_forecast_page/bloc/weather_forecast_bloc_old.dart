// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:task_ms/core/error/failure.dart';
// import 'package:task_ms/features/weather_forecast/data/repositories/city_name_repository_impl.dart';
// import 'package:task_ms/features/weather_forecast/domain/usecases/check_saved_city.dart';
// import 'package:task_ms/features/weather_forecast/domain/usecases/delete_city_name.dart';
// import 'package:task_ms/features/weather_forecast/domain/usecases/get_city_name_list.dart';
// import 'package:task_ms/features/weather_forecast/domain/usecases/get_weather_forecast.dart';
// import 'package:task_ms/features/weather_forecast/domain/usecases/save_city_name.dart';
// import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/bloc/saved_cities_event.dart';
// import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/bloc/saved_cities_state.dart';
// import 'package:task_ms/features/weather_forecast/presentation/search_city_page/bloc/search_city_event.dart';
// import 'package:task_ms/features/weather_forecast/presentation/search_city_page/bloc/search_city_state.dart';
// import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/bloc/weather_forecast_event.dart';
// import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/bloc/weather_forecast_state.dart';
// import 'package:task_ms/utilities/constants.dart';
//
// class WeatherForecastBlocOld
//     extends Bloc<WeatherForecastEvent, WeatherForecastState> {
//   final CheckSavedCity checkSavedCity;
//   final GetWeatherForecast getWeatherForecast;
//
//   final DeleteCityName deleteCityName;
//   final SaveCityName saveCityName;
//
//   // final CityNameRepositoryImpl cityNameRepository;
//
//   WeatherForecastBloc(this.checkSavedCity, this.getWeatherForecast,
//       this.saveCityName, this.deleteCityName)
//       : super(WeatherForecastInitial()) {
//     on<WeatherForecastLoadingEvent>(_weatherLoadingEvent);
//     on<DeleteCityNameEvent>(_deleteCityNameEvent);
//     on<SaveCityNameEvent>(_saveCityName);
//     on<CheckSavedCityEvent>(_checkSavedCityName);
//   }
//
//   _weatherLoadingEvent(WeatherForecastLoadingEvent event,
//       Emitter<WeatherForecastState> emit) async {
//     emit(WeatherForecastLoading());
//     final weatherForecast =
//         await getWeatherForecast.call(coordinates: event.coordinates);
//     emit(weatherForecast.fold(
//         (failure) =>
//             WeatherForecastError(message: _mapFailureToMessage(failure)),
//         (weather) => WeatherForecastLoaded(weatherForecast: weather)));
//   }
//
//   _deleteCityNameEvent(
//       DeleteCityNameEvent event, Emitter<WeatherForecastState> emit) async {
//     // emit(WeatherForecastInitial());
//     deleteCityName.call(event.cityName);
//   }
//
//   _saveCityName(SaveCityNameEvent event, Emitter<WeatherForecastState> emit) {
//     saveCityName.call(event.cityName);
//   }
//
//   _checkSavedCityName(
//       CheckSavedCityEvent event, Emitter<WeatherForecastState> emit) async {
//     emit(WeatherForecastLoading());
//     final saved = await checkSavedCity.call(event.coordinates);
//     emit(saved.fold(
//         (failure) =>
//             WeatherForecastError(message: _mapFailureToMessage(failure)),
//         (saved) => CityNameChecked(cityNameSaved: saved)));
//   }
//
//   String _mapFailureToMessage(Failure failure) {
//     switch (failure.runtimeType) {
//       case ServerFailure:
//         return Constants.serverFailureMessage;
//       case CacheFailure:
//         return Constants.serverFailureMessage;
//       default:
//         return 'Unexpected Error';
//     }
//   }
// }
