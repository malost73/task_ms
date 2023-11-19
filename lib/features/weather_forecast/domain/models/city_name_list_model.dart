import 'package:equatable/equatable.dart';
import 'package:task_ms/features/weather_forecast/domain/models/city_name_model.dart';

class CityNameListModel extends Equatable {
  const CityNameListModel({this.cityNameList});

  final List<CityNameModel>? cityNameList;

  @override
  List<Object?> get props => [cityNameList];
}
