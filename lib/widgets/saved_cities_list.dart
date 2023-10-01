import 'package:flutter/material.dart';
import 'package:task_ms/utilities/constants.dart';
import 'package:task_ms/utilities/get_saved_cities.dart';

class SavedCitiesList extends StatelessWidget {
  final Function onTap;

  const SavedCitiesList({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetSavedCities().getSharedPreferenceCity(),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (!snapshot.hasError && snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            final List<String> cityNameList = snapshot.data!;
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
                        onTap: () => onTap(cityNameList[index]),
                        title: Text(
                          cityNameList[index],
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 8),
            );
          } else {
            return Container();
          }
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
