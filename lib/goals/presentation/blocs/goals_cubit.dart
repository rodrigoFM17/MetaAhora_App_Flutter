import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_ahora/goals/data/datasource/i_goal_repository.dart';
import 'package:meta_ahora/goals/data/model/GoalDTO.dart';
import 'package:meta_ahora/goals/data/repository/GoalRepository.dart';

class GoalsCubit extends Cubit<List<GoalDTO>?> {

  final IGoalRepository noteRepository = GoalRepository();

  GoalsCubit() : super(null);

  getGoals(String userId) async {

    final goals = await noteRepository.getAll(userId);
    emit(goals);
  }

  setNotesList(List<GoalDTO> goals) {
    emit(goals);
  }



}