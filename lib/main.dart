import 'package:flutter/material.dart';
import 'navigation/app_navigation.dart';
import 'navigation/app_routes.dart';

void main() {
  runApp(const OrbitalDeskApp());
}

class OrbitalDeskApp extends StatelessWidget {
  const OrbitalDeskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OrbitalDesk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blueAccent),
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppNavigation.generateRoute,
    );
  }
}
