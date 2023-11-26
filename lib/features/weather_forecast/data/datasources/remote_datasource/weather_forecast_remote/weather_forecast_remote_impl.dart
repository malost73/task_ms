import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:task_ms/core/constants/constants_api.dart';
import 'package:task_ms/core/dio_error/error_interseptor.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/remote_datasource/weather_forecast_remote/weather_forecast_remote.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/weather_forecast_dto/weather_forecast_dto.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';

class WeatherForecastRemoteImpl implements WeatherForecastRemote {
  final Function(String) onErrorHandler;
  late Dio _dio;

  WeatherForecastRemoteImpl({required this.onErrorHandler}) {
    _dio = Dio()
      ..interceptors.addAll([
        PrettyDioLogger(requestHeader: true, requestBody: true),
        ErrorInterceptor(onErrorHandler)
      ]);
  }

  // static final _dio = Dio();

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
    // try {
    Response response = await _dio.get(
      ConstantsApi.weatherForecastUrl,
      queryParameters: params,
    );
    if (response.statusCode == ConstantsApi.successResponseCode) {
      return (WeatherForecastDTO.fromJson(response.data));
    } else {
      return null;
    }
    //   } on DioException catch (e) {
    //     if (kDebugMode) {
    //       print(e);
    //     }
    //     return null;
    //   }
  }
}
