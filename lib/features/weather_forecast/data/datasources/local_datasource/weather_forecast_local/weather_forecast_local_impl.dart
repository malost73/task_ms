import 'package:realm/realm.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/database/local_db_weather_forecast.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/coordinates_db/coordinates_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/current_forecast_db/current_forecast_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/daily_forecast_db/daily_forecast_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/hourly_forecast_db/hourly_forecast_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/mappers_db/weather_forecast_mapper_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/temperature_db/temperature_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/weather_db/weather_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/models_db/weather_forecast_db/weather_forecast_db.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/weather_forecast_local/weather_forecast_local.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/weather_forecast_dto/weather_forecast_dto.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/weather_forecast_mapper.dart';
import 'package:task_ms/features/weather_forecast/domain/models/weather_forecast_model.dart';

// @Injectable(as: WeatherLocalDataSource)
class WeatherForecastLocalImpl implements WeatherForecastLocal {
  WeatherForecastLocalImpl(this.localDatabase);

  final LocalDatabase localDatabase;

  @override
  Future<void> addItem(WeatherForecastDTO? weatherForecastDTO) async {
    final WeatherForecastModel? weatherForecast =
        weatherForecastDTO?.toDomain();
    final WeatherForecastDB weatherForecastDB = WeatherForecastDB(
      ObjectId(),
      coordinates: CoordinatesDB(
        ObjectId(),
        lat: weatherForecast?.lat,
        lon: weatherForecast?.lon,
      ),
      current: CurrentForecastDB(
        ObjectId(),
        dt: weatherForecast?.current?.dt,
        temp: weatherForecast?.current?.temp,
        pressure: weatherForecast?.current?.pressure,
        humidity: weatherForecast?.current?.humidity,
      ),
    );
    weatherForecastDB.current?.weather.addAll([
      WeatherDB(
        weatherForecast!.current!.weather!.first.id,
        main: weatherForecast.current?.weather?.first.main,
        icon: weatherForecast.current?.weather?.first.icon,
        description: weatherForecast.current?.weather?.first.description,
      ),
    ]);

    if (weatherForecast != null && weatherForecast.hourly != null) {
      for (int i = 0; i < weatherForecast.hourly!.length; i++) {
        weatherForecastDB.hourly.add(
          HourlyForecastDB(
            ObjectId(),
            dt: weatherForecast.hourly?[i].dt,
            temp: weatherForecast.hourly?[i].temp,
          ),
        );
        weatherForecastDB.hourly[i].weather.addAll([
          WeatherDB(
            weatherForecast.hourly![i].weather!.first.id,
            main: weatherForecast.hourly?[i].weather?.first.main,
            icon: weatherForecast.hourly?[i].weather?.first.icon,
            description: weatherForecast.hourly?[i].weather?.first.description,
          ),
        ]);
      }
    }

    if (weatherForecast != null && weatherForecast.daily != null) {
      for (int i = 0; i < weatherForecast.daily!.length; i++) {
        weatherForecastDB.daily.add(
          DailyForecastDB(
            ObjectId(),
            dt: weatherForecast.daily?[i].dt,
            temp: TemperatureDB(ObjectId(),
                min: weatherForecast.daily?[i].temp?.min,
                max: weatherForecast.daily?[i].temp?.min),
          ),
        );
        weatherForecastDB.daily[i].weather.addAll([
          WeatherDB(
            weatherForecast.daily![i].weather!.first.id,
            main: weatherForecast.daily?[i].weather?.first.main,
            icon: weatherForecast.daily?[i].weather?.first.icon,
            description: weatherForecast.daily?[i].weather?.first.description,
          ),
        ]);
      }
    }

    localDatabase.addItem(weatherForecastDB);
  }

  @override
  void deleteItem(WeatherForecastDB weatherForecastDB) {
    localDatabase.deleteItem(weatherForecastDB);
  }

  @override
  Future<WeatherForecastModel?> getFirstItem() async {
    final List<WeatherForecastDB> weatherForecastDB =
        localDatabase.getItems().toList();
    if ((weatherForecastDB.length ?? 0) > 0) {
      final weatherForecastModel = weatherForecastDB.first.toDomain();
      return weatherForecastModel;
    }
    return null;
  }

  @override
  Future<List<WeatherForecastModel>?> getItems() async {
    final weatherForecastDB = localDatabase.getItems();
    if ((weatherForecastDB.length ?? 0) > 0) {
      final weatherForecastModel = weatherForecastDB
          .map((WeatherForecastDB element) => element.toDomain())
          .toList();
      return weatherForecastModel;
    }
    return null;
  }
}
