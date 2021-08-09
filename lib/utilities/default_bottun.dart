import 'package:flutter/material.dart';

class DefaultBottun extends StatelessWidget {
  final String text;
  final onPress;
  final Color color;

  const DefaultBottun(
      {required this.text, required this.onPress, required this.color});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.075,
      width: double.infinity,
      // ignore: deprecated_member_use
      child: FlatButton(
        color: color,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Text(
          text,
          style: TextStyle(fontSize: size.width * 0.045, color: Colors.white),
        ),
        onPressed: onPress,
      ),
    );
  }
}
