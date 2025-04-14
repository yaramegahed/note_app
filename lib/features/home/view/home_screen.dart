import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/features/home/widget/add_note_bottom.dart';
import 'package:note_app/features/home/widget/custom_app_bar.dart';
import 'package:note_app/features/home/widget/custom_home_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddNoteBottom();
            },
          );
        },
        backgroundColor: Color(0xFF7D91FA),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Icon(
          CupertinoIcons.pen,
          size: 35,
          color: Colors.white,
        ),
      ),
      appBar: CustomAppBar(
        title: 'Notes',
        icon: Icons.search,
        showBackButton: false,
      ),
      body: Column(
        children: [CustomHomeContainer()],
      ),
    );
  }
}
