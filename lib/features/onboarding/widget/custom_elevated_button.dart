import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../home/view/home_screen.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(context,
            CupertinoPageRoute(builder: (context) => HomeScreen(),));
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFFF8383),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5))),
      child: Text(
        "Get Started",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18),
      ),
    );
  }
}
