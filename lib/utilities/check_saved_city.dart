// import 'package:task_ms/entities/coordinates.dart';
// import 'package:task_ms/utilities/shared_preference.dart';
//
// class CheckSavedCity {
//   Future<bool> checkSavedCity(Coordinates coordinates) async {
//     List<Map<String, dynamic>>? cityInfoList =
//         await SharedPreferenceCity().getListCityInfo();
//     if (cityInfoList.isNotEmpty) {
//       for (int i = 0; i < cityInfoList.length; i++) {
//         Map<String, dynamic> cityInfo = cityInfoList[i];
//         double lat = cityInfo['lat'];
//         double lon = cityInfo['lon'];
//         if (lat.toStringAsFixed(2) == coordinates.lat?.toStringAsFixed(2) &&
//             lon.toStringAsFixed(2) == coordinates.lon?.toStringAsFixed(2)) {
//           return true;
//         }
//       }
//     }
//     return false;
//   }
// }
