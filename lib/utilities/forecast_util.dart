import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class ForecastUtil {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, y').format(dateTime); // Tue, May 5, 2020
  }

  static getItem(IconData iconData, int value, String units) {
    return Column(
      children: <Widget>[
        Icon(iconData, size: 28.0),
        const SizedBox(height: 10.0),
        Text(
          '$value',
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 10.0),
        Text(
          units,
          style: const TextStyle(fontSize: 15.0),
        ),
      ],
    );
  }
}
