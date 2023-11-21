import 'package:task_ms/features/weather_forecast/data/dtos/city_name_dto/city_name_dto.dart';
import 'package:task_ms/features/weather_forecast/data/dtos/city_name_list_dto/city_name_list_dto.dart';
import 'package:task_ms/features/weather_forecast/data/mappers/remote_mappers/city_name_mapper.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_list_entity.dart';

extension CityNameListMapper on CityNameListDTO {
  CityNameListEntity toDomain() {
    return CityNameListEntity(
        cityNameList:
            cityNameList?.map((CityNameDTO e) => e.toDomain()).toList());
  }
}
