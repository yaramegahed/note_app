import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_note_bottom.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
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
    );
  }
}
