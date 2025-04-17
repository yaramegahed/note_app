

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';

import '../../../../../core/constants.dart';
import '../../model/home_model.dart';
import 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  addNote(HomeModel homeModel) async {
    emit(AddNoteLoadingState());
    try {
      var notesBox = Hive.box<HomeModel>(kNotesBox);
      await notesBox.add(homeModel);
      emit(AddNoteSuccessState());

    } catch (e) {
      emit(AddNoteFailureState(e.toString()));
      }
      }
}
