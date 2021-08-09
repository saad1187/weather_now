import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:weather_app/utilities/default_bottun.dart';
import 'package:weather_app/utilities/input_form_field.dart';

class CityScreen extends StatefulWidget {
  static String routeName = '/city';

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: GlowContainer(
          height: MediaQuery.of(context).size.height - size.height * 0.5,
          margin: EdgeInsets.all(size.width * 0.01),
          padding: EdgeInsets.only(
            top: size.width * 0.02,
            left: size.width * 0.01,
            right: size.width * 0.01,
          ),
          glowColor: Color(0xff00A1FF).withOpacity(0.5),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(size.width * 0.135),
            bottomRight: Radius.circular(size.width * 0.135),
          ),
          color: Color(0xff00A1FF),
          spreadRadius: size.width * 0.015,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.white),
                SizedBox(height: size.height * 0.05),
                InputFormField(
                  hintText: 'Enter The City Name',
                  labelText: 'Enter City Name',
                  textInputType: TextInputType.name,
                  icon: Icon(
                    Icons.location_city,
                    color: Color(0xff030317),
                  ),
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
                SizedBox(height: size.height * 0.05),
                DefaultBottun(
                    text: 'Get Weather',
                    onPress: () {
                      Navigator.pop(context, cityName);
                    },
                    color: Color(0xff030317)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
