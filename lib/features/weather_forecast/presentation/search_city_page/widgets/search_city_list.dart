import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/core/constants/constants_colors.dart';
import 'package:task_ms/core/routes/app_router.gr.dart';
import 'package:task_ms/core/utilities/forecast_util.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';
import 'package:task_ms/features/weather_forecast/presentation/search_city_page/bloc/search_city_bloc.dart';
import 'package:task_ms/features/weather_forecast/presentation/search_city_page/bloc/search_city_event.dart';

class SearchCityList extends StatelessWidget {
  final List<CityNameEntity> cityList;
  final bool isFirstStart;

  const SearchCityList(
      {super.key, required this.isFirstStart, required this.cityList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 10),
      itemCount: cityList.length,
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: ConstantsColors.widgetComponent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ListTile(
                onTap: () {
                  if (isFirstStart) {
                    context.read<SearchCityBloc>().add(SaveCityIfFirstStart(
                        cityName: CityNameEntity(
                            name: cityList[index].name,
                            localNames: cityList[index].localNames,
                            lat: cityList[index].lat,
                            lon: cityList[index].lon,
                            country: cityList[index].country,
                            state: cityList[index].state)));
                  }
                  context.router.pushAndPopUntil(
                      WeatherForecastRoute(
                        cityName: CityNameEntity(
                            name: cityList[index].name,
                            localNames: cityList[index].localNames,
                            lat: cityList[index].lat,
                            lon: cityList[index].lon,
                            country: cityList[index].country,
                            state: cityList[index].state),
                      ),
                      predicate: (route) => false);
                },
                title: Text(cityList[index].localNames?.ru ??
                    cityList[index].name ??
                    ''),
                subtitle: Text(
                  ForecastUtil.getSubtitle(
                      cityList[index].country, cityList[index].state),
                ),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }
}
