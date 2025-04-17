
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}
class AddNoteSuccessState extends AddNoteState {}
class AddNoteLoadingState extends AddNoteState {}
class AddNoteFailureState extends AddNoteState {
  final String errorMassage;

  AddNoteFailureState(this.errorMassage);

}
