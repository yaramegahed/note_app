import 'package:flutter/material.dart';
import 'package:note_app/core/widget/custom_app_bar.dart';
import 'package:note_app/features/home/widget/custom_text_field.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        arrowIcon: Icons.arrow_back_ios_new,
        onPressed: (){Navigator.pop(context);},
        title: 'Edit Note',
        icon: Icons.check,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(hint: "Title"),
            SizedBox(height: 20,),
            CustomTextField(hint: "Content",maxLine: 6,),
          ],
        ),
      ),

    );
  }
}
