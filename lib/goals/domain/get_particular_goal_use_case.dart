
import 'package:meta_ahora/goals/data/datasource/i_goal_repository.dart';
import 'package:meta_ahora/goals/data/model/goal_DTO.dart';
import 'package:meta_ahora/goals/data/repository/goal_repository.dart';

class GetParticularGoalUseCase {

  final IGoalRepository goalRepository = GoalRepository();

  Future<GoalDTO?> run(String goalId) async  {
    try {
      final goal = await goalRepository.getParticular(goalId);
      print("goal obtenida: $goal");
      return goal;
    } catch (e) {
      print(e);
      return null;
    }
  }
}