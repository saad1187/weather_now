import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class WelcomeContainer extends StatelessWidget {
  final text, image;

  const WelcomeContainer({
    this.text,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.height * 0.04,
              ),
            ),
            GlowText(
              '"Weather Now"',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.height * 0.05,
              ),
            ),
          ],
        ),
        Spacer(),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: size.width * 0.04),
        ),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: size.height * 0.35,
          width: size.width * 0.9,
        ),
      ],
    );
  }
}
