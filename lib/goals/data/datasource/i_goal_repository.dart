
import 'package:meta_ahora/goals/data/model/GoalDTO.dart';

abstract class IGoalRepository {

  Future<List<GoalDTO>?> getAll(String userId);

}