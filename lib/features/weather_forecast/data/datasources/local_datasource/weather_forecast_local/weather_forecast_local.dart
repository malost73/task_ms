import 'package:realm/realm.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/weather_forecast_db/weather_forecast_db.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/weather_forecast_dto/weather_forecast_dto.dart';
import 'package:task_ms/features/weather_forecast/domain/models/weather_forecast_model.dart';

abstract class WeatherForecastLocal {
  // Future<WeatherForecastModel?> getLastWeatherForecast();

  // Future<List<WeatherForecastModel?>?> getAllLocalWeathers();

  Future<void> addItem(WeatherForecastDTO? weatherForecastDTO);

  Future<List<WeatherForecastModel>?> getItems();

  Future<WeatherForecastModel?> getFirstItem();

  void deleteItem(WeatherForecastDB weatherForecastDB);

// void cacheWeatherForecast(WeatherForecastDTO? weatherForecastDTO);
}
