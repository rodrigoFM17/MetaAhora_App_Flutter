
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_ahora/goals/data/model/GoalDTO.dart';
import 'package:meta_ahora/goals/domain/get_particular_goal_use_case.dart';

class ParticularGoalCubit extends Cubit<GoalDTO?>{

  ParticularGoalCubit() : super(null);
  final GetParticularGoalUseCase getParticularGoalUseCase = GetParticularGoalUseCase();

  getParticularGoal(String userId) async {
    try {

      return await getParticularGoalUseCase.run(userId);

    } catch (e) {
      print(e);
      return null;
    }
  }

  deleteGoal(String goalId) {
    
  }
}