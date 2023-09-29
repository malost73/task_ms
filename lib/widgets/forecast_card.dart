import 'package:flutter/material.dart';
import 'package:task_ms/utilities/forecast_util.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index) {
  var forecastList = snapshot.data.list;
  var dayOfWeek = '';
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(',')[0]; // Tue
  var tempMax = forecastList[index].temp.max.toStringAsFixed(0);
  var tempMin = forecastList[index].temp.min.toStringAsFixed(0);
  var icon = forecastList[index].getIconUrl();
  var description = forecastList[index].weather[0].description;
  return Column(
    children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                dayOfWeek,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          Image.network(icon, scale: 1.2),
          // Text(description.toString()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  '$tempMax° ',
                  style: const TextStyle(
                    fontSize: 18.0,
                    // color: Colors.white,
                  ),
                ),
                Text(
                  '/ $tempMin°',
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}
