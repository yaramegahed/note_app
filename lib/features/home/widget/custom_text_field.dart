import 'package:flutter/material.dart';
import 'package:note_app/core/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint, this.maxLine=1});
  final String hint;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLine,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: kPrimaryColor,
              letterSpacing: 2),
          focusedBorder: buildBorder(kPrimaryColor),
          enabledBorder: buildBorder(Colors.black),
        ));
  }

  OutlineInputBorder buildBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color, width: 1.5));
  }
}
