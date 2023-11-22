import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/bloc/saved_cities_bloc.dart';
import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/bloc/saved_cities_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/bloc/saved_cities_state.dart';
import 'package:task_ms/utilities/constants_colors.dart';

class SavedCitiesList extends StatelessWidget {
  // final Function onTap;

  // const SavedCitiesList({super.key, required this.onTap});
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
            return const Center(
              child: Text('List cities is null'),
            );
          } else {
            final cityNameList = state.cityNameListEntity;
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              addAutomaticKeepAlives: true,
              padding: const EdgeInsets.all(15),
              itemCount: cityNameList?.length ?? 0,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: ProjectColors.widgetComponent,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: ListTile(
                        // onTap: () => onTap(cityNameList[index]),
                        title: Text(
                          cityNameList?[index].localNames?.ru ??
                              cityNameList?[index].name ??
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
