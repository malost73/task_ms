import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/core/constants/constants_colors.dart';
import 'package:task_ms/core/routes/app_router.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/city_name_local/city_name_local_impl.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/remote_datasource/city_name_list_remote/city_name_list_remote_impl.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/remote_datasource/weather_forecast_remote/weather_forecast_remote_impl.dart';
import 'package:task_ms/features/weather_forecast/data/repositories/city_name_repository_impl.dart';
import 'package:task_ms/features/weather_forecast/data/repositories/weather_forecast_repository_impl.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/check_saved_city.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/delete_city_name.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/get_city_name_list.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/get_first_city_name.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/get_weather_forecast.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/save_city_name.dart';
import 'package:task_ms/features/weather_forecast/presentation/weather_forecast_page/bloc/weather_forecast_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();
  final _weatherForecast = WeatherForecastRepositoryImpl(
      remoteWeatherForecast: WeatherForecastRemoteImpl());
  final _cityNameRepository = CityNameRepositoryImpl(
      remoteCityNameList: CityNameListRemoteImpl(),
      localCityNameList: CityNameLocalImpl());

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GetFirstCityName>(
          create: (context) => GetFirstCityName(_cityNameRepository),
        ),
        RepositoryProvider<GetCityNameList>(
          create: (context) => GetCityNameList(_cityNameRepository),
        ),
        RepositoryProvider<SaveCityName>(
          create: (context) => SaveCityName(_cityNameRepository),
        ),
        RepositoryProvider<CheckSavedCity>(
          create: (context) => CheckSavedCity(_cityNameRepository),
        ),
        RepositoryProvider<GetWeatherForecast>(
          create: (context) => GetWeatherForecast(_weatherForecast),
        ),
        RepositoryProvider<DeleteCityName>(
          create: (context) => DeleteCityName(_cityNameRepository),
        ),
      ],
      child: BlocProvider(
        create: (context) => WeatherForecastBloc(
            context.read<CheckSavedCity>(),
            context.read<GetWeatherForecast>(),
            context.read<SaveCityName>(),
            context.read<DeleteCityName>()),
        child: MaterialApp.router(
          routerConfig: _appRouter.config(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme:
                const AppBarTheme(color: ConstantsColors.widgetComponent),
            scaffoldBackgroundColor: Colors.grey.shade900,
            colorScheme: const ColorScheme.dark(
              primary: ConstantsColors.primary,
            ),
            // primarySwatch: Colors.blue,
          ),
        ),
      ),
    );
  }
}
