import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/check_saved_city.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/delete_city_name.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/get_weather_forecast.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/save_city_name.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/bloc/weather_forecast_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/bloc/weather_forecast_state.dart';

class WeatherForecastBloc
    extends Bloc<WeatherForecastEvent, WeatherForecastState> {
  final CheckSavedCity checkSavedCity;
  final GetWeatherForecast getWeatherForecast;
  final DeleteCityName deleteCityName;
  final SaveCityName saveCityName;

  WeatherForecastBloc(this.checkSavedCity, this.getWeatherForecast,
      this.saveCityName, this.deleteCityName)
      : super(const WeatherForecastState()) {
    on<DeleteCityNameEvent>(_deleteCityNameEvent);
    on<SaveCityNameEvent>(_saveCityName);
    on<GetWeatherEvent>(_getWeatherForecast);
  }

  _deleteCityNameEvent(
      DeleteCityNameEvent event, Emitter<WeatherForecastState> emit) async {
    deleteCityName.call(event.coordinates);
    emit(state.copyWith(cityNameSaved: false));
  }

  _saveCityName(SaveCityNameEvent event, Emitter<WeatherForecastState> emit) {
    saveCityName.call(event.cityName);
    emit(state.copyWith(cityNameSaved: true));
  }

  _getWeatherForecast(
      GetWeatherEvent event, Emitter<WeatherForecastState> emit) async {
    emit(state.copyWith(isLoading: true));
    final saved = await checkSavedCity.call(event.coordinates);
    final weatherForecast =
        await getWeatherForecast.call(coordinates: event.coordinates);
    emit(
      state.copyWith(
        weatherForecast:
            weatherForecast.fold((failure) => null, (weather) => weather),
        cityNameSaved: saved.fold((failure) => null, (saved) => saved),
      ),
    );
  }
}
