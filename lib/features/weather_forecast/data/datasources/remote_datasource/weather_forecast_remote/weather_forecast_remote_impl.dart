import 'package:dio/dio.dart';
import 'package:task_ms/api/constants_api.dart';
import 'package:task_ms/core/error/exceprion.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/remote_datasource/weather_forecast_remote/weather_forecast_remote.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/weather_forecast_dto/weather_forecast_dto.dart';
import 'package:task_ms/features/weather_forecast/domain/models/coordinates_model.dart';
// import 'package:injectable/injectable.dart';

// @Injectable(as: WeatherRemoteDataSource)
class WeatherForecastRemoteImpl implements WeatherForecastRemote {
  WeatherForecastRemoteImpl(this.dio);

  final Dio dio;

  @override
  Future<WeatherForecastDTO?> getWeatherForecast(
      {CoordinatesModel? coordinatesModel}) async {
    Map<String, String?> params = {
      'appid': ConstantsApi.weatherAppId,
      'lang': ConstantsApi.weatherLang,
      'units': ConstantsApi.weatherUnits,
      'exclude': ConstantsApi.weatherExclude,
      'lat': coordinatesModel?.lat.toString(),
      'lon': coordinatesModel?.lon.toString(),
    };

    Response response = await dio.get(
      ConstantsApi.weatherForecastUrl,
      queryParameters: params,
    );

    if (response.statusCode == ConstantsApi.successResponseCode) {
      return response.data;
    } else {
      throw ServerException();
    }
  }
}
