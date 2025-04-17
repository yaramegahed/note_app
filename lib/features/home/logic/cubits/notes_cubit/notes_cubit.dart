import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/core/constants.dart';
import 'package:note_app/features/home/logic/model/home_model.dart';

import 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<HomeModel>? notes;
  List<HomeModel> allNotes = [];


  fetchNotes() {
    var notesBox = Hive.box<HomeModel>(kNotesBox);
    notes = notesBox.values.toList();
    allNotes=List.from(notes??[]);
    emit(NotesSuccessState());
  }

  void searchNotes(String? query) {
    if (query == null || query.isEmpty) {
      notes = List.from(allNotes);
    } else {
      notes = allNotes.where((note) {
        return note.title.toLowerCase().contains(query.toLowerCase()) ||
            note.subTitle.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    emit(NotesSuccessState());
  }
}
