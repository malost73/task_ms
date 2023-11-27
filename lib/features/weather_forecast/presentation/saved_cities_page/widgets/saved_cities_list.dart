import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/core/constants/constants.dart';
import 'package:task_ms/core/constants/constants_colors.dart';
import 'package:task_ms/core/routes/app_router.gr.dart';
import 'package:task_ms/core/utilities/show_toast.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';
import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/bloc/saved_cities_bloc.dart';
import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/bloc/saved_cities_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/bloc/saved_cities_state.dart';

class SavedCitiesList extends StatelessWidget {
  const SavedCitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedCitiesBloc, SavedCitiesState>(
      builder: (context, state) {
        if (state is SavedCitiesInitial) {
          context.read<SavedCitiesBloc>().add(GetSavedCitiesEvent());
        } else if (state is SavedCitiesError) {
          return Center(child: Text(state.message));
        } else if (state is SavedCitiesLoading) {
          const Center(child: CircularProgressIndicator());
        } else if (state is SavedCitiesLoaded) {
          if (state.cityNameListEntity == null) {
            ShowToast.showToast(Constants.noSavedCities);
            return const Center(
              child: Text(Constants.noSavedCities),
            );
          } else {
            final cityList = state.cityNameListEntity;
            return ListView.separated(
              shrinkWrap: true,
              addAutomaticKeepAlives: true,
              padding: const EdgeInsets.all(15),
              itemCount: cityList?.length ?? 0,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: ConstantsColors.widgetComponent,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: ListTile(
                        onTap: () => context.router.pushAndPopUntil(
                            WeatherForecastRoute(
                              cityName: CityNameEntity(
                                  name: cityList?[index].name,
                                  localNames: cityList?[index].localNames,
                                  lat: cityList?[index].lat,
                                  lon: cityList?[index].lon,
                                  country: cityList?[index].country,
                                  state: cityList?[index].state),
                            ),
                            predicate: (route) => false),
                        title: Text(
                          cityList?[index].localNames?.ru ??
                              cityList?[index].name ??
                              '',
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
        return Container();
      },
    );
  }
}
