
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meta_ahora/core/navigation/routes.dart';
import 'package:meta_ahora/goals/data/model/new_goal_DTO.dart';
import 'package:meta_ahora/goals/domain/register_goal_use_case.dart';
import 'package:meta_ahora/goals/presentation/blocs/states/add_goal_state.dart';

class AddGoalCubit extends Cubit<AddGoalState>{

  final RegisterGoalUseCase registerUseCase = RegisterGoalUseCase();
  
  AddGoalCubit() : super(AddGoalState.initial());

  void updateTitle(String value) {
    emit(state.update(title: value));
  }

  void updateDescription(String value) {
    emit(state.update(description: value));
  }

  void updateEndDate(int timestamp) {
    emit(state.update(endDate: timestamp));
  }

  void incrementPoints() {
    final current = state.points;
    emit(state.update(points: current + 1));
  }

  void decrementPoints() {
    final current = state.points;
    if (current != 0) {
      emit(state.update(points: current - 1));
    }
  }

  void registerGoal(String userId, BuildContext context) async {
    final registeredGoal = await registerUseCase.run(NewGoalDTO(
      userId: userId, 
      title: state.title, 
      description: state.description,
      points: state.points
    ));

    if(registeredGoal != null){
      context.go(Routes.goals.getParametredRoute(userId));
    } else {
      print("no se pudo agregar esta nueva meta");
    }
  }


}