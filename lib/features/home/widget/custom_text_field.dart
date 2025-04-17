import 'package:flutter/material.dart';
import 'package:note_app/core/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hint, this.maxLine = 1, this.onSaved, this.onChanged});

  final String hint;
  final int maxLine;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "field is required";
          } else {
            return null;
          }
        },
        onChanged: onChanged,
        onSaved: onSaved,
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
          border: buildBorder(Colors.red)
        ));
  }

  OutlineInputBorder buildBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color, width: 1.5));
  }
}
