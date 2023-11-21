// import 'package:flutter/material.dart';
//
// class CityListBuilder extends StatelessWidget {
//   final bool isFirstStart;
//   final String cityName;
//
//   const CityListBuilder(
//       {super.key, required this.isFirstStart, required this.cityName});
//
//   Future<CityNameList?> _fetchCityName(String cityName) async {
//     if (cityName.trim().isNotEmpty) {
//       var cityNames = await CityNameApi().fetchCityName(city: cityName);
//       return cityNames;
//     }
//     return null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         FutureBuilder(
//           future: _fetchCityName(cityName),
//           builder:
//               (BuildContext context, AsyncSnapshot<CityNameList?> snapshot) {
//             if (snapshot.hasData) {
//               try {
//                 List<CityName> cityNameList = snapshot.data!.cityName!;
//                 if (cityNameList.isNotEmpty) {
//                   return SearchCityList(
//                       cityNameList: cityNameList, isFirstStart: isFirstStart);
//                 } else {
//                   return Container();
//                 }
//               } catch (error) {
//                 return Text(error.toString());
//               }
//             } else if (cityName.isEmpty) {
//               return Container();
//             } else if (snapshot.hasError) {
//               return Text(snapshot.error.toString());
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         ),
//       ],
//     );
//   }
// }