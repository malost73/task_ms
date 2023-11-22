import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/core/services/app_router.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/city_name_local/city_name_local_impl.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/remote_datasource/city_name_list_remote/city_name_list_remote_impl.dart';
import 'package:task_ms/features/weather_forecast/data/repositories/city_name_repository_impl.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/get_city_name_list.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/get_first_city_name.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();
  final _cityNameRepository = CityNameRepositoryImpl(
      remoteCityNameList: CityNameListRemoteImpl(),
      localCityNameList: CityNameLocalImpl());

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // RepositoryProvider<CityNameRepositoryImpl>(
        //   create: (context) => CityNameRepositoryImpl(),
        // ),
        // RepositoryProvider<WeatherForecastRepositoryImpl>(
        //   create: (context) => WeatherForecastRepositoryImpl(),
        // ),
        RepositoryProvider<GetFirstCityName>(
          create: (context) => GetFirstCityName(_cityNameRepository),
        ),
        RepositoryProvider<GetCityNameList>(
          create: (context) => GetCityNameList(_cityNameRepository),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF343434)),
          scaffoldBackgroundColor: Colors.grey.shade900,
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF2C6996),
          ),
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
// BlocProvider(
//   create: (context) {
//     final repository = CityNameRepositoryImpl(
//         remoteCityNameList: CityNameListRemoteImpl(),
//         localCityNameList: CityNameLocalImpl(LocalDatabase()));
//     return HomeBloc(repository);
//     // getTodoUsecase: GetTodoUsecase(repository: repository),
//     // addTodoUsecase: AddTodoUsecase(repository: repository),
//     // toggleTodoUsecase: ToggleTodoUsecase(repository: repository),
//     // deleteTodoUsecase: DeleteTodoUsecase(repository: repository));
//   },
//   child:

// @override
// Widget build(BuildContext context) {
//   return MaterialApp.router(
//     routerConfig: _appRouter.config(),
//     debugShowCheckedModeBanner: false,
//     theme: ThemeData(
//       appBarTheme: const AppBarTheme(color: Color(0xFF343434)),
//       scaffoldBackgroundColor: Colors.grey.shade900,
//       colorScheme: const ColorScheme.dark(
//         primary: Color(0xFF2C6996),
//       ),
//       primarySwatch: Colors.blue,
//     ),
//   );
// }
