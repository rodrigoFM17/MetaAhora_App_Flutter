
import 'package:meta_ahora/goals/data/datasource/i_goal_repository.dart';
import 'package:meta_ahora/goals/data/model/GoalDTO.dart';
import 'package:meta_ahora/goals/data/repository/GoalRepository.dart';

class GetParticularGoalUseCase {

  final IGoalRepository goalRepository = GoalRepository();

  Future<GoalDTO?> run(String userId) async  {
    try {
      return goalRepository.getParticular(userId);
    } catch (e) {
      print(e);
      return null;
    }
  }
}