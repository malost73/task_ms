import 'package:task_ms/features/weather_forecast/data/dtos/city_name_dto/city_name_dto.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/city_name_list_dto/city_name_list_dto.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/city_name_mapper.dart';
import 'package:task_ms/features/weather_forecast/domain/models/city_name_list_model.dart';

extension CityNameListMapper on CityNameListDTO {
  CityNameListModel toDomain() {
    return CityNameListModel(
        cityNameList:
            cityNameList?.map((CityNameDTO e) => e.toDomain()).toList());
  }
}
