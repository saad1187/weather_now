import 'package:flutter/material.dart';
import 'package:weather_app/screens/WelcomScreen/body.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WelcomeBody(),
      ),
    );
  }
}
