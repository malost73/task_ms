import 'package:flutter/material.dart';
import 'package:task_ms/core/services/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF343434)),
        scaffoldBackgroundColor: Colors.grey.shade900,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF2C6996),
        ),
        primarySwatch: Colors.blue,
      ),
    );
  }
}
