import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/features/edit_note/view/edit_note_screen.dart';

class CustomHomeContainer extends StatelessWidget {
  const CustomHomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => EditNoteScreen(),
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
                  color: Colors.white
                  // Color(0xFFFF8383)
                  ,
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        "To Do",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          "what the i am doing here",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            size: 30,
                            color: Colors.black,
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Text(
                            "May21, 2024",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
