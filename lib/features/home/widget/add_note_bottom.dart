import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/features/home/logic/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/features/home/logic/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/features/home/logic/model/home_model.dart';
import 'package:note_app/features/home/widget/custom_button.dart';
import 'package:note_app/features/home/widget/custom_text_field.dart';
import '../logic/cubits/add_note_cubit/add_note_state.dart';

class AddNoteBottom extends StatefulWidget {
  const AddNoteBottom({super.key});

  @override
  State<AddNoteBottom> createState() => _AddNoteBottomState();
}

class _AddNoteBottomState extends State<AddNoteBottom> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailureState) {
            if (kDebugMode) {
              print("failed ${state.errorMassage}");
            }
          }
          if (state is AddNoteSuccessState) {
            BlocProvider.of<NotesCubit>(context).fetchNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoadingState ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        onSaved: (value) {
                          title = value;
                        },
                        hint: 'Title',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        onSaved: (value) {
                          subTitle = value;
                        },
                        maxLine: 6,
                        hint: 'Content',
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                        isLoading: state is AddNoteLoadingState ? true : false,
                        onTap: () {
                          var date = DateTime.now();
                          var formated = DateFormat.yMd().format(date);

                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            var homeModel = HomeModel(
                                title: title!,
                                subTitle: subTitle!,
                                date: formated,
                                color: Colors.white.value);
                            BlocProvider.of<AddNoteCubit>(context)
                                .addNote(homeModel);
                          } else {
                            autoValidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
