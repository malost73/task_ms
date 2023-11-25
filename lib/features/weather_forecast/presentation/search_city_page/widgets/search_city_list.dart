import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/core/services/app_router.gr.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/city_info_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/coordinates_entity.dart';
import 'package:task_ms/features/weather_forecast/presentation/search_city_page/bloc/search_city_bloc.dart';
import 'package:task_ms/features/weather_forecast/presentation/search_city_page/bloc/search_city_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/search_city_page/bloc/search_city_state.dart';

class SearchCityList extends StatelessWidget {
  final List<CityNameEntity> cityList;
  final bool isFirstStart;

  const SearchCityList(
      {super.key, required this.isFirstStart, required this.cityList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemCount: cityList.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
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
              // else {
              //   context.read<SearchCityBloc>().add(CheckSavedCityName(
              //       coordinates: CoordinatesEntity(
              //           lat: cityList[index].lat, lon: cityList[index].lon)));
              //   if (context.read<SearchCityBloc>().state is CityNameChecked){
              //     var state = context.read<SearchCityBloc>().state;
              //     state.
              //   }
              // }
              if (context.mounted) {
                context.router.pushAndPopUntil(
                    WeatherForecastRoute(
                        cityName: CityNameEntity(
                            name: cityList[index].name,
                            localNames: cityList[index].localNames,
                            lat: cityList[index].lat,
                            lon: cityList[index].lon,
                            country: cityList[index].country,
                            state: cityList[index].state)),
                    predicate: (route) => false);
                // Navigator.pushAndRemoveUntil(context,
                //     MaterialPageRoute(builder: (context) {
                //       return WeatherForecastPage(
                //         cityInfo: CityInfo(
                //             saved: saved,
                //             name: name,
                //             lat: lat.toString(),
                //             lon: lon.toString()),
                //       );
                //     }), (route) => false);
              }
            },
            title: Text(
                cityList[index].localNames?.ru ?? cityList[index].name ?? ''),
            subtitle: Text(cityList[index].country == null
                ? (cityList[index].state == null
                    ? ''
                    : cityList[index].state.toString())
                : cityList[index].country.toString() +
                    (cityList[index].state == null
                        ? ''
                        : ', ${cityList[index].state}')),
          ),
        );
      },
    );
  }
}
