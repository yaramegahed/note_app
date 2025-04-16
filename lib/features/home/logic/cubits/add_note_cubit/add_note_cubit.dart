import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/core/constants.dart';
import 'package:note_app/features/home/logic/model/home_model.dart';

import 'add_note_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  addNote(HomeModel homeModel) async {
    emit(HomeLoadingState());
    try {
      var notesBox = Hive.box(kNotesBox);
      await notesBox.add(homeModel);
      emit(HomeSuccessState());

    } catch (e) {
      emit(HomeFailureState(e.toString()));
    }
  }
}
