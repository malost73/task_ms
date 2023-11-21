import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/core/services/app_router.gr.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/city_name_local/city_name_local_impl.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/local_datasource/realm_database/local_db_city_name.dart';
import 'package:task_ms/features/weather_forecast/data/datasources/remote_datasource/city_name_list_remote/city_name_list_remote_impl.dart';
import 'package:task_ms/features/weather_forecast/data/repositories/city_name_repository_impl.dart';
import 'package:task_ms/features/weather_forecast/domain/models/coordinates_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/get_city_name_list.dart';
import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/bloc/saved_cities_bloc.dart';
import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/bloc/saved_cities_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/bloc/saved_cities_state.dart';
import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/widgets/saved_cities_list.dart';

// import 'package:task_ms/pages/search_city_page.dart';
import 'package:task_ms/utilities/check_saved_city.dart';
import 'package:task_ms/utilities/constants.dart';
// import 'package:task_ms/widgets/saved_cities_list.dart';

@RoutePage()
class SavedCitiesPage extends StatelessWidget {
  final bool isFirstStart;

  const SavedCitiesPage({super.key, required this.isFirstStart});

//   @override
//   State<SavedCitiesPage> createState() => _CityPageState();
// }
//
// class _CityPageState extends State<SavedCitiesPage> {
  // void navigatorWeatherForecastPage(Map<String, dynamic> cityInfo, bool saved) {
  //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
  //     return WeatherForecastPage(
  //         cityInfo: CityInfo(
  //             saved: saved,
  //             name: cityInfo['name'],
  //             lat: cityInfo['lat'].toString(),
  //             lon: cityInfo['lon'].toString()));
  //   }), (route) => false);
  // }
  // @override
  // void initState() {
  //   super.initState();
  //   BlocProvider.of<SavedCitiesBloc>(context).add(GetSavedCitiesEvent());
  // }

  // void onTapFunction(Map<String, dynamic> cityInfo) async {
  //   var saved = await CheckSavedCity().checkSavedCity(
  //       CoordinatesModel(lat: cityInfo['lat'], lon: cityInfo['lon']));
  //   navigatorWeatherForecastPage(cityInfo, saved);
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SavedCitiesBloc(context.read<GetCityNameList>()),
        // getTodoUsecase: GetTodoUsecase(repository: repository),
        // addTodoUsecase: AddTodoUsecase(repository: repository),
        // toggleTodoUsecase: ToggleTodoUsecase(repository: repository),
        // deleteTodoUsecase: DeleteTodoUsecase(repository: repository));

        child: Scaffold(
          appBar: AppBar(
            title: const Text(Constants.titleCityPage),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  AutoRouter.of(context).push(
                    SearchCityRoute(isFirstStart: isFirstStart),
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return SearchCityPage(isFirstStart: widget.isFirstStart);
                  //     },
                  //   ),
                  // );
                },
              ),
            ],
          ),
          body:
              ListView(
                children: [
                  SavedCitiesList(),
                      // onTap: (Map<String, dynamic> info) => onTapFunction(info)),
                ],
              ),
          ),
        );
  }
}
