
import 'package:flutter/material.dart';
import 'package:meta_ahora/share/widgets/app_bar.dart';
import 'package:meta_ahora/notes/presentation/widgets/notes_list.dart';

class NotesScreen extends StatelessWidget{

  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF232323),
      appBar: getNotesAppBar(context: context, showAddButton: true),
      body: NotesList(),
    );
  }
}