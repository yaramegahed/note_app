import 'package:flutter/cupertino.dart';
import 'package:note_app/features/edit_note/view/edit_note_screen.dart';
import 'package:note_app/features/home/logic/model/home_model.dart';

import 'custom_list_tile.dart';

class CustomHomeContainer extends StatelessWidget {
  final HomeModel note;
  final int index;

  const CustomHomeContainer(
      {super.key, required this.note, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => EditNoteScreen(
                note: note,
              ),
            ));
      },
      child: Container(
          padding: EdgeInsets.only(
            top: 16,
            bottom: 20,
          ),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
              )
            ],
            borderRadius: BorderRadius.circular(16),
            color: Color(0xFFffb7ce * index)
            // Color(note.color)
            // Color(0xFFFF8383)
            ,
          ),
          child: Column(
            children: [
              CustomListTile(note: note),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Text(
                      note.date,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
