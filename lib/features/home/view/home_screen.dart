import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/features/home/logic/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/features/home/logic/cubits/notes_cubit/notes_state.dart';
import 'package:note_app/core/widget/custom_app_bar.dart';
import 'package:note_app/features/home/widget/custom_home_container.dart';
import 'package:note_app/features/search/veiw/search_screen.dart';

import '../../../core/constants.dart';
import '../logic/model/home_model.dart';
import '../widget/floating_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingButton(),
      appBar: CustomAppBar(
        title: 'Notes',
        icon: Icons.search,
        buttonOnPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (BuildContext context) => SearchScreen()));
        },
        showBackButton: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<NotesCubit, NotesState>(
            builder: (context, state) {
              var box = Hive.box<HomeModel>(kNotesBox);
              var keys = box.keys.toList();
              List<HomeModel> notes =
                  BlocProvider.of<NotesCubit>(context).notes ?? [];
              return notes.isEmpty
                  ? Center(
                      child: Text(
                    "Try adding some Notes",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFFFF8383)),
                  ))
                  : Expanded(
                      child: ListView.builder(
                        itemCount: notes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Dismissible(
                              key: Key(keys[index].toString()),
                              onDismissed: (_) {
                                box.delete(keys[index]);
                                BlocProvider.of<NotesCubit>(context)
                                    .fetchNotes();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("Note deleted"),
                                  backgroundColor: Colors.green,
                                  behavior: SnackBarBehavior.floating,
                                ));
                              },
                              direction: DismissDirection.endToStart,
                              child: CustomHomeContainer(
                                note: notes[index],
                                index: (index + 11),
                              ));
                        },
                      ),
                    );
            },
          )
        ],
      ),
    );
  }
}
