import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/core/constants.dart';
import 'package:note_app/features/home/logic/model/home_model.dart';

import 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  fetchNote() async {
    try {
      var notesBox = Hive.box<HomeModel>(kNotesBox);

      emit(NotesSuccessState(notesBox.values.toList()));
    } catch (e) {
      emit(NotesFailureState(e.toString()));
    }
  }
}
