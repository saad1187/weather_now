import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:weather_app/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  static String routeName = '/location';

  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  late int temperature;
  late String weatherIcon;
  late String cityName;
  late String weatherMessage;
  var windSpeed;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        cityName = '';
        windSpeed = 0;
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      cityName = weatherData['name'];
      windSpeed = weatherData['wind']['speed'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff030317),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GlowContainer(
                height: MediaQuery.of(context).size.height - size.height * 0.1,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: size.width * 0.05),
                          child: IconButton(
                            onPressed: () async {
                              var weatherData =
                                  await weather.getLocationWeather();
                              updateUI(weatherData);
                            },
                            icon: Icon(
                              Icons.location_on,
                              size: size.width * 0.1,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: size.width * 0.05),
                          child: IconButton(
                            onPressed: () async {
                              var typedName = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CityScreen();
                                  },
                                ),
                              );
                              if (typedName != null) {
                                var weatherData =
                                    await weather.getCityWeather(typedName);
                                updateUI(weatherData);
                              }
                            },
                            icon: Icon(
                              Icons.search,
                              size: size.width * 0.1,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Colors.white),
                    Center(
                      child: GlowText(
                        '$cityName',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: size.width * 0.2,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      // padding: EdgeInsets.only(left: 15.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            weatherIcon,
                            style: TextStyle(fontSize: size.width * 0.40),
                          ),
                          GlowText(
                            '$temperature°',
                            style: TextStyle(
                                fontSize: size.width * 0.25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Divider(color: Colors.white),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: size.width * 0.05,
                          left: size.width * 0.25,
                          right: size.width * 0.25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Wind',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: size.width * 0.04,
                            ),
                          ),
                          SizedBox(width: size.width * 0.05),
                          Icon(
                            CupertinoIcons.wind,
                            color: Colors.white,
                          ),
                          SizedBox(width: size.width * 0.05),
                          Text(
                            '$windSpeed Km/h',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: size.width * 0.04,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
