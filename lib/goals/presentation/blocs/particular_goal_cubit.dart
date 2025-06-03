
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_ahora/goals/data/model/goal_DTO.dart';
import 'package:meta_ahora/goals/domain/get_particular_goal_use_case.dart';

class ParticularGoalCubit extends Cubit<GoalDTO?>{

  ParticularGoalCubit() : super(null);
  final GetParticularGoalUseCase getParticularGoalUseCase = GetParticularGoalUseCase();

  getParticularGoal(String goalId) async {
    final goal = await getParticularGoalUseCase.run(goalId);
    emit(goal);
  }

  deleteGoal(String goalId) {
    
  }
}