import 'package:flutter/material.dart';
import 'package:task_ms/features/weather_forecast/domain/entities/remote_entities/city_name_entity.dart';

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
            onTap: () async {
              // bool saved;
              // String name =
              //     cityList[index].localNames?.ru ?? cityList[index].name ?? '';
              // double? lat = cityList[index].lat;
              // double? lon = cityList[index].lon;
              // if (isFirstStart) {
              //   await SharedPreferenceCity().setListCityInfo([
              //     {'name': name, 'lat': lat, 'lon': lon}
              //   ]);
              //   saved = true;
              // } else {
              //   saved = await CheckSavedCity()
              //       .checkSavedCity(Coordinates(lat: lat, lon: lon));
              // }
              if (context.mounted) {
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
            subtitle:
                Text('${cityList[index].country}, ${cityList[index].state}'),
          ),
        );
      },
    );
  }
}
