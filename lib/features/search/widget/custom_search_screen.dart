import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const CustomSearchField({super.key, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 48,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Color(0xFF7D91FA), width: 2)),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: TextField(
          onChanged: onChanged,
          cursorColor: kPrimaryColor,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search",
            hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
                letterSpacing: 2),
            prefixIcon: Icon(Icons.search),
          ),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
