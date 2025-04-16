import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/home/logic/model/home_model.dart';
import 'package:note_app/features/home/widget/custom_button.dart';
import 'package:note_app/features/home/widget/custom_text_field.dart';

import '../logic/cubits/add_note_cubit/add_note_cubit.dart';
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
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is HomeFailureState) {
              if (kDebugMode) {
                print("failed ${state.errorMassage}");
              }
            }
            if (state is HomeSuccessState) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is HomeLoadingState ? true : false,
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
                          isLoading: state is HomeLoadingState ? true : false,
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              var homeModel = HomeModel(
                                  title: title!,
                                  subTitle: subTitle!,
                                  date: DateTime.now().toString(),
                                  color: Colors.blue.value);
                              BlocProvider.of<HomeCubit>(context)
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
      ),
    );
  }
}
