import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputFormField extends StatelessWidget {
  String labelText, hintText;
  final Widget icon;
  TextInputType textInputType;
  var onChanged;

  InputFormField({
    this.onChanged,
    required this.labelText,
    required this.hintText,
    required this.icon,
    required this.textInputType,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: icon,
      ),
      cursorColor: Color(0xff030317),
    );
  }
}
