import 'package:flutter/material.dart';
import 'package:weather_app/screens/loading_screen.dart';
import 'package:weather_app/utilities/default_bottun.dart';

import 'welcomeContainer.dart';

class WelcomeBody extends StatefulWidget {
  @override
  _WelcomeBodyState createState() => _WelcomeBodyState();
}

class _WelcomeBodyState extends State<WelcomeBody> {
  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {'text': "The easy way to know the weather!", 'image': 'images/sunny.png'},
    {
      'text': "At any Time.. \nFor any Place in the World!",
      'image': 'images/rainy.png'
    },
    {'text': "Let's Go!", 'image': 'images/thunder.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          Expanded(
            flex: 3,
            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (context, index) => WelcomeContainer(
                text: splashData[index]['text'],
                image: splashData[index]['image'],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  DefaultBottun(
                    color: Color(0xff00A1FF),
                    text: 'Continue',
                    onPress: () {
                      Navigator.pushNamed(context, LoadingScreen.routeName);
                    },
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 4),
      height: 7,
      width: currentPage == index ? 20 : 7,
      decoration: BoxDecoration(
        color: currentPage == index ? Color(0xff00A1FF) : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
