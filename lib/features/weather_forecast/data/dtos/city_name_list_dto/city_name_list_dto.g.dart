// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_name_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityNameListDTO _$CityNameListDTOFromJson(Map<String, dynamic> json) =>
    CityNameListDTO(
      cityNameList: (json['cityNameList'] as List<dynamic>?)
          ?.map((e) => CityNameDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityNameListDTOToJson(CityNameListDTO instance) =>
    <String, dynamic>{
      'cityNameList': instance.cityNameList,
    };
