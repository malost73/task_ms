import 'package:flutter/material.dart';
import 'package:task_ms/pages/fetch_data_page.dart';

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
        appBarTheme: const AppBarTheme(color: Color(0xFF343434)),
        scaffoldBackgroundColor: Colors.grey.shade900,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF2C6996),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const FetchDataPage(),
    );
  }
}
