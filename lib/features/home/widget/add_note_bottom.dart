import 'package:flutter/material.dart';
import 'package:note_app/features/home/widget/custom_button.dart';
import 'package:note_app/features/home/widget/custom_text_field.dart';

class AddNoteBottom extends StatelessWidget {
  const AddNoteBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              hint: 'Title',
            ),
            SizedBox(height: 20,),
            CustomTextField(
              maxLine: 6,
              hint: 'Content',
            ),
            SizedBox(height: 50,),
            CustomButton()
          ],
        ),
      ),
    );
  }
}
