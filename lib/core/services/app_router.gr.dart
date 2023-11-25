// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/foundation.dart' as _i7;
import 'package:flutter/material.dart' as _i6;
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart'
    as _i8;
import 'package:task_ms/features/weather_forecast/presentation/home_page/view/home_page.dart'
    as _i1;
import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/view/saved_cities_page.dart'
    as _i2;
import 'package:task_ms/features/weather_forecast/presentation/search_city_page/view/search_city_page.dart'
    as _i3;
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/view/weather_forecast_page.dart'
    as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    SavedCitiesRoute.name: (routeData) {
      final args = routeData.argsAs<SavedCitiesRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.SavedCitiesPage(
          key: args.key,
          isFirstStart: args.isFirstStart,
        ),
      );
    },
    SearchCityRoute.name: (routeData) {
      final args = routeData.argsAs<SearchCityRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.SearchCityPage(
          key: args.key,
          isFirstStart: args.isFirstStart,
        ),
      );
    },
    WeatherForecastRoute.name: (routeData) {
      final args = routeData.argsAs<WeatherForecastRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.WeatherForecastPage(
          key: args.key,
          cityName: args.cityName,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SavedCitiesPage]
class SavedCitiesRoute extends _i5.PageRouteInfo<SavedCitiesRouteArgs> {
  SavedCitiesRoute({
    _i6.Key? key,
    required bool isFirstStart,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          SavedCitiesRoute.name,
          args: SavedCitiesRouteArgs(
            key: key,
            isFirstStart: isFirstStart,
          ),
          initialChildren: children,
        );

  static const String name = 'SavedCitiesRoute';

  static const _i5.PageInfo<SavedCitiesRouteArgs> page =
      _i5.PageInfo<SavedCitiesRouteArgs>(name);
}

class SavedCitiesRouteArgs {
  const SavedCitiesRouteArgs({
    this.key,
    required this.isFirstStart,
  });

  final _i6.Key? key;

  final bool isFirstStart;

  @override
  String toString() {
    return 'SavedCitiesRouteArgs{key: $key, isFirstStart: $isFirstStart}';
  }
}

/// generated route for
/// [_i3.SearchCityPage]
class SearchCityRoute extends _i5.PageRouteInfo<SearchCityRouteArgs> {
  SearchCityRoute({
    _i6.Key? key,
    required bool isFirstStart,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          SearchCityRoute.name,
          args: SearchCityRouteArgs(
            key: key,
            isFirstStart: isFirstStart,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchCityRoute';

  static const _i5.PageInfo<SearchCityRouteArgs> page =
      _i5.PageInfo<SearchCityRouteArgs>(name);
}

class SearchCityRouteArgs {
  const SearchCityRouteArgs({
    this.key,
    required this.isFirstStart,
  });

  final _i6.Key? key;

  final bool isFirstStart;

  @override
  String toString() {
    return 'SearchCityRouteArgs{key: $key, isFirstStart: $isFirstStart}';
  }
}

/// generated route for
/// [_i4.WeatherForecastPage]
class WeatherForecastRoute extends _i5.PageRouteInfo<WeatherForecastRouteArgs> {
  WeatherForecastRoute({
    _i7.Key? key,
    required _i8.CityNameEntity cityName,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          WeatherForecastRoute.name,
          args: WeatherForecastRouteArgs(
            key: key,
            cityName: cityName,
          ),
          initialChildren: children,
        );

  static const String name = 'WeatherForecastRoute';

  static const _i5.PageInfo<WeatherForecastRouteArgs> page =
      _i5.PageInfo<WeatherForecastRouteArgs>(name);
}

class WeatherForecastRouteArgs {
  const WeatherForecastRouteArgs({
    this.key,
    required this.cityName,
  });

  final _i7.Key? key;

  final _i8.CityNameEntity cityName;

  @override
  String toString() {
    return 'WeatherForecastRouteArgs{key: $key, cityName: $cityName}';
  }
}
