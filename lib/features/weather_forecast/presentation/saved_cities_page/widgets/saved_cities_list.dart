import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/bloc/saved_cities_bloc.dart';
import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/bloc/saved_cities_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/saved_cities_page/bloc/saved_cities_state.dart';
import 'package:task_ms/utilities/constants_colors.dart';
// import 'package:task_ms/utilities/shared_preference.dart';

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
        } else if (state is SavedCitiesLoading) {
          const Center(child: CircularProgressIndicator());
        } else if (state is SavedCitiesLoaded) {
          if (state.cityNameListModel == null ||
              state.cityNameListModel?.cityNameList == null) {
            return const Center(
              child: Text('List cities is null'),
            );
          } else if (state.cityNameListModel!.cityNameList!.isEmpty) {
            return const Center(
              child: Text('List cities is empty'),
            );
          } else {
            final cityNameList = state.cityNameListModel!.cityNameList!;
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              addAutomaticKeepAlives: true,
              padding: const EdgeInsets.all(15),
              itemCount: cityNameList.length,
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
                          cityNameList[index].localNames!.ru ??
                              cityNameList[index].name ??
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
    //   FutureBuilder(
    //
    //   future: SharedPreferenceCity().getListCityInfo(),
    //   // future: SharedPreferenceCity().getListCityInfo(),
    //   builder: (BuildContext context,
    //       AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
    //     if (snapshot.hasData) {
    //       if (snapshot.data != null) {
    //         if (snapshot.data!.isNotEmpty) {
    //           final List<Map<String, dynamic>> cityNameList = snapshot.data!;
    //           return ListView.separated(
    //             shrinkWrap: true,
    //             physics: const NeverScrollableScrollPhysics(),
    //             addAutomaticKeepAlives: true,
    //             padding: const EdgeInsets.all(15),
    //             itemCount: cityNameList.length,
    //             itemBuilder: (context, index) {
    //               return ClipRRect(
    //                 borderRadius: BorderRadius.circular(10),
    //                 child: Container(
    //                   color: ProjectColors.widgetComponent,
    //                   child: Padding(
    //                     padding: const EdgeInsets.all(5),
    //                     child: ListTile(
    //                       onTap: () => onTap(cityNameList[index]),
    //                       title: Text(
    //                         cityNameList[index]['name'],
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               );
    //             },
    //             separatorBuilder: (context, index) => const SizedBox(height: 8),
    //           );
    //         } else {
    //           return Container();
    //         }
    //       } else {
    //         return Container();
    //       }
    //     } else if (snapshot.hasError) {
    //       return Center(child: Text(snapshot.error.toString()));
    //     }
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );
  }
}
