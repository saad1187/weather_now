import 'package:flutter/widgets.dart';
import '/screens/city_screen.dart';
import '/screens/loading_screen.dart';
import '/screens/location_screen.dart';
import 'screens/WelcomScreen/welcomeScreen.dart';

// all our routes will be available here.
final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  LoadingScreen.routeName: (context) => LoadingScreen(),
  LocationScreen.routeName: (context) => LocationScreen(),
  CityScreen.routeName: (context) => CityScreen(),
};
