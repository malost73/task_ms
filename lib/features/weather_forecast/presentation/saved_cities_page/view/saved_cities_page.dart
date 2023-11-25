import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/core/constants/constants.dart';
import 'package:task_ms/core/routes/app_router.gr.dart';
import 'package:task_ms/features/weather_forecast/domain/usecases/get_city_name_list.dart';
import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/bloc/saved_cities_bloc.dart';
import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/widgets/saved_cities_list.dart';

@RoutePage()
class SavedCitiesPage extends StatelessWidget {
  final bool isFirstStart;

  const SavedCitiesPage({super.key, required this.isFirstStart});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SavedCitiesBloc(context.read<GetCityNameList>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Constants.titleCityPage),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                context.pushRoute(SearchCityRoute(isFirstStart: isFirstStart));
              },
            ),
          ],
        ),
        body: const SavedCitiesList(),
      ),
    );
  }
}
