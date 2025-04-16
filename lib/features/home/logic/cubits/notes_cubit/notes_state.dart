
import 'package:note_app/features/home/logic/model/home_model.dart';

abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesLoadingState extends NotesState {}

class NotesSuccessState extends NotesState {
  final List<HomeModel>notes;

  NotesSuccessState(this.notes);
}

class NotesFailureState extends NotesState {
  final String errorMessage;

  NotesFailureState(this.errorMessage);
}
