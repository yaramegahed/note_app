import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/widget/custom_app_bar.dart';
import 'package:note_app/features/home/logic/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/features/home/logic/model/home_model.dart';
import 'package:note_app/features/home/widget/custom_text_field.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key, required this.note});

  final HomeModel note;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        buttonOnPressed: () {
          widget.note.title = title ?? widget.note.title;
          widget.note.subTitle = content ?? widget.note.subTitle;
          widget.note.save();
          BlocProvider.of<NotesCubit>(context).fetchNotes();
          Navigator.pop(context);
        },
        arrowIcon: Icons.arrow_back_ios_new,
        onPressed: () {
          Navigator.pop(context);
        },
        title: 'Edit Note',
        icon: Icons.check,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              hint: widget.note.title,
              onChanged: (value) {
                title = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              onChanged: (value) {
                content = value;
              },
              hint: widget.note.subTitle,
              maxLine: 6,
            ),
          ],
        ),
      ),
    );
  }
}
