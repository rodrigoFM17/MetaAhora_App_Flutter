
import 'package:meta_ahora/goals/data/model/goal_DTO.dart';
import 'package:meta_ahora/goals/data/model/new_goal_DTO.dart';

abstract class IGoalRepository {

  Future<List<GoalDTO>?> getAll(String userId);
  Future<GoalDTO?> getParticular(String userId);
  Future<GoalDTO?> register(NewGoalDTO newGoal);

}