import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/features/home/view/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
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
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              child: Text(
                textAlign: TextAlign.center,
                "Create free notes & collaborate with your team",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Text(
                textAlign: TextAlign.center,
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean est elit, lobortis a mattis vel, aliquet ut ligula.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 15,),
            ElevatedButton(
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
            )
          ],
        ),
      ),
    );
  }
}
