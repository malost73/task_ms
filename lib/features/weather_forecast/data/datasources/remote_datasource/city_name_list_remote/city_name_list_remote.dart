import 'package:task_ms/features/weather_forecast/data/dtos/city_name_list_dto/city_name_list_dto.dart';

abstract class CityNameListRemote {
  Future<CityNameListDTO?> getCityNameList({String? cityName});
}
