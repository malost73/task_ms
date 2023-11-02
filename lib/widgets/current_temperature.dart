import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_ms/models/weather_forecast.dart';

class CurrentTemperature extends StatelessWidget {
  final WeatherForecast weatherForecast;

  const CurrentTemperature({super.key, required this.weatherForecast});

  @override
  Widget build(BuildContext context) {
    var forecastList = weatherForecast.current;
    var icon = forecastList?.getIconUrl();
    var temp = forecastList?.temp?.toStringAsFixed(0);
    var description = forecastList!.weather![0].description.toUpperCase();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  '$temp°',
                  style: const TextStyle(
                    fontSize: 48.0,
                  ),
                ),
                // Image.network(icon!, scale: 0.7),
                icon != null
                    ? CachedNetworkImage(
                        imageUrl: icon,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    : Container(),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
