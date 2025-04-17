import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/cubits/notes_cubit/notes_cubit.dart';
import '../logic/model/home_model.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.note,
  });

  final HomeModel note;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        note.title,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,letterSpacing: 1),
      ),
      subtitle: Text(
        note.subTitle,
        style: TextStyle(
          letterSpacing: 1.5,
          fontSize: 20,
        ),
      ),
      trailing: IconButton(
          onPressed: () {
            note.delete();
            BlocProvider.of<NotesCubit>(context).fetchNotes();
          },
          icon: Icon(
            Icons.delete,
            size: 30,
            color: Colors.grey.shade800,
          )),
    );
  }
}
