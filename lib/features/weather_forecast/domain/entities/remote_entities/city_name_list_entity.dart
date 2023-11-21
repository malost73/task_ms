import 'package:equatable/equatable.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';

class CityNameListEntity extends Equatable {
  const CityNameListEntity({this.cityNameList});

  final List<CityNameEntity>? cityNameList;

  @override
  List<Object?> get props => [cityNameList];
}
