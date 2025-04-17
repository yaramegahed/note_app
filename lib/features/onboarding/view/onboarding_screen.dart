import 'package:flutter/material.dart';
import 'package:note_app/features/onboarding/widget/custom_elevated_button.dart';
import 'package:note_app/features/onboarding/widget/custom_stack.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomStack(),
            SizedBox(height: 35,),
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
            SizedBox(height: 15,),
            SizedBox(
              child: Text(
                textAlign: TextAlign.center,
                "Organize your thoughts, capture your ideas, and turn everyday moments into lasting notes.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20,),
            CustomElevatedButton()
          ],
        ),
      ),
    );
  }
}
