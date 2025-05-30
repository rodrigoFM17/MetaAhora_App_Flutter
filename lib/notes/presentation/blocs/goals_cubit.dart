import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_ahora/notes/data/datasource/INoteRepository.dart';
import 'package:meta_ahora/notes/data/model/GoalDTO.dart';
import 'package:meta_ahora/notes/data/repository/NoteRepository.dart';

class GoalsCubit extends Cubit<List<GoalDTO>?> {

  final INoteRepository noteRepository = NoteRepository();

  GoalsCubit() : super(null);

  getGoals(String userId) async {

    final goals = await noteRepository.getAll(userId);
    emit(goals);
  }

  setNotesList(List<GoalDTO> notes) {
    emit(notes);
  }



}