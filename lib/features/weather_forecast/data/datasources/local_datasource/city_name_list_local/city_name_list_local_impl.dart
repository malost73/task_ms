// // import 'package:flutter_architecture/features/weather_info/data/datasources/local_datasource/local_db_weather_forecast.dart';
// // import 'package:flutter_architecture/features/weather_info/data/datasources/local_datasource/city_name_list_local.dart';
// // import 'package:flutter_architecture/features/weather_info/data/models/weather_info_remote_response_model/weather_info_response_model.dart';
// // import 'package:flutter_architecture/features/weather_info/domain/entities/weather_local_info_response_entity/clouds_local_entity.dart';
// // import 'package:flutter_architecture/features/weather_info/domain/entities/weather_local_info_response_entity/main_weather_info_local_entity.dart';
// // import 'package:flutter_architecture/features/weather_info/domain/entities/weather_local_info_response_entity/sunset_sunrise_local_entity.dart';
// // import 'package:flutter_architecture/features/weather_info/domain/entities/weather_local_info_response_entity/weather_description_local_entity.dart';
// // import 'package:flutter_architecture/features/weather_info/domain/entities/weather_local_info_response_entity/weather_local_info_entity.dart';
// // import 'package:flutter_architecture/features/weather_info/domain/entities/weather_local_info_response_entity/weather_theme_local_entity.dart';
// // import 'package:flutter_architecture/features/weather_info/domain/entities/weather_local_info_response_entity/wind_info_local_entity.dart';
// // import 'package:flutter_architecture/features/weather_info/domain/entities/weather_remote_info_response_entity/weather_info_entity.dart';
// // import 'package:injectable/injectable.dart';
// //
//
// import 'package:realm/realm.dart';
// import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/city_name_list_local/city_name_list_local.dart';
// import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/database/local_db_weather_forecast.dart';
// import 'package:task_ms/features/weather_forecast/data/dtos/city_name_dto/city_name_dto.dart';
// import 'package:task_ms/features/weather_forecast/domain/models/city_name_model.dart';
//
// // @Injectable(as: WeatherLocalDataSource)
// class CityNameListLocalImpl implements CityNameListLocal {
//   CityNameListLocalImpl(this.localDatabase);
//
//   final LocalDatabase localDatabase;
//
//   @override
//   Future<void> addItem(CityNameDTO? cityNameDTO) {
//     // TODO: implement addItem
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<void> deleteItem(String? id) {
//     // TODO: implement deleteItem
//     throw UnimplementedError();
//   }
//
//   @override
//   RealmList<CityNameModel> getFirstItem() {
//     // TODO: implement getFirstItem
//     throw UnimplementedError();
//   }
//
//   @override
//   RealmResults<CityNameModel> getItems() {
//     // TODO: implement getItems
//     throw UnimplementedError();
//   }
//
//   @override
//   void cacheWeatherInfo(CityNameDTO? weatherInfoResponseModel) {
//     final WeatherInfoEntity? weatherData =
//         weatherInfoResponseModel?.mapToEntity();
//     final WeatherInfoLocalEntity _localEntity = WeatherInfoLocalEntity(
//       timezone: weatherData?.timezone,
//       name: weatherData?.name,
//       dt: weatherData?.dt,
//       visibility: weatherData?.visibility,
//     );
//     _localEntity.sys.target = SunsetSunriseLocalEntity(
//       sunset: weatherData?.sys?.sunset,
//       country: weatherData?.sys?.country,
//       type: weatherData?.sys?.type,
//       sunrise: weatherData?.sys?.sunrise,
//     );
//     _localEntity.weather.addAll(
//       <WeatherDescriptionLocalEntity>[
//         WeatherDescriptionLocalEntity(
//           main: weatherData?.weather?[0]?.main,
//           icon: weatherData?.weather?[0]?.icon,
//           description: weatherData?.weather?[0]?.description,
//         ),
//       ],
//     );
//     _localEntity.main.target = MainWeatherInfoLocalEntity(
//       tempMin: weatherData?.main?.tempMin,
//       tempMax: weatherData?.main?.tempMax,
//       pressure: weatherData?.main?.pressure,
//       humidity: weatherData?.main?.humidity,
//       feelsLike: weatherData?.main?.feelsLike,
//       temp: weatherData?.main?.temp,
//     );
//     _localEntity.wind.target = WindInfoLocalEntity(
//       speed: weatherData?.wind?.speed,
//       deg: weatherData?.wind?.deg,
//     );
//     _localEntity.clouds.target = CloudsLocalEntity(
//       all: weatherData?.clouds?.all,
//     );
//     _localEntity.weatherTheme.target = WeatherThemeLocalEntity(
//       firstColorHex: weatherData?.weatherTheme?.firstColor?.value,
//       secondColorHex: weatherData?.weatherTheme?.secondColor?.value,
//     );
//     appLocalDatabase.insert<WeatherInfoLocalEntity>(_localEntity);
//   }
//
//   @override
//   Future<WeatherInfoEntity?> getLastWeatherInfo() async {
//     final List<WeatherInfoLocalEntity>? weatherInfoLocalData =
//         await appLocalDatabase.getAll<WeatherInfoLocalEntity>();
//     if ((weatherInfoLocalData?.length ?? 0) > 0) {
//       final WeatherInfoEntity? _lastInfoData =
//           weatherInfoLocalData?.last.mapToEntity();
//       return _lastInfoData;
//     }
//     return null;
//   }
//
//   @override
//   Future<List<WeatherInfoEntity?>?> getAllLocalWeathers() async {
//     final List<WeatherInfoLocalEntity>? weatherInfoLocalData =
//         await appLocalDatabase.getAll<WeatherInfoLocalEntity>();
//     if ((weatherInfoLocalData?.length ?? 0) > 0) {
//       final List<WeatherInfoEntity?>? _localData = weatherInfoLocalData
//           ?.map((WeatherInfoLocalEntity element) => element.mapToEntity())
//           .toList();
//       return _localData;
//     }
//     return null;
//   }
// }
//
// @override
// RealmResults<CityNameDB> getItems(String? params) {
//   return _realm.all<CityNameDB>();
// }
//
// bool addItem(T text) {
//   try {
//     _realm.write(() {
//       _realm.add(TemperatureDB(text, false));
//     });
//     return true;
//   } on RealmException catch (e) {
//     debugPrint(e.message);
//     return false;
//   }
// }
//
// bool toggleItemStatus(T item) {
//   try {
//     _realm.write(() {
//       item?.done = !item.done;
//     });
//     return true;
//   } on RealmException catch (e) {
//     debugPrint(e.message);
//     return false;
//   }
// }
//
// bool deleteItem(T item) {
//   try {
//     _realm.write(() {
//       _realm.delete(item);
//     });
//     return true;
//   } on RealmException catch (e) {
//     debugPrint(e.message);
//     return false;
//   }
// }
//
// @override
// RealmObject<CoordinatesDB> getFirstItem() {
//   return _realm.all<CoordinatesDB>().first;
// }
