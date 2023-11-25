import 'package:task_ms/features/weather_forecast/data/dtos/city_name_dto/city_name_dto.dart';

abstract class CityNameListRemote {
  Future<List<CityNameDTO>?> getCityNameList({String? cityName});
}
