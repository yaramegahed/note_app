import 'package:flutter/material.dart';
import 'package:note_app/features/onboarding/widget/custom_elevated_button.dart';
import 'package:note_app/features/onboarding/widget/custom_stack.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomStack(),
            SizedBox(height: 25,),
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
            SizedBox(height: 10,),
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
            CustomElevatedButton()
          ],
        ),
      ),
    );
  }
}
