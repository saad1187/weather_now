import 'package:flutter/material.dart';
import 'package:weather_app/routes.dart';
import 'package:weather_app/screens/WelcomScreen/welcomeScreen.dart';
import 'package:weather_app/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: theme(),
      initialRoute: WelcomeScreen.routeName,
      routes: routes,
    );
  }
}
