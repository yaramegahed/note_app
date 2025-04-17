import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/core/bloc_observer/bloc_observer.dart';
import 'package:note_app/core/constants.dart';
import 'package:note_app/features/home/logic/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/features/onboarding/view/onboarding_screen.dart';

import 'features/home/logic/cubits/add_note_cubit/add_note_cubit.dart';
import 'features/home/logic/model/home_model.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(HomeModelAdapter());
  await Hive.openBox<HomeModel>(kNotesBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NotesCubit()..fetchNotes()),
        BlocProvider(create: (_) => AddNoteCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnboardingScreen(),
      ),
    );
  }
}
