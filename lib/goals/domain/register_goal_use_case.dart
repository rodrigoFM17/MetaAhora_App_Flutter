

import 'package:meta_ahora/goals/data/datasource/i_goal_repository.dart';
import 'package:meta_ahora/goals/data/model/goal_DTO.dart';
import 'package:meta_ahora/goals/data/model/new_goal_DTO.dart';
import 'package:meta_ahora/goals/data/repository/goal_repository.dart';

class RegisterGoalUseCase {

  final IGoalRepository repository = GoalRepository();

  Future <GoalDTO?> run(NewGoalDTO newGoal) async {
    return await repository.register(newGoal);
  }
}