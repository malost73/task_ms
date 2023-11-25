import 'package:dio/dio.dart';
import 'package:task_ms/core/constants/constants_api.dart';
import 'package:task_ms/core/error/exceprion.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/remote_datasource/weather_forecast_remote/weather_forecast_remote.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/weather_forecast_dto/weather_forecast_dto.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';
// import 'package:injectable/injectable.dart';

// @Injectable(as: WeatherRemoteDataSource)
class WeatherForecastRemoteImpl implements WeatherForecastRemote {
  // WeatherForecastRemoteImpl(this.dio);

  static final Dio _dio = Dio();

  @override
  Future<WeatherForecastDTO?> getWeatherForecast(
      {CoordinatesEntity? coordinatesEntity}) async {
    Map<String, String?> params = {
      'appid': ConstantsApi.weatherAppId,
      'lang': ConstantsApi.weatherLang,
      'units': ConstantsApi.weatherUnits,
      'exclude': ConstantsApi.weatherExclude,
      'lat': coordinatesEntity?.lat.toString(),
      'lon': coordinatesEntity?.lon.toString(),
    };

    Response response = await _dio.get(
      ConstantsApi.weatherForecastUrl,
      queryParameters: params,
    );

    if (response.statusCode == ConstantsApi.successResponseCode) {
      return (WeatherForecastDTO.fromJson(response.data));
    } else {
      return null;
    }
  }
}
