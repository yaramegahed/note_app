import 'package:flutter/material.dart';

class CustomStack extends StatelessWidget {
  const CustomStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/Wall Polygon.png",
          fit: BoxFit.fill,
        ),
        Positioned(
          left: 110,
          top: 190,
          child: Image.asset(
            "assets/images/Illustration.png",
            fit: BoxFit.fill,
            height: 300,
          ),
        ),
      ],
    );
  }
}
