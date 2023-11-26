import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:task_ms/core/constants/constants_api.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/remote_datasource/city_name_list_remote/city_name_list_remote.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/city_name_dto/city_name_dto.dart';

class CityNameListRemoteImpl implements CityNameListRemote {
  static final _dio = Dio();

  @override
  Future<List<CityNameDTO>?> getCityNameList({String? cityName}) async {
    Map<String, String?> params = {
      'appid': ConstantsApi.weatherAppId,
      'q': cityName,
      'limit': ConstantsApi.cityLimit
    };
    try {
      Response response =
          await _dio.get(ConstantsApi.cityNameUrl, queryParameters: params);

      if (response.statusCode == ConstantsApi.successResponseCode) {
        return (response.data as List)
            .map((x) => CityNameDTO.fromJson(x))
            .toList();
      } else {
        return null;
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
