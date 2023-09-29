import 'package:flutter/material.dart';
import 'package:task_ms/pages/fetch_data_page.dart';
import 'package:task_ms/pages/weather_forecast_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        primarySwatch: Colors.blue,
      ),
      home: const FetchDataPage(),
    );
  }
}
